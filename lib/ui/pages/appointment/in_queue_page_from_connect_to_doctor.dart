import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/patient_bottom_navigation.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/appointment/call_waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/call/incoming_call_dialog.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/file_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../model/appointment_data.dart';
import '../../../model/waiting_room_details.dart';
import '../../../utils/date_utils.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import '../medical_record/upload_medical_doc.dart';
import 'in_queue_page.dart';

class InQueuePageFromUpcomingAppointment extends StatefulWidget {
  final AppointmentData appointmentData;

  InQueuePageFromUpcomingAppointment({Key? key, required this.appointmentData})
      : super(key: key);

  @override
  State<InQueuePageFromUpcomingAppointment> createState() =>
      _InQueuePageFromUpcomingAppointmentState();
}

class _InQueuePageFromUpcomingAppointmentState
    extends State<InQueuePageFromUpcomingAppointment> {
  String? apId;
  late ApiBuilderBloc viewMedicalRecordsBloc;

  @override
  void initState() {
    super.initState();
    viewMedicalRecordsBloc = ApiBuilderBloc(
        path: 'ViewMedicalRecords',
        query: {'Appointment_id': widget.appointmentData.id.toString()},
        raw: true);
  }

  updateOnline(appointmentIdFromWaitingRoom) async {
    await Injector().apiService.get(
        path: 'Update_Online_Time',
        query: {'Appointment_Id': appointmentIdFromWaitingRoom});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(
    //     "TRANSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS ${widget.transactionKey}");

    /// below code is for the waiting room api bloc
    // final bloc = ApiBuilderBloc(
    //   path: 'OverallWaitingRoom',
    //   query: {
    //     'Transaction_Id': "${widget.transactionKey}",
    //     'User_id': "${LocalStorage.getUID()}",
    //   },
    //   raw: true,
    // );
    // viewMedicalRecordsBloc = ApiBuilderBloc(
    //     path: 'ViewMedicalRecords',
    //     query: {'Appointment_id': widget.appointmentData.id},
    //     raw: true);

    /// below code is for the updating online time api bloc
    final waitingQueueBloc = ApiBuilderBloc(
      path: 'Update_Online_Time',
      query: {
        'Appointment_Id': widget.appointmentData.id,
      },
      raw: true,
    );
    var id = LocalStorage.getUser().userId;
    // final data = overallWaitingRoomData.first;
    final doctorName = '${widget.appointmentData.doctorName}';
    apId = '${widget.appointmentData.id}';
    // final appointmentDate =
    //     '${data["Appointment_Date"]?.split(" ")[0]}';
    final appointmentDate =
        MDateUtils.convertDateFormat(widget.appointmentData.date ?? "");
    // final appointmentDate = MDateUtils.dateToFormattedDateAlt(widget.appointmentData.date);

    // DateTime dateTime = DateTime.parse(data["Appointment_Id"]);
    //  print(DateFormat("dd/MM/yyyy").format(dateTime));

    // print(DateFormat('dd/MM/yyyy – kk:mm a').format(appointmentDate));
    // final appointmentTime = '${data["Appointment_Time"]}';
    final appointmentTime =
        MDateUtils.timeToHourMinute(widget.appointmentData.time);
    var appointmentIdFromWaitingRoom = '${widget.appointmentData.id}';
    print(appointmentIdFromWaitingRoom);
    print("appoint id abve");
    print("passing id - $appointmentIdFromWaitingRoom");

    String? appointmentId = appointmentIdFromWaitingRoom;
    print(appointmentIdFromWaitingRoom);
    print("passing this appointment id");
    Injector().apiService.get(
        path: 'Update_Online_Time', query: {'Appointment_Id': appointmentId});
    waitingQueueBloc.add(
      UpdateQuery(
        {
          'Appointment_Id': appointmentId,
        },
      ),
    );

    return MScaffold(
      title: Text(
        Consts.IN_QUEUE,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: size.height * 0.032,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Call Request',
                // style: Theme.of(context).textTheme.bodySmall,
                style: TextStyle(
                  fontSize: size.height * 0.015,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            MListTile(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade100,
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (c) => const IncomingCallDialog());
                },
                child: Center(
                  child: Text(
                    'No Records',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: size.height * 0.015,
                        ),
                  ),
                )),
            MListTile(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                      child: Image.asset(
                    "assets/images/frontdesk.jpg",
                    height: size.height * 0.195,
                    width: size.width,
                  )),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.022,
                        vertical: size.height * 0.016),
                    child: BlocProvider(
                      create: (c) => waitingQueueBloc..add(const Load()),
                      child: appointmentIdFromWaitingRoom != null
                          ? ApiBuilder(
                              shrinkWrap: true,
                              jsonBuilder: (updateOnlineTimeData, load) {
                                /// setting the value from api
                                final queueNo =
                                    '${updateOnlineTimeData[0]["Queue"]}';
                                final doctorStatus =
                                    '${updateOnlineTimeData[0]["Doctor_Online"]}';
                                print("printing doc stat");
                                print("doctor status $doctorStatus");
                                final waitingMinutes =
                                    '${updateOnlineTimeData[0]["Waiting_Minutes"]} mins';
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Queue No: $queueNo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.height * 0.016),
                                    ),
                                    Text("Waiting Minutes: $waitingMinutes",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.height * 0.016)),
                                    Text(
                                      "Doctor online:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.height * 0.016),
                                    ),
                                    Icon(
                                      doctorStatus == "Y" || doctorStatus == "y"
                                          ? Icons.circle
                                          : Icons.circle,
                                      color: doctorStatus == "Y" ||
                                              doctorStatus == "y"
                                          ? Colors.green
                                          : Colors.red,
                                      size: size.height * 0.02,
                                    ),
                                  ],
                                );
                              })
                          : const CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  // GestureDetector(
                  // onTap: () async {
                  //   final call = Injector()
                  //       .apiService
                  //       .get(path: 'QueueRequest', query: {
                  //     // 'Doctor_Id':  LocalStorage.getUser().id,
                  //     // 'Patient_Id':  LocalStorage.getUID(),
                  //     'Doctor_Id': '37941',
                  //     'User_id': '3158',
                  //   });
                  //   final res = await showWaitingDialog(
                  //       context: context, call: call);
                  //   if (res?.body.message == "Request Sent") {
                  //     showDialog(
                  //         context: context,
                  //         builder: (c) => const CallWaitingDialog(),
                  //         barrierDismissible: false);
                  //   }
                  // },
                  // child:
                  Text(
                    'You are in Queue',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: size.height * 0.026,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  // ),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: size.width * 0.022, vertical: size.height * 0.016),
                    child: Text.rich(
                      TextSpan(
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.016),
                          children: [
                            const TextSpan(
                                text: 'Kindly wait on the queue to consult '),
                            TextSpan(
                                text: 'Dr.$doctorName ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.016,
                                        color: MTheme.THEME_COLOR)),
                            const TextSpan(text: ' identify you are online'),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'THANK YOU',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MTheme.ICON_COLOR,
                      fontSize: size.height * 0.045,
                    ),
                  ),
                  Text(
                    'Appointment Date and Time',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize:size.height * 0.024,
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  MListTile(
                    borderColor: MTheme.THEME_COLOR,
                    child: Row(
                      children: [
                        Expanded(
                            child: UserInfo(
                          Info.custom,
                          icon: FontAwesomeIcons.solidCalendarDays,
                          lable: appointmentDate,
                          textColor: MTheme.THEME_COLOR,
                        )),
                        Container(
                          height: size.height * 0.056,
                          width: 1,
                          color: MTheme.THEME_COLOR,
                        ),
                        Expanded(
                            child: UserInfo(Info.custom,
                                icon: FontAwesomeIcons.solidClock,
                                lable: appointmentTime,
                                textColor: MTheme.THEME_COLOR)),
                      ],
                    ),
                  ),
                  buildFileUpload(
                    context,
                    apId,
                    () {
                      viewMedicalRecordsBloc
                        ..add(
                          const Refresh(),
                        );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Uploaded Files",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  BlocProvider(
                    create: (_) => viewMedicalRecordsBloc..add(const Load()),
                    child: ApiBuilder(
                        shrinkWrap: true,
                        jsonBuilder: (data, load) {
                          return SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.17,
                            child: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => FileViewList(
                                name: data[index]["Name"].toString(),
                                appointmentId: apId.toString(),
                                description: data[index]["Description"] ??
                                    "No Description Available",
                                date: data[index]["Date"] ??
                                    "Uploaded Date not found",
                                recordsId: data[index]["id"],
                                deleteVoidCallBack: () {
                                  viewMedicalRecordsBloc.add(
                                    const Refresh(),
                                  );
                                },
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottom: Padding(
      //   padding: EdgeInsets.symmetric(
      //       horizontal: context.getWPercent(10), vertical: 8),
      //   child: OutlinedButton(
      //     child: const Text('Submit'),
      //     onPressed: () {
      //       showDialog(context: context, builder: (c) => IncomingCallDialog());
      //     },
      //   ),
      // ),
      //bottom: PatientBottomNavigation(),
    );
  }
}
