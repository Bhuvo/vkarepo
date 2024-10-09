import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/patient_tile.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/scheduled_appointment_list_item.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/widgets/data_add_and_search.dart';
import 'package:timesmedlite/ui/pages/complaints/add_complaint_dialog.dart';
import 'package:timesmedlite/ui/pages/complaints/complaint_list_item.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/booking_appointment_patient.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import 'detailed_add_complaint_dialog.dart';
import 'detailed_add_diagnose_dialog.dart';
import 'detailed_add_observation_dialog.dart';

class DetailedClinicalNotes extends StatefulWidget {
  final BookingAppointmentPatient? data;

  const DetailedClinicalNotes({Key? key, this.data}) : super(key: key);

  static const List<String> complaints = [
    'Plaque',
    'Difficulty in moving Jaws',
    'Swelling in Gums',
    'Swelling in Jaws',
    'Difficulty in Chewing',
  ];

  static const List<String> complaintsList = ['Fever', 'Headache', 'Cold'];
  static const List<String> observationList = [
    'Ablation, Uterus(Endometrial Ablation)'
  ];
  static const List<String> diagnoseList = ['Coronal Cavities'];
  static const List<String> notesList = ['Bleaching'];

  static TextEditingController statusController = TextEditingController();

  static TextEditingController dateController = TextEditingController();
  static TextEditingController timeController = TextEditingController();

  @override
  State<DetailedClinicalNotes> createState() => _DetailedClinicalNotesState();
}

class _DetailedClinicalNotesState extends State<DetailedClinicalNotes> {
  String? status;
  var getComplaintsName;
  static TextEditingController complaintController = TextEditingController();
  static TextEditingController observationController = TextEditingController();
  static TextEditingController diagnoseController = TextEditingController();
  static TextEditingController notesController = TextEditingController();

  var appointmentId;
  var userId;
  var complaintId;
  var observationId;
  var notesId;
  var diagnoseId;

