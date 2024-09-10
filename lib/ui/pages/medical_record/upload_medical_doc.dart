import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/patient_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/booking_appointment_patient.dart';
import '../../../model/user.dart';
import '../../app/app_config.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import 'package:http/http.dart' as http;

import '../../routes/routes.dart';
import '../../theme/theme.dart';
import '../appointment/image_overview_in_medical_records.dart';
import '../appointment/image_overview_in_queue_page.dart';
import '../complaints/add_complaints_page.dart';
import 'image_overview.dart';
import 'medical_record_details.dart';

class UploadMedicalDoc extends StatefulWidget {
  final User? name;
  final User? email;
  final User? id;
  final BookingAppointmentPatient? data;

  const UploadMedicalDoc({Key? key, this.name, this.email, this.id, this.data})
      : super(key: key);

  @override
  State<UploadMedicalDoc> createState() => _UploadMedicalDocState();
}

class _UploadMedicalDocState extends State<UploadMedicalDoc> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var selectedfile;
  var uploadedImage;

  var appointmentId;
  var userId;

  late ApiBuilderBloc bloc;

  @override
  initState() {
    super.initState();
    setState(() {
      appointmentId = widget.data?.Appointment_id;
      userId = widget.data?.User_id;
    });
    bloc = ApiBuilderBloc(
        path: 'ViewMedicalRecords',
        query: {'Appointment_id': appointmentId},
        raw: true);
  }

  imageUpload(description, date) async {
    print('entered image function');
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.timesmed.com/WebAPI2/UploadRecordFile'));
    request.fields['Appointment_Id'] = appointmentId.toString();
    request.files.add(await http.MultipartFile.fromPath(
      selectedfile.name,
      selectedfile.path,
    ));
    request.fields['Description'] = description.toString();
    request.fields['Date'] = date.toString();

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
      descriptionController.text = "";
      dateController.text = "";
      selectedfile = null;
      bloc.add(const Load());
      bloc.add(const Refresh());
    });
    await Fluttertoast.showToast(
        msg: "Files added successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
    print('exit function');
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.PATIENT_DETAILS),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProvider(
                    data: Consts.DUMMY_USER.copyWith(
                      userId: widget.data?.User_id,
                      fullName: widget.data?.User_Name,
                      phone: widget.data?.MobileNumber,
                      whatsapp: widget.data?.MobileNumber,
                      email: widget.data?.Emailid,
                    ),
                    child: const PatientTile()),
                const Divider(
                  endIndent: 10,
                  indent: 0,
                  thickness: 0.5,
                ),
                Text(
                  'Upload Files',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 16,
                ),
                (selectedfile == null || selectedfile == '')
                    ? FileUpload(
                        margin: const EdgeInsets.all(0),
                        title: 'Upload files',
                        subTitle: 'Choose your files to upload',
                        onChanged: (imageFile) async {
                          setState(() {
                            selectedfile = imageFile;
                            uploadedImage = selectedfile;
                          });
                          print(
                              "selected file::::::::::::::::::::::::::::::::::::$selectedfile");
                        },
                      )
                    : Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 150.0,
                              height: 150.0,
                              child: Image.file(
                                  File(selectedfile.path.toString())),
                            ),
                            Positioned(
                              right: 5.0,
                              child: InkWell(
                                child: const Icon(
                                  Icons.remove_circle_outline_outlined,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                // This is where the _image value sets to null on tap of the red circle icon
                                onTap: () {
                                  setState(
                                    () {
                                      selectedfile = null;
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Description',
                  maxLines: 5,
                  minLines: 3,
                  controller: descriptionController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MDateTimePicker(
                  start: DateTime(2000),
                  end: DateTime(2100),
                  label: 'Date',
                  onChanged: (d) {
                    final DateFormat formatter = DateFormat('MM/dd/yyyy');
                    final String formatted = formatter.format(d!);
                    dateController.text = formatted;
                    print(dateController);
                  },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: const Text('Add'),
                    onPressed: () async {
                      print("onpressed below");
                      if (selectedfile == null) {
                        await Fluttertoast.showToast(
                            msg: "Please pick a file",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }
                      if (descriptionController.text.isEmpty) {
                        await Fluttertoast.showToast(
                            msg: "Description field cant be empty",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }

                      print(selectedfile);
                      await imageUpload(
                          descriptionController.text, dateController.text);
                      print("onpressed above");
                      setState(() {
                        descriptionController.text = "";
                        dateController.text = "";
                        selectedfile = null;
                        bloc.add(const Load());
                        bloc.add(const Refresh());
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  Consts.PREVIOUS_RECORDS,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 10),
                BlocProvider(
                  create: (_) => bloc..add(const Load()),
                  child: ApiBuilder(
                      shrinkWrap: true,
                      jsonBuilder: (data, load) {
                        return SizedBox(
                          height: 400,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => FileViewList(
                              name: data[index]["Name"].toString(),
                              appointmentId: appointmentId.toString(),
                              description: data[index]["Description"] ?? "Null",
                              date: data[index]["Date"] ?? "Null",
                              recordsId: data[index]["id"],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FileViewList extends StatefulWidget {
  final String name;
  final String description;
  final String date;
  final String appointmentId;
  final int? recordsId;
  final Function? deleteVoidCallBack;

  const FileViewList({
    Key? key,
    required this.name,
    required this.description,
    required this.date,
    required this.appointmentId,
    this.recordsId,
    this.deleteVoidCallBack,
  }) : super(key: key);

  @override
  State<FileViewList> createState() => _FileViewListState();
}

class _FileViewListState extends State<FileViewList> {
  late ApiBuilderBloc viewRecordsDeleteBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.recordsId);
    print("prints record id");
    viewRecordsDeleteBloc = ApiBuilderBloc(
      path: 'ViewMedicalRecords',
      query: {
        'Appointment_id': widget.appointmentId.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MListTile(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // const FaIcon(
            //   FontAwesomeIcons.file,
            //   color: MTheme.ICON_COLOR,
            // ),
            Image.asset(
              "assets/images/file_icon.png",
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.date,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            MIconButton(
              onTap: () {
                if (AppConfig.of(context)?.config == Config.patient) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageOverviewInQueuePage(
                              appointmentId: widget.appointmentId,
                              name: widget.name,
                              description: widget.description,
                            )),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageOverviewInMedicalRecords(
                              appointmentId: widget.appointmentId,
                              name: widget.name,
                              description: widget.description,
                            )),
                  );
                }
              },
              color: MTheme.THEME_COLOR,
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.remove_red_eye,
                color: MTheme.THEME_COLOR,
                size: 18,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            MIconButton(
              onTap: () async {
                if (AppConfig.of(context)?.config == Config.patient) {
                  final call = Injector()
                      .apiService
                      .get(path: 'DeleteMedicalRecords', query: {
                    'id': widget.recordsId,
                  });
                  print(widget.recordsId.toString());
                  print("prints record id");
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  print(res?.error);
                  print(res?.isSuccessful);
                  print(res?.body);
                  print(res?.statusCode);
                  print(res?.base);

                  if (res?.body.message == "Deleted SuccessFully") {
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      setState(() {
                        viewRecordsDeleteBloc.add(const Refresh());
                      });
                    });
                    await Fluttertoast.showToast(
                        msg: "Deleted Successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                    widget.deleteVoidCallBack!();
                    print("Runs delete function");
                  }
                } else {
                  final call = Injector()
                      .apiService
                      .get(path: 'DeleteMedicalRecords', query: {
                    'id': widget.recordsId,
                  });
                  print(widget.recordsId.toString());
                  print("prints record id");
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  print(res?.error);
                  print(res?.isSuccessful);
                  print(res?.body);
                  print(res?.statusCode);
                  print(res?.base);

                  if (res?.body.message == "Deleted SuccessFully") {
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      setState(() {
                        viewRecordsDeleteBloc.add(const Refresh());
                      });
                    });
                    await Fluttertoast.showToast(
                        msg: "Deleted Successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                    widget.deleteVoidCallBack!();
                    print("Runs delete function");
                  }
                }
              },
              color: MTheme.THEME_COLOR,
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.delete,
                color: Colors.red.shade400,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
