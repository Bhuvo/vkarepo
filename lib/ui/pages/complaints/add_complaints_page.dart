import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/patient_tile.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/scheduled_appointment_list_item.dart';
import 'package:timesmedlite/ui/pages/complaints/add_complaint_dialog.dart';
import 'package:timesmedlite/ui/pages/complaints/complaint_list_item.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/booking_appointment_patient.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class AddComplaintsPage extends StatefulWidget {
  final BookingAppointmentPatient? data;

  const AddComplaintsPage({Key? key, this.data}) : super(key: key);

  static const List<String> complaints = [
    'Plaque',
    'Difficulty in moving Jaws',
    'Swelling in Gums',
    'Swelling in Jaws',
    'Difficulty in Chewing',
  ];

  @override
  State<AddComplaintsPage> createState() => _AddComplaintsPageState();
}

class _AddComplaintsPageState extends State<AddComplaintsPage> {
  TextEditingController getComplaintsController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var getComplaintsName;
  var getComplaintId;

  var appointmentId;
  var userId;
  late ApiBuilderBloc bloc;
  @override
  initState() {
    super.initState();
    print("initState Called");
    getComplaintsName = "";
    print(widget.data);
    setState(() {
      appointmentId = widget.data?.Appointment_id;
      userId = widget.data?.User_id;
    });
    print(appointmentId);

    bloc = ApiBuilderBloc(
        path: 'Get_Appointment_Complaints',
        query: {
          'Appointment_Id': appointmentId,
          // need to check how to get UID fo user since this is in doctor view
        },
        api2: true);
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
        title: const Text('Complaints'),
        body:
            // BlocProvider(
            //   create: (c) => bloc = ApiBuilderBloc(
            //       path: 'Get_Appointment_Complaints',
            //       query: {
            //         'Appointment_Id': appointmentId,
            //         // need to check how to get UID fo user since this is in doctor view
            //       },
            //       api2: true)
            //     ..add(const Load()),
            //   child: ApiBuilder(
            //       shrinkWrap: true,
            //       jsonBuilder: (data, load) {
            //         return
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
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
                    child: PatientTile()),
                Divider(
                  endIndent: 10,
                  indent: 0,
                  thickness: 0.5,
                ),
                Text(
                  'Complaints',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                // MTextField(
                //   label: 'Enter keyword here...',
                //   suffixIcon: Icon(CupertinoIcons.search),
                // ),
                MSearchDown<Map<String, dynamic>>(
                  label: 'Enter keyword here...',
                  hint: 'Search complaints',
                  labelKey: 'Complaint_Name',
                  // subTitleKey: 'Complaint_Id',
                  suffixIcon: const Icon(CupertinoIcons.search),
                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector()
                        .apiService
                        .get2(path: 'Get_Complaints', query: {
                      'DoctorId': '38371',
                      'Search_Key': d
                    });
                    List<String> complaintNameList = [];
                    List<Map<String, dynamic>> list = [];
                    print(
                        "RES :::::::::::::::::::::::::::::::  ${res.bodyString}");
                    if (res.isSuccessful) {
                      print(res.body?.data[0]["Complaint_Name"]);
                      print("SUCCESS");
                      if (res.body?.data is List) {
                        print("res.bodyString is List");
                        for (var e in res.body!.data as List) {
                          complaintNameList.add(e["Complaint_Name"]);
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX$d");
                    setState(() {
                      getComplaintsName = d!['Complaint_Name'].toString();
                      getComplaintId = d!['Complaint_Id'].toString();
                      getComplaintsController.text = getComplaintsName;
                    });
                  },
                  controller: getComplaintsController,
                ),
                const SizedBox(
                  height: 4,
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
                            child: Text('Add New Complaint'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (c) => const AddComplaintDialog());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
                MListTile(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choosed Complaint Name',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(),
                      Text(
                        getComplaintsName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                MTextField(
                  controller: notesController,
                  label: 'Notes',
                  minLines: 3,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: const Text('Submit'),
                    onPressed: () async {
                      final call = Injector()
                          .apiService
                          .get2(path: 'Add_Patient_Complaints', query: {
                        'Appointment_Id': appointmentId,
                        'Complaint_Name': getComplaintsName,
                        'User_Id': userId,
                        'Complaint_Id': getComplaintId,
                        'Notes': notesController.text,
                      });
                      final res =
                          await showWaitingDialog(context: context, call: call);
                      if (res?.body.message == "Added Successfully") {
                        setState(() {
                          bloc.add(const Refresh());
                          getComplaintsController.clear();
                          notesController.clear();
                          notesController.text = "";
                          getComplaintsName = "";
                        });
                        await Fluttertoast.showToast(
                            msg: "Added Successfully",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                        // bloc.add(UpdateQuery({
                        //   'F_Date': '${d.month}/${d.day}/${d.year}',
                        //   'Doctor_id': '${LocalStorage.getUID()}',
                        // }));
                        // context.pop();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                BlocProvider(
                  create: (c) => bloc..add(const Load()),
                  child: ApiBuilder(
                    shrinkWrap: true,
                    jsonBuilder: (data, load) {
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              ComplaintListItem(
                                appointmentId: appointmentId.toString(),
                            complaintName: data[index]['Complaint_Name'],
                            complaintNotes: data[index]['Notes'],
                            complaintId: data[index]['Id'],
                          ),
                          itemCount: data.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));

    //         ),
    //   ),
    // );
  }
}