  late ApiBuilderBloc followUpDateAndTime;
  late ApiBuilderBloc complaintBloc;
  late ApiBuilderBloc observationBloc;
  late ApiBuilderBloc diagnoseBloc;
  late ApiBuilderBloc notesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      appointmentId = widget.data?.Appointment_id;
      userId = widget.data?.User_id;
    });
    print(appointmentId);
    print(userId);
    print("user id and appoinmentid");
    print("${LocalStorage.getUID()} - doctor id");
    followUpDateAndTime = ApiBuilderBloc(
      path: 'Get_Appointment_Follow_Up_List',
      query: {
        "Appointment_Id": appointmentId,
      },
      api2: true,
    );
    complaintBloc = ApiBuilderBloc(
        path: 'Get_Detail_Clinical_Notes',
        query: {
          'Appointment_Id': appointmentId,
        },
        api2: true);
    observationBloc = ApiBuilderBloc(
        path: 'Get_Detail_Clinical_Notes',
        query: {
          'Appointment_Id': appointmentId,
        },
        api2: true);
    diagnoseBloc = ApiBuilderBloc(
        path: 'Get_Detail_Clinical_Notes',
        query: {
          'Appointment_Id': appointmentId,
        },
        api2: true);
    notesBloc = ApiBuilderBloc(
        path: 'Get_Detail_Clinical_Notes',
        query: {
          'Appointment_Id': appointmentId,
        },
        api2: true);
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.PATIENT_DETAILS),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              'Detail Clinical Notes and Treatment',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),

            // DataAddAndSearch(
            //   entity: 'Complaint',
            //   items: ['Fever', 'Headache', 'Cold'],
            // ),
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                // MTextField(
                //   label: 'Complaint',
                //   controller: DetailedClinicalNotes.complaintController,
                //   suffixIcon: const Icon(FontAwesomeIcons.comment),
                // ),
                MSearchDown<Map<String, dynamic>>(
                  controller: complaintController,
                  label: 'Complaints',
                  hint: 'Search Complaints',
                  labelKey: 'Complaint_Name',
                  //subTitleKey: 'DoctorCategory_id',
                  suffixIcon: const Icon(CupertinoIcons.search),
                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector()
                        .apiService
                        .get2(path: 'Get_All_Needs_Search?Doctor_id=${LocalStorage.getUID().toString()}&Search_Keyword=$d&Type=1',
                    //     query: {
                    //   'DoctorId': LocalStorage.getUID().toString(),
                    //   'Search_Keyword': d,
                    //   'Type': 1
                    // }
                    );
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("SUCCESS");
                      print("${res.body?.data['Complaint_List']}");

                      if (res.body?.data['Complaint_List'] is List) {
                        print("res.bodyString is List");
                        for (var e
                            in res.body?.data['Complaint_List'] as List) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }else{
                      print('Failed ${res.body?.data.toString()}');
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX${d}");
                    setState(() {
                      complaintController.text = d!['Complaint_Name'];
                      getComplaintsName = complaintController.text;

                      print(getComplaintsName);
                      print("printing complaints");
                      complaintId = d!['Id'];
                      // data = data.copyWith(doctorQualificationCode: d!['Id']);
                    });
                  },
                ),

                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: const Text('Add'),
                    onPressed: () async {
                      print("change clicked");
                      if (complaintController.text.isEmpty) {
                        await Fluttertoast.showToast(
                            msg: "Complaint field cant be empty",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      } else {
                        final call = Injector()
                            .apiService
                            .rawGet2(path: 'Add_Detail_Complaints', query: {
                          "Appointment_Id": appointmentId.toString(),
                          "User_Id": userId.toString(),
                          "Doctor_Id": LocalStorage.getUID().toString(),
                          "Id": complaintId.toString(),
                          "Complaint_Name": complaintController.text,
                        });
                        final res = await showWaitingDialog(
                            context: context, call: call);
                        print("${res?.body} body");
                        print("${res?.error} error");
                        print("${res?.statusCode} statusCode");
                        print("${res?.body["ResponseMessage"]} message");
                        if (res?.body["ResponseMessage"] ==
                            "Complaint Added Successfully") {
                          setState(() {
                            complaintBloc.add(const Refresh());
                            complaintController.text = "";
                          });
                          await Fluttertoast.showToast(
                              msg: "Complaint Added Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                        print("change done");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Complaints Added here',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocProvider(
                  create: (c) => complaintBloc..add(const Load()),
                  child: ApiBuilder(
                      shrinkWrap: true,
                      jsonBuilder: (data, load) {
                        // print(data[0]["Complaint_List"][0]["Complaint_Name"]);
                        // print("printing datadaa");
                        return data[0]["Complaint_List"].length == 0
                            ? const SizedBox(
                                height: 50,
                                child: Text('No records Found'),
                              )
                            : SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data[0]["Complaint_List"].length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Column(
                                    children: [
                                      ListTile(
                                        title: Text(data[0]["Complaint_List"]
                                            [index]["Complaint_Name"]),
                                        trailing: MIconButton(
                                          padding: const EdgeInsets.all(4),
                                          onTap: () async {
                                            final call = Injector()
                                                .apiService
                                                .get2(
                                                    path: 'Delete_Detail_Notes',
                                                    query: {
                                                  'Id': data[0]
                                                          ["Complaint_List"]
                                                      [index]["Id"],
                                                  'Type': 1,
                                                });
                                            print(
                                              data[0]["Complaint_List"][index]
                                                  ["Id"],
                                            );
                                            print("start of delete func");
                                            final res = await showWaitingDialog(
                                                context: context, call: call);
                                            if (res?.body.message ==
                                                "Deleted") {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 100),
                                                  () async {
                                                setState(() {
                                                  complaintBloc
                                                      .add(const Refresh());
                                                });
                                              });
                                              await Fluttertoast.showToast(
                                                  msg: "Deleted Successfully",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.white,
                                                  textColor: Colors.black,
                                                  fontSize: 16.0);
                                            }
                                          },
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        endIndent: 0,
                                        indent: 0,
                                        thickness: 0.5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }),
                ),
                MListTile(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Column(
                      children: [
                        // MRadioTiles(
                        //   items: AddComplaintsPage.complaints
                        //       .map((e) => MRadioItem(value: e))
                        //       .toList(),
                        //   onChanged: (d) {},
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    'If you are not able to find your complaint in the list, \nplease'),
                            TextSpan(
                              text: ' Add New Complaint ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: MTheme.THEME_COLOR),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () => showDialog(
                              //       context: context,
                              //       builder: (c) => const AddComplaintDialog()),
                            ),
                            TextSpan(text: 'here.'),
                          ]),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: OutlinedButton(
                            child: const Text('Add New Complaint'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (c) =>
                                      const DetailedAddComplaintDialog());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
                const Divider(
                  endIndent: 0,
                  indent: 0,
                  thickness: 0.5,
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
            // DataAddAndSearch(
            //   entity: 'Observation',
            //   items: [
            //     'Ablation, Uterus(Endometrial Ablation)',
            //   ],
            // ),
            Column(children: [
              const SizedBox(
                height: 8,
              ),
              // MTextField(
              //   label: 'Observation',
              //   controller: DetailedClinicalNotes.observationController,
              //   suffixIcon: const Icon(FontAwesomeIcons.comment),
              // ),
              MSearchDown<Map<String, dynamic>>(
                controller: observationController,
                label: 'Observation',
                hint: 'Search Observation',
                labelKey: 'Complaint_Name',
                //subTitleKey: 'DoctorCategory_id',
                suffixIcon: const Icon(CupertinoIcons.search),

                onSearched: (String d) async {
                  print(d);
                  final res = await Injector()
                      .apiService
                      .get2(path: 'Get_All_Needs_Search?Doctor_id=${LocalStorage.getUID().toString()}&Search_Keyword=$d&Type=2',
                  //     query: {
                  //   'DoctorId': LocalStorage.getUID().toString(),
                  //   'Search_Keyword': d,
                  //   'Type': 2
                  // }
                  );
                  List<Map<String, dynamic>> list = [];
                  if (res.isSuccessful) {
                    print("SUCCESS");
                    print("${res.body?.data['Observation_List']}");

                    if (res.body?.data['Observation_List'] is List) {
                      print("res.bodyString is List");
                      for (var e
                          in res.body?.data['Observation_List'] as List) {
                        list.add(e as Map<String, dynamic>);
                      }
                    }
                  }
                  return list;
                },
                onChanged: (d) {
                  print("XXXXXXXXXXXXXX${d}");
                  setState(() {
                    // data = data.copyWith(qualificationName: d!['Name']);
                    observationController.text = d!['Complaint_Name'];
                    // getComplaintsName = complaintController.text;

                    // data = data.copyWith(doctorQualificationCode: d!['Id']);
                    observationId = d!['Id'];
                  });
                },
                // controller: qualificationcontroller
                //   ..text = data.qualificationName ?? '',
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 50,
                width: double.maxFinite,
                child: OutlinedButton(
                  child: const Text('Add'),
                  onPressed: () async {
                    print("change clicked");
                    if (observationController.text.isEmpty) {
                      await Fluttertoast.showToast(
                          msg: "Observation field cant be empty",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else {
                      final call = Injector()
                          .apiService
                          .rawGet2(path: 'Add_Observation', query: {
                        "Appointment_Id": appointmentId,
                        "User_Id": userId,
                        "Doctor_Id": LocalStorage.getUID().toString(),
                        "Id": observationId,
                        "Complaint_Name": observationController.text,
                      });
                      final res =
                          await showWaitingDialog(context: context, call: call);
                      print("${res?.body} body");
                      print("${res?.error} error");
                      print("${res?.statusCode} statusCode");
                      print("${res?.body["ResponseMessage"]} message");
                      if (res?.body["ResponseMessage"] ==
                          "Observation Added Successfully") {
                        setState(() {
                          observationBloc.add(const Refresh());
                          observationController.text = "";
                        });

                        await Fluttertoast.showToast(
                            msg: "Observation Added Successfully",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }
                    }
                    observationController.text = "";
                    print("change done");
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Observations Added here',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 12,
              ),
              BlocProvider(
                create: (c) => observationBloc..add(const Load()),
                child: ApiBuilder(
                    shrinkWrap: true,
                    jsonBuilder: (data, load) {
                      return data[0]["Observation_List"].length == 0
                          ? const SizedBox(
                              height: 50,
                              child: Text('No records Found'),
                            )
                          : SizedBox(
                              height: 120,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data[0]["Observation_List"].length,
                                itemBuilder:
                                    (BuildContext context, int index) => Column(
                                  children: [
                                    ListTile(
                                      title: Text(data[0]["Observation_List"]
                                          [index]["Complaint_Name"]),
                                      trailing: MIconButton(
                                        padding: const EdgeInsets.all(4),
                                        onTap: () async {
                                          final call = Injector()
                                              .apiService
                                              .get2(
                                                  path: 'Delete_Detail_Notes',
                                                  query: {
                                                'Id': data[0]
                                                        ["Observation_List"]
                                                    [index]["Id"],
                                                'Type': 2,
                                              });
                                          print(
                                            data[0]["Observation_List"][index]
                                                ["Id"],
                                          );
                                          final res = await showWaitingDialog(
                                              context: context, call: call);
                                          if (res?.body.message == "Deleted") {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 100),
                                                () async {
                                              setState(() {
                                                observationBloc
                                                    .add(const Refresh());
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
                                          }
                                        },
                                        color: Colors.red,
                                        child: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      endIndent: 0,
                                      indent: 0,
                                      thickness: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
              ),
              MListTile(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  child: Column(
                    children: [
                      // MRadioTiles(
                      //   items: AddComplaintsPage.complaints
                      //       .map((e) => MRadioItem(value: e))
                      //       .toList(),
                      //   onChanged: (d) {},
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text:
                                  'If you are not able to find your complaint in the list, \nplease'),
                          TextSpan(
                            text: ' Add New Observation ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: MTheme.THEME_COLOR),
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () => showDialog(
                            //       context: context,
                            //       builder: (c) => const AddComplaintDialog()),
                          ),
                          TextSpan(text: 'here.'),
                        ]),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: OutlinedButton(
                          child: const Text('Add New Observation'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (c) =>
                                    const DetailedAddObservationDialog());
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
              // DataAddAndSearch(
              //   entity: 'Diagnoses',
              //   items: ['Coronal Cavities'],
              // ),
              const Divider(
                endIndent: 0,
                indent: 0,
                thickness: 0.5,
                height: 8,
              ),

              Column(children: [
                const SizedBox(
                  height: 8,
                ),
                // MTextField(
                //   label: 'Diagnose',
                //   controller: DetailedClinicalNotes.diagnoseController,
                //   suffixIcon: const Icon(FontAwesomeIcons.comment),
                // ),
                MSearchDown<Map<String, dynamic>>(
                  controller: diagnoseController,
                  label: 'Diagnose',
                  hint: 'Search Diagnose',
                  labelKey: 'Complaint_Name',
                  //subTitleKey: 'DoctorCategory_id',
                  suffixIcon: const Icon(CupertinoIcons.search),

                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector()
                        .apiService
                        .get2(path: 'Get_All_Needs_Search?Doctor_id=${LocalStorage.getUID().toString()}&Search_Keyword=$d&Type=3',
                    //     query: {
                    //   'DoctorId': LocalStorage.getUID().toString(),
                    //   'Search_Keyword': d,
                    //   'Type': 3
                    // }
                    );
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("SUCCESS");
                      print("${res.body?.data['Diagnose_List']}");

                      if (res.body?.data['Diagnose_List'] is List) {
                        print("res.bodyString is List");
                        for (var e in res.body?.data['Diagnose_List'] as List) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }else{
                      print("ERROR type 3 ${res.bodyString}");
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX${d}");
                    setState(() {
                      // data = data.copyWith(qualificationName: d!['Name']);
                      diagnoseController.text = d!['Complaint_Name'];
                      // data = data.copyWith(doctorQualificationCode: d!['Id']);
                      diagnoseId = d!['Id'];
                      print(diagnoseId);
                      print(diagnoseController.text);
                    });
                  },
                  // controller: qualificationcontroller
                  //   ..text = data.qualificationName ?? '',
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: const Text('Add'),
                    onPressed: () async {
                      print("change clicked");
                      if (diagnoseController.text.isEmpty) {
                        await Fluttertoast.showToast(
                            msg: "Diagnose field cant be empty",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      } else {
                        final call = Injector()
                            .apiService
                            .rawGet2(path: 'Add_Diagnose', query: {
                          "Appointment_Id": appointmentId,
                          "User_Id": userId,
                          "Doctor_Id": LocalStorage.getUID().toString(),
                          "Id": diagnoseId,
                          "Complaint_Name": diagnoseController.text,
                        });
                        final res = await showWaitingDialog(
                            context: context, call: call);
                        print("${res?.body} body");
                        print("${res?.error} error");
                        print("${res?.statusCode} statusCode");
                        print("${res?.body["ResponseMessage"]} message");
                        if (res?.body["ResponseMessage"] ==
                            "Diagnose Added Successfully") {
                          setState(() {
                            diagnoseBloc.add(const Refresh());
                            diagnoseController.text = "";
                          });
                          await Fluttertoast.showToast(
                              msg: "Diagnose Added Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      }
                      diagnoseController.text = "";
                      print("change done");
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Diagnoses Added here',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocProvider(
                  create: (c) => diagnoseBloc..add(const Load()),
                  child: ApiBuilder(
                      shrinkWrap: true,
                      jsonBuilder: (data, load) {
                        return data[0]["Diagnose_List"].length == 0
                            ? const SizedBox(
                                height: 50,
                                child: Text('No records Found'),
                              )
                            : SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data[0]["Diagnose_List"].length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Column(
                                    children: [
                                      ListTile(
                                        title: Text(data[0]["Diagnose_List"]
                                            [index]["Complaint_Name"]),
                                        trailing: MIconButton(
                                          padding: const EdgeInsets.all(4),
                                          onTap: () async {
                                            final call = Injector()
                                                .apiService
                                                .get2(
                                                    path: 'Delete_Detail_Notes',
                                                    query: {
                                                  'Id': data[0]["Diagnose_List"]
                                                      [index]["Id"],
                                                  'Type': 3,
                                                });
                                            print(
                                              data[0]["Diagnose_List"][index]
                                                  ["Id"],
                                            );
                                            final res = await showWaitingDialog(
                                                context: context, call: call);
                                            if (res?.body.message ==
                                                "Deleted") {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 100),
                                                  () async {
                                                setState(() {
                                                  diagnoseBloc
                                                      .add(const Refresh());
                                                });
                                              });
                                              await Fluttertoast.showToast(
                                                  msg: "Deleted Successfully",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.white,
                                                  textColor: Colors.black,
                                                  fontSize: 16.0);
                                            }
                                          },
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        endIndent: 0,
                                        indent: 0,
                                        thickness: 0.5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }),
                ),
                MListTile(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Column(
                      children: [
                        // MRadioTiles(
                        //   items: AddComplaintsPage.complaints
                        //       .map((e) => MRadioItem(value: e))
                        //       .toList(),
                        //   onChanged: (d) {},
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    'If you are not able to find your complaint in the list, \nplease'),
                            TextSpan(
                              text: ' Add New Diagnose ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: MTheme.THEME_COLOR),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () => showDialog(
                              //       context: context,
                              //       builder: (c) => const AddComplaintDialog()),
                            ),
                            TextSpan(text: 'here.'),
                          ]),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: OutlinedButton(
                            child: const Text('Add New Diagnose'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (c) =>
                                      const DetailedAddDiagnoseDialog());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
                // DataAddAndSearch(
                //   entity: 'Notes',
                //   items: ['Bleaching'],
                // ),
                const Divider(
                  endIndent: 0,
                  indent: 0,
                  thickness: 0.5,
                  height: 8,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    MTextField(
                      label: 'Notes',
                      controller: notesController,
                      suffixIcon: const Icon(FontAwesomeIcons.comment),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: OutlinedButton(
                        child: const Text('Add'),
                        onPressed: () async {
                          print("change clicked");
                          if (notesController.text.isEmpty) {
                            await Fluttertoast.showToast(
                                msg: "Notes field cant be empty",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          } else {
                            final call = Injector()
                                .apiService
                                .rawGet2(path: 'Add_Notes', query: {
                              "Appointment_Id": appointmentId,
                              "User_Id": userId,
                              "Doctor_Id": LocalStorage.getUID().toString(),
                              "Complaint_Name": notesController.text,
                            });

                            final res = await showWaitingDialog(
                                context: context, call: call);
                            print("${res?.body} body");
                            print("${res?.error} error");
                            print("${res?.statusCode} statusCode");
                            print("${res?.body["ResponseMessage"]} message");
                            if (res?.body["ResponseMessage"] ==
                                "Notes Added Successfully") {
                              setState(() {
                                notesBloc.add(const Refresh());
                                notesController.text = "";
                              });
                              await Fluttertoast.showToast(
                                  msg: "Notes Added Successfully",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                            }
                          }

                          print("change done");
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Notes',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlocProvider(
                      create: (c) => notesBloc..add(const Load()),
                      child: ApiBuilder(
                          shrinkWrap: true,
                          jsonBuilder: (data, load) {
                            return data[0]["Notes_List"].length == 0
                                ? const SizedBox(
                                    height: 50,
                                    child: Text('No records Found'),
                                  )
                                : SizedBox(
                                    height: 120,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data[0]["Notes_List"].length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              Column(
                                        children: [
                                          ListTile(
                                            title: Text(data[0]["Notes_List"]
                                                [index]["Complaint_Name"]),
                                            trailing: MIconButton(
                                              padding: const EdgeInsets.all(4),
                                              onTap: () async {
                                                final call = Injector()
                                                    .apiService
                                                    .get2(
                                                        path:
                                                            'Delete_Detail_Notes',
                                                        query: {
                                                      'Id': data[0]
                                                              ["Notes_List"]
                                                          [index]["Id"],
                                                      'Type': 4,
                                                    });
                                                print(
                                                  data[0]["Notes_List"][index]
                                                      ["Id"],
                                                );
                                                final res =
                                                    await showWaitingDialog(
                                                        context: context,
                                                        call: call);
                                                if (res?.body.message ==
                                                    "Deleted") {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                    setState(() {
                                                      notesBloc
                                                          .add(const Refresh());
                                                    });
                                                  });
                                                  await Fluttertoast.showToast(
                                                      msg:
                                                          "Deleted Successfully",
                                                      toastLength:
                                                          Toast.LENGTH_LONG,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.white,
                                                      textColor: Colors.black,
                                                      fontSize: 16.0);
                                                }
                                              },
                                              color: Colors.red,
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            endIndent: 0,
                                            indent: 0,
                                            thickness: 0.5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                    ),
                    // FileUpload(
                    //   margin: EdgeInsets.all(0),
                    //   title: 'Upload Files',
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Container(
                    //   height: 50,
                    //   width: double.maxFinite,
                    //   child: OutlinedButton(
                    //     child: Text('Add'),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    const Divider(
                      height: 32,
                      endIndent: 0,
                      indent: 0,
                      thickness: 0.5,
                    ),
                    // MListTile(
                    //   margin: const EdgeInsets.all(0),
                    //   child: Column(
                    //     children: const [
                    //       SizedBox(
                    //         height: 8,
                    //       ),
                    //       MTextContent2(
                    //           head: 'Treatment Name :',
                    //           content: 'Immunotherapy'),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(
                    //           head: 'Bill Type / Status :', content: 'xxxxx'),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(
                    //           head: 'Package Amount / Quantity :',
                    //           content: 'xxxx'),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(head: 'Procedure :', content: 'xxxx'),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(head: 'Update :', content: 'xxxx'),
                    //       SizedBox(
                    //         height: 8,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const Divider(
                    //   height: 32,
                    //   endIndent: 0,
                    //   indent: 0,
                    //   thickness: 0.5,
                    // ),

                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Follow Up Date and Time',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MDateTimePicker(
                          start: DateTime(2000),
                          end: DateTime(2100),
                          label: 'Date',
                          onChanged: (d) {
                            final DateFormat formatter =
                                DateFormat('MM/dd/yyyy');
                            final String formatted = formatter.format(d!);
                            DetailedClinicalNotes.dateController.text =
                                formatted;
                            print(DetailedClinicalNotes.dateController);
                          },
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: MTextField(
                          label: 'Time',
                          suffixIcon: const Icon(FontAwesomeIcons.solidClock),
                          controller: DetailedClinicalNotes.timeController,
                          hint: '00:00 AM/PM',
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 45,
                      // width: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Pending"),
                              value: "Pending",
                              groupValue: status,
                              activeColor: MTheme.THEME_COLOR,
                              onChanged: (value) {
                                setState(() {
                                  status = value.toString();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Completed"),
                              value: "Completed",
                              groupValue: status,
                              activeColor: MTheme.THEME_COLOR,
                              onChanged: (value) {
                                setState(() {
                                  status = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: OutlinedButton(
                        child: const Text('Change'),
                        onPressed: () async {
                          print("change clicked");
                          final call = Injector()
                              .apiService
                              .get2(path: 'Add_Followup_Appointment', query: {
                            'Appointment_Id': appointmentId,
                            'Follow_Up_Date':
                                DetailedClinicalNotes.dateController.text,
                            'Follow_Up_Time':
                                DetailedClinicalNotes.timeController.text,
                            'Status': status.toString(),
                          });
                          final res = await showWaitingDialog(
                              context: context, call: call);
                          print(res?.body);
                          print(res?.statusCode);
                          print(res?.error);
                          print(res?.body.message);
                          if (res?.body.message ==
                              "Followup Updated Successfully") {
                            await Fluttertoast.showToast(
                                msg: res?.body.message,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);

                            DetailedClinicalNotes.timeController.text = "";
                            DetailedClinicalNotes.dateController.text = "";
                            followUpDateAndTime.add(
                              const UpdateQuery(
                                {},
                              ),
                            );
                            context.pop();
                          }
                          print("change done");
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Follow Up Date and Time Previous Record',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    BlocProvider(
                      create: (c) => followUpDateAndTime..add(const Load()),
                      child: ApiBuilder(
                          shrinkWrap: true,
                          jsonBuilder: (data, load) {
                            // print(data);
                            // print("printing data");
                            var dataValue = data.length - 1;
                            var date = data[dataValue]['Date']?.split(" ")[0];
                            // var datetime = DateFormat('EEEE, MMM d, yyyy').format(data[dataValue]['Date']?.split(" ")[0]);
                            var time = data[dataValue]['Time'];
                            var statusFlag = data[dataValue]['Follow_Up_Flag'];

                            return ListTile(
                              leading: const Icon(
                                Icons.calendar_today,
                                color: MTheme.BUTTON_COLOR,
                              ),
                              title: Text('$date  $time'),
                              trailing: Text(statusFlag),
                            );
                          }),
                    ),

                    // MListTile(
                    //   margin: const EdgeInsets.all(0),
                    //   child: Column(
                    //     children: const [
                    //       SizedBox(
                    //         height: 8,
                    //       ),
                    //       MTextContent2(
                    //           head: 'Treatment Cost',
                    //           content: '₹ 300',
                    //           gulugulu: true,
                    //           bold: true),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(
                    //         head: 'Amount Paid',
                    //         content: '₹ 200',
                    //         gulugulu: true,
                    //         bold: true,
                    //         contentColor: Colors.green,
                    //       ),
                    //       Divider(
                    //         endIndent: 0,
                    //         indent: 0,
                    //         thickness: 0.5,
                    //       ),
                    //       MTextContent2(
                    //         head: 'Balance Amount to Pay',
                    //         content: '₹ 100',
                    //         gulugulu: true,
                    //         bold: true,
                    //         contentColor: Colors.red,
                    //       ),
                    //       SizedBox(
                    //         height: 8,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(6),
                    //   width: double.maxFinite,
                    //   height: 50,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Expanded(
                    //         child: OutlinedButton(
                    //           onPressed: () {},
                    //           style: OutlinedButton.styleFrom(
                    //               backgroundColor:
                    //                   Theme.of(context).scaffoldBackgroundColor,
                    //               side: const BorderSide(
                    //                   color: MTheme.ICON_COLOR)),
                    //           child: const Text('Payment History'),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 12,
                    //       ),
                    //       // Expanded(
                    //       //   child: OutlinedButton(
                    //       //     child: const Text('Pay'),
                    //       //     onPressed: () {},
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ]),
            ]),
          ]),
        ),
      ),
    );
  }
}
