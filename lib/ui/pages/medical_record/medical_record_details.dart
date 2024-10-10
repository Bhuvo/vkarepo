import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/medical_record.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/pages/medical_record/medical_record_list_item.dart';
import 'package:timesmedlite/ui/pages/medical_record/prescription_print.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_filled_button.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/file_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/appointment_data.dart';
import '../../../model/view_records.dart';
import '../../../temp/screen/pateint/doctor_profile.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/shimmer/shimmer_list.dart';
import '../../components/waiting_dialog.dart';
import '../appointment/image_overview_in_medical_records.dart';
import '../appointment/image_overview_in_queue_page.dart';
import 'package:http/http.dart' as http;

class MedicalRecordDetails extends StatefulWidget {
  final int i;
  final MedicalRecord? data;
  final AppointmentData? appointment;
  final appointment_id;

  const MedicalRecordDetails(
      {Key? key, this.i = 0, this.data, this.appointment, this.appointment_id})
      : super(key: key);

  @override
  State<MedicalRecordDetails> createState() => _MedicalRecordDetailsState();
}

class _MedicalRecordDetailsState extends State<MedicalRecordDetails> {
  late ApiBuilderBloc bloc;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var selectedfile;
  var uploadedImage;
  bool isLoading = false;

  Future<void> imageUpload(description, date, appointmentId) async {
    print('entered image function');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.timesmed.com/WebAPI2/UploadRecordFile'));
    request.fields['Appointment_Id'] = widget.appointment_id.toString();
    request.files.add(await http.MultipartFile.fromPath(
      selectedfile.name,
      selectedfile.path,
    ));
    request.fields['Description'] = "Uploaded Medical Record";
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('dd/MM/yyyy hh:mm a').format(now);
    print(formattedDateTime);
    request.fields['Date'] = formattedDateTime.toString();

    var res = await request.send().then((response) {
      print(response.statusCode);
      print("response here");

      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
        });
      }
    });
    setState(() {
      // descriptionController.text = "";
      // dateController.text = "";
      // selectedfile = null;
      // bloc.add(const Load());
      // bloc.add(const Refresh());
    });
    await Fluttertoast.showToast(
        msg: "Image Uploaded successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
    print('exit function');
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${widget.appointment_id} ,${LocalStorage.getUID().toString()} , ${widget.data?.User_id} prints appointment id");
    bloc = ApiBuilderBloc(
        path: 'ViewMedicalRecords',
        query: {
          'Appointment_id': widget.appointment_id.toString(),
          // 'Appointment_id': 197558,
        },
        raw: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // late ApiBuilderBloc bloc;
    print(
        'Test                  ${widget.appointment?.id} ${LocalStorage.getUID()}');
    print("runs bloc");
    return MScaffold(
      title: Text(Consts.MEDICAL_RECORDS.toUpperCase()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Hero(
                tag: 'MEDICAl::${widget.i}',
                child: MedicalRecordListItem(
                  data: widget.data,
                  appointment: widget.appointment,
                  isHeader: true,
                )),
            // Text('data["prescription"]: ${widget.data?.prescription}'),
            // if (widget.data?.prescription is List)
              Container(
                // padding: EdgeInsets.all(5),
                decoration:BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            Consts.PRESCRIPTION,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () async {
                                print("DATA::::::::: ${widget.appointment}");
                                widget.data?.prescription.length == 0
                                    ? await Fluttertoast.showToast(
                                    msg: "No Prescription added by doctor",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0)
                                    : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrescriptionPrint(
                                        data: widget.data?.prescription,
                                        appointment: widget.appointment),
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.print,
                                    size: 15,
                                    color: MTheme.ICON_COLOR,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Print')
                                ],
                              ))
                        ],
                      ),
                    ),
                    if (widget.data?.prescription is List) ...List.generate((widget.data?.prescription.length ?? 0), (i) {
                      final d = widget.data?.prescription[i];

                      return PrescriptionListItem(
                        data: d,
                        onTap: () {
                          // final List<Map<String, dynamic>> list = [];
                          // for (final e in widget.data?.prescription ?? []) {
                          //   list.add(e);
                          // }
                          // context.push(Routes.prescribeProductList, {'data': list});
                        },
                      );
                    }),
                    if (widget.data?.prescription is !List) NothingWidget(
                        icon: Icons.receipt,
                        message: 'No Prescription added by doctor',
                        title: 'No Prescription'),
                    if (widget.data?.prescription is List) Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16) + EdgeInsets.only(bottom: 8),
                      child: FilledButton.icon(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(MTheme.THEME_COLOR)),onPressed: () {
                        final List<Map<String, dynamic>> list = [];
                        for (final e in widget.data?.prescription ?? []) {
                          list.add(e);
                        }
                        context.push(Routes.prescribeProductList, {'data': list});
                      }, label: Text('Add to cart'),
                      icon: Icon(Icons.add_shopping_cart, size: 19, color: Colors.white,), ),
                    )
                  ],
                ),
              ),
            // MListTile(
            //     color: Colors.red.shade50,
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Doctor Notes',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .headlineSmall
            //                 ?.copyWith(fontSize: 14, color: Colors.red),
            //           ),
            //           Row(),
            //           Text(
            //             'Follow the above mentioned Drugs for 5 days',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .bodySmall
            //                 ?.copyWith(fontWeight: FontWeight.w600),
            //           )
            //         ],
            //       ),
            //     )),
            Container(
              margin: const EdgeInsets.symmetric( vertical: 8),
              decoration:BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16) + EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          Consts.LABTEST,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        // TextButton(
                        //     onPressed: () {
                        //
                        //     },
                        //     child: Row(
                        //       children: const [
                        //         Icon(
                        //           Icons.print,
                        //           size: 15,
                        //           color: MTheme.ICON_COLOR,
                        //         ),
                        //         SizedBox(
                        //           width: 8,
                        //         ),
                        //         Text('Print')
                        //       ],
                        //     ))
                      ],
                    ),
                  ),
                  BlocProvider(
                    create: (c) => ApiBuilderBloc(
                      path: 'get_laboratoryNew_SRMC',
                      query: {
                        'user_id': LocalStorage.getCursorPatient().userId,
                        'Appointment_id': widget.appointment_id.toString(),
                      },
                    )..add(const Load()),
                    child: ApiBuilder(
                        empty: const NothingWidget(
                            icon: Icons.receipt,
                            message: 'No Lab Test added by doctor',
                            title: 'No Lab Test'),
                        shrinkWrap: true,
                        jsonBuilder: (data, load) {
                          print("dataaaaaaaaaa                  $data");
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: ListView.builder(
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => MListTile(
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: DefaultTextStyle(
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 13,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index]["DeptName"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  'Test Name: ${data[index]["labtest_name"]}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontWeight: FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Instructions: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight.w600),
                                                    ),
                                                    Text(
                                                      data[index]["finding"],
                                                      style: const TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                        ],
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16) + EdgeInsets.only(bottom: 8),
                                child: FilledButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(MTheme.THEME_COLOR)) ,onPressed:(){}, child: Text('Book Lab Test'),),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    Consts.HEALTH_RECORDS,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: size.height * 0.015),
                  ),
                  const Spacer(),
                  // Text(
                  //   '2 Items',
                  //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  //       fontSize: size.height * 0.015,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.grey.shade400),
                  // ),
                ],
              ),
            ),
            BlocProvider(
              create: (_) => bloc
                ..add(
                  const Load(),
                ),
              child: ApiBuilder(
                shrinkWrap: true,
                loading: const ShimmerList(
                  height: 80,
                  padding: EdgeInsets.all(16),
                  length: 2,
                ),
                jsonBuilder: (list, load) {
                  print(list);
                  print("prints list from view records api");
                  return SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.17,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FileListItem(
                          description: list[index]["Description"],
                          name: list[index]["Name"],
                          appointmentId: widget.appointment_id.toString(),
                          imageId: list[index]["id"],
                          functionToRefreshTheList: () {
                            bloc.add(
                              const Refresh(),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            /// commented the fileupload code
            // FileUpload(
            //   margin: const EdgeInsets.all(0),
            //   title: 'Upload files',
            //   subTitle: 'Choose your files to upload',
            //   onChanged: (imageFile) async {
            //     setState(() {
            //       selectedfile = imageFile;
            //       uploadedImage = selectedfile;
            //     });
            //     descriptionController.text = "Uploaded Medical Record";
            //     DateTime now = DateTime.now();
            //     String formattedDateTime =
            //         DateFormat('dd/MM/yyyy hh:mm a').format(now);
            //     print(formattedDateTime);
            //     await imageUpload(
            //       descriptionController.text,
            //       formattedDateTime,
            //       widget.appointment_id.toString(),
            //     );
            //     bloc.add(
            //       const Refresh(),
            //     );
            //     print(
            //         "selected file::::::::::::::::::::::::::::::::::::$selectedfile");
            //   },
            // ),
            // buildUploadRecords(context, "157224", () {
            //   bloc.add(
            //     const Refresh(),
            //   );
            // }, () {
            //   DateTime now = DateTime.now();
            //   String formattedDateTime =
            //       DateFormat('dd/MM/yyyy hh:mm a').format(now);
            //   print(formattedDateTime);
            //   imageUpload(
            //       "Uploaded Medical Record", formattedDateTime, "157224");
            // }),
            // Container(
            //   width: double.maxFinite,
            //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   height: 50,
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     child: const Text('Upload Records'),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}

FileUpload buildUploadRecords(BuildContext context, var apId,
    Function functionToRefreshBloc, Function functionToPickAImageAndPostIt) {
  return FileUpload(
    // title: 'Upload any medical records ( Image or PDF )',
    subTitle: 'Upload any medical records ( Image jpeg Format* )',
    onChanged: (d) async {
      print("open file image explorer function runs here");
      print("$apId prints appointment id");

      functionToPickAImageAndPostIt();
      functionToRefreshBloc();
    },
  );
}

class PrescriptionListItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback? onTap;

  const PrescriptionListItem({Key? key, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      onTap: onTap ??
          () {
            ///TODO: Implement Prescription in Medical Records
          },
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if(kDebugMode)...data.keys.map((e) => Text('$e: ${data[e]}')),
            Text(
              '${data['drug_name']}',
              style:
                  Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14),
            ),
            Row(),
            Text(
              // 'Frequency: ${data['frequency']}, ${data['duration']} Day, Qty: ${data['dosage']}, ${data['FoodInstr']}, Instruction: ${data['instruction']}',
              'Frequency: ${data['frequency']}, ${data['duration']} Day, Qty: ${data['dosage']}, Instruction: ${data['instruction']}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class FileListItem extends StatelessWidget {
  final String description;
  final String? date;
  final String? name;
  final String? appointmentId;
  final int? imageId;
  final Function? functionToRefreshTheList;

  const FileListItem(
      {Key? key,
      required this.description,
      this.date,
      this.name,
      this.appointmentId,
      this.imageId,
      this.functionToRefreshTheList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MListTile(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.file,
              color: MTheme.ICON_COLOR,
              size: size.height * 0.028,
            ),
            SizedBox(
              width: size.width * 0.032,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: size.height * 0.018),
                  ),
                  Text(
                    name ?? "240 kb",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: size.height * 0.015),
                  )
                ],
              ),
            ),
            MIconButton(
              child: Icon(
                Icons.remove_red_eye,
                color: MTheme.THEME_COLOR,
                size: size.height * 0.022,
              ),
              onTap: () {
                // context.push(Routes.documentPreview, {
                //   'docs': ['test', 'test2'],
                //   'title': 'AUG 25 2022'
                // });
                print("clicked");
                Navigator.push(
                  context,
                  // MaterialPageRoute(
                  //   builder: (context) => ImageOverviewInMedicalRecords(
                  //     appointmentId: appointmentId!,
                  //     name: name! ?? "No Name",
                  //     description: description,
                  //   ),
                  // ),
                  MaterialPageRoute(
                    builder: (context) => ImageOverviewInQueuePage(
                      appointmentId: appointmentId!,
                      name: name! ?? "No Name",
                      description: description,
                    ),
                  ),
                );
              },
              color: MTheme.THEME_COLOR,
              padding: const EdgeInsets.all(8),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            MIconButton(
              onTap: () async {
                final call = Injector()
                    .apiService
                    .get(path: 'DeleteMedicalRecords', query: {
                  'id': imageId,
                });
                print("prints record id");
                final res =
                    await showWaitingDialog(context: context, call: call);
                print(res?.error);
                print(res?.isSuccessful);
                print(res?.body);
                print(res?.statusCode);
                print(res?.base);

                if (res?.body.message == "Deleted SuccessFully") {
                  // Future.delayed(const Duration(milliseconds: 100), () async {
                  //   setState(() {
                  //     viewRecordsDeleteBloc.add(const Refresh());
                  //   });
                  // });
                  await Fluttertoast.showToast(
                      msg: "Deleted Successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 16.0);
                  // widget.deleteVoidCallBack!();
                  functionToRefreshTheList!();
                  print("Runs delete function");
                }
              },
              color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: size.height * 0.022,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
