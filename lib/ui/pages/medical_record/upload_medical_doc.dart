import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/patient_tile.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
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
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<ImageModel> selectedfile = [];
  var uploadedImage;
  bool isLoading = false;

  var appointmentId;
  var userId;
  int indexCount =0;
  late ApiBuilderBloc bloc;

  @override
  initState() {
    super.initState();
    setState(() {
      print('Appointment id ${widget.data?.Appointment_id}');
      appointmentId = widget.data?.Appointment_id;
      userId = widget.data?.User_id;
      dateController.text = DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now());
    });
    bloc = ApiBuilderBloc(
        path: 'ViewMedicalRecords',
        query: {'Appointment_id': appointmentId},
        raw: true);
  }

  imageUpload(description, date) async {
    final DateFormat formatter = DateFormat('MM/dd/yyyy hh:mm a');
    setState(() {
      isLoading = true;
    });
    print('entered image function');
    if(selectedfile == null){
      print("no file selected");
      return;
    }

    for(int i = 0; i < selectedfile!.length; i++) {
      var request = await http.MultipartRequest(
          'POST',
          Uri.parse('https://api.timesmed.com/WebAPI2/UploadRecordFile'));
      request.fields['Appointment_Id'] = appointmentId.toString();

      // for(int i = 0; i < selectedfile!.length; i++){
      request.files.add(await http.MultipartFile.fromPath(
        selectedfile![i].file!.name,
        selectedfile![i].file!.path ?? '',
      ));
      // }
      request.fields['Title'] = selectedfile[i].title ?? '';
      request.fields['Description'] =  selectedfile[i].description ?? '';
      request.fields['Date'] = formatter.format(selectedfile[i].date ?? DateTime.now());

      var res = await request.send();
      if(res.statusCode == 200){
        print(res.statusCode);
        print("response here");

        if (res.statusCode == 200) {
          res.stream.transform(utf8.decoder).listen((value) {
            print(value);
          });
        }else{
          showMessage(context: context, message:'Error in uploading file');
          break;
        }
      }

    }
    setState(() {
      descriptionController.text = "";
      dateController.text = "";
      selectedfile = [];
      // bloc.add(const Load());
      bloc.add(const Refresh());
      isLoading = false;
      indexCount== 0;
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
      title: const Text('Upload Medical Documents'),
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                (selectedfile == null || selectedfile!.isEmpty)
                    ? FileUpload(
                   onMultiple: (list)async {
                     setState(() {
                       print('lenght of list ${list.length} , ${selectedfile.length}');
                       list.map((e) => selectedfile.add(ImageModel(e, '','',DateTime.now(), e  ))).toList();
                     });
                     // uploadedImage = selectedfile;
                   },
                        margin: const EdgeInsets.all(0),
                        title: 'Upload files',
                        subTitle: 'Choose your files to upload',
                        // onChanged: (imageFile) async {
                        //   setState(() {
                        //     selectedfile = imageFile;
                        //     uploadedImage = selectedfile;
                        //   });
                        //   print(
                        //       "selected file::::::::::::::::::::::::::::::::::::$selectedfile");
                        // },
                      )
                    : Container(
                  height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedfile.length ?? 0,
                        itemBuilder: (context , index){
                          return  Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(8.0),
                            color:indexCount == index ? MTheme.BUTTON_COLOR: Colors.grey.shade300,
                            child: Stack(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      indexCount = index;
                                      descriptionController.text = selectedfile[index].description?? '';
                                      titleController.text = selectedfile[index].title?? '';
                                      dateController.text = DateFormat('MM/dd/yyyy hh:mm a').format(selectedfile![index].date!);
                                    });
                                  },
                                  child: Container(
                                    width: 150.0,
                                    height: 200.0,
                                    child: Image.file(
                                      fit: BoxFit.fill,
                                        File(selectedfile![index].file!.path.toString())),
                                  ),
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
                                          selectedfile.removeAt(index);
                                          if(selectedfile.isEmpty){
                                            selectedfile = [];
                                          }
                                        },
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                const SizedBox(
                  height: 16,
                ),
                (selectedfile.length ??0) == 0 ?  Container() : MTextField(
                  label: 'Title ${indexCount + 1}',
                  // maxLines: 5,
                  // minLines: 3,
                  onChanged: (val){
                    selectedfile[indexCount].title = val;
                  },
                  controller: titleController,
                ),

                (selectedfile?.length??0) == 0 ?  Container() :  const SizedBox(
                  height: 10,
                ),
            (selectedfile.length ??0) == 0 ?  Container() : MTextField(
                  label: 'Description ${indexCount + 1}',
                  maxLines: 5,
                  minLines: 3,
                  onChanged: (val){
                    selectedfile![indexCount].description = val;
                  },
                  controller: descriptionController,
                ),
                (selectedfile?.length??0) == 0 ?  Container() :  const SizedBox(
                  height: 10,
                ),
                (selectedfile?.length??0) == 0 ?  Container() : MDateTimePicker(
                  key:ValueKey('$indexCount value ${selectedfile[indexCount].date} '),
                  initial:((selectedfile?.length ?? 0)>0) ? (selectedfile[indexCount].date ?? DateTime.now()) : DateTime.now(),
                  start: DateTime(2000),
                  end: DateTime(2100),
                  label: 'Date ${indexCount + 1}',
                  onChanged: (d) {
                    selectedfile![indexCount].date = d;
                    print('Date $indexCount :: $d');
                    final DateFormat formatter = DateFormat('MM/dd/yyyy hh:mm a');
                    final String formatted = formatter.format(d!);
                    dateController.text = formatted;
                    print('dateController ${dateController.text}');
                    setState(() {});
                  },
                ),
                selectedfile.length == 0 ?  Container() :const SizedBox(height: 50),
                selectedfile.length == 0 ?  Container() : SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: isLoading? LoadingWidget(): Text('Add'),
                    onPressed: () async {
                      print("onpressed below");
                      if (selectedfile.isEmpty) {
                        await Fluttertoast.showToast(
                            msg: "Please pick a file",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }
                      // if (descriptionController.text.isEmpty) {
                      //   await Fluttertoast.showToast(
                      //       msg: "Description field cant be empty",
                      //       toastLength: Toast.LENGTH_LONG,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.white,
                      //       textColor: Colors.black,
                      //       fontSize: 16.0);
                      // }

                      print(selectedfile);
                      await imageUpload(
                          descriptionController.text, dateController.text);
                      print("onpressed above");
                      setState(() {
                        descriptionController.text = "";
                        dateController.text = "";
                        selectedfile = [];
                        bloc.add(const Load());
                        bloc.add(const Refresh());
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  Consts.PREVIOUS_RECORDS,
                  style: Theme.of(context).textTheme.bodySmall,
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
                              key: ValueKey(data[index]),
                              title: data[index]["Title"] ==''? null : data[index]["Title"],
                              name: data[index]["Name"].toString(),
                              appointmentId: appointmentId.toString(),
                              description: data[index]["Description"] ?? "Null",
                              date: data[index]["Date"] ?? "Null",
                              recordsId: data[index]["id"],
                              deleteVoidCallBack: (val){
                                print('delet pop $val');
                              },
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
  final String? title;
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
    this.deleteVoidCallBack, this.title,
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
                  widget.title != null ? Text(
                    'Title : ${widget.title?? 'dd'}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 14,color: Colors.black),
                  ): Container(),
                  Text(
                    'Description : ${widget.description}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.date,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            MIconButton(
              onTap: () {
                print(widget.name);
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
                        builder: (context) => ImageOverviewInQueuePage(
                          appointmentId: widget.appointmentId,
                          name: widget.name,
                          description: widget.description,
                        )),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ImageOverviewInMedicalRecords(
                  //             appointmentId: widget.appointmentId,
                  //             name: widget.name,
                  //             description: widget.description,
                  //           )),
                  // );
                }
              },
              color: MTheme.THEME_COLOR,
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.remove_red_eye,
                color: MTheme.THEME_COLOR,
                size: 18,
              ),            ),
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

                  // if (res?.body.message == "Deleted SuccessFully") {
                  //   Future.delayed(const Duration(milliseconds: 100), () async {
                  //     setState(() {
                  //       viewRecordsDeleteBloc.add(const Refresh());
                  //     });
                  //   });
                  //   await Fluttertoast.showToast(
                  //       msg: "Deleted Successfully",
                  //       toastLength: Toast.LENGTH_LONG,
                  //       gravity: ToastGravity.BOTTOM,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.white,
                  //       textColor: Colors.black,
                  //       fontSize: 16.0);
                  //   widget.deleteVoidCallBack!();
                  //   print("Runs delete function");
                  // }
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



class ImageModel{
  PlatformFile? file;
   String? description;
   String? title;
   DateTime? date;
  PlatformFile? image;

  ImageModel(this.file, this.description,this.title, this.date, this.image);
}