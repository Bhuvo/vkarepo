import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/model/waiting_patient.dart';
import 'package:timesmedlite/ui/components/patient_schedule_header.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/waiting_list_clinical/clinical_waiting_patient_details.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:http/http.dart' as http;

class Autogenerated {
  String? doctorName;
  String? deviceID;
  String? mobileNumber;
  String? hospitalId;
  String? keyId;
  String? sessionid;
  String? tokenid;
  int? doctorId;
  String? displayType;
  int? userId;
  Null? gender;
  Null? userType;
  String? userName;
  String? emailid;
  int? appointmentId;
  int? doctorIdS;
  int? intervalForOnline;

  Autogenerated(
      {this.doctorName,
      this.deviceID,
      this.mobileNumber,
      this.hospitalId,
      this.keyId,
      this.sessionid,
      this.tokenid,
      this.doctorId,
      this.displayType,
      this.userId,
      this.gender,
      this.userType,
      this.userName,
      this.emailid,
      this.appointmentId,
      this.doctorIdS,
      this.intervalForOnline});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    doctorName = json['Doctor_Name'];
    deviceID = json['DeviceID'];
    mobileNumber = json['MobileNumber'];
    hospitalId = json['Hospital_id'];
    keyId = json['Key_id'];
    sessionid = json['sessionid'];
    tokenid = json['tokenid'];
    doctorId = json['Doctor_id'];
    displayType = json['Display_Type'];
    userId = json['User_Id'];
    gender = json['Gender'];
    userType = json['UserType'];
    userName = json['User_Name'];
    emailid = json['Emailid'];
    appointmentId = json['Appointment_Id'];
    doctorIdS = json['Doctor_idS'];
    intervalForOnline = json['IntervalForOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor_Name'] = this.doctorName;
    data['DeviceID'] = this.deviceID;
    data['MobileNumber'] = this.mobileNumber;
    data['Hospital_id'] = this.hospitalId;
    data['Key_id'] = this.keyId;
    data['sessionid'] = this.sessionid;
    data['tokenid'] = this.tokenid;
    data['Doctor_id'] = this.doctorId;
    data['Display_Type'] = this.displayType;
    data['User_Id'] = this.userId;
    data['Gender'] = this.gender;
    data['UserType'] = this.userType;
    data['User_Name'] = this.userName;
    data['Emailid'] = this.emailid;
    data['Appointment_Id'] = this.appointmentId;
    data['Doctor_idS'] = this.doctorIdS;
    data['IntervalForOnline'] = this.intervalForOnline;
    return data;
  }
}

class ClinicalWaitingListItem extends StatefulWidget {
  final WaitingPatient data;

  const ClinicalWaitingListItem({Key? key, required this.data})
      : super(key: key);

  @override
  State<ClinicalWaitingListItem> createState() =>
      _ClinicalWaitingListItemState();
}

class _ClinicalWaitingListItemState extends State<ClinicalWaitingListItem> {
  String formatDateString(String dateString) {
    final originalFormat = DateFormat("M/d/yyyy");
    final formattedDate = originalFormat.parse(dateString);
    final desiredFormat = DateFormat("dd/MM/yyyy");
    return desiredFormat.format(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    final user = Patient.fromJson(widget.data.toJson());
    final bool paid = widget.data.Key_Id != null;

    print("${widget.data.Appointment_Date} date appointment date");

    return PatientProvider(
      data: user,
      child: MListTile(
        actions: [
          // CustomSlidableAction(
          //   padding: const EdgeInsets.all(0),
          //   onPressed: (_) {},
          //   backgroundColor: Colors.transparent,
          //   child: const MIconButton(
          //     color: MTheme.THEME_COLOR,
          //     child: Icon(
          //       Icons.notifications,
          //       color: MTheme.THEME_COLOR,
          //     ),
          //   ),
          // ),
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (_) {
              print(
                  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA${widget.data.Appointment_id}");
              context.push(Routes.documentPreview, {
                'appointmentid': widget.data.Appointment_id.toString(),
                'title': Consts.MEDICAL_RECORDS.toUpperCase()
              });
            },
            backgroundColor: Colors.transparent,
            child: const MIconButton(
              color: MTheme.THEME_COLOR,
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: MTheme.THEME_COLOR,
              ),
            ),
          ),
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (_) async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClinicalWaitingPatient()));
              /* final call = Injector()
                  .apiService
                  .rawGet(path: 'Instant', query: {'Key': widget.data.Key_Id});
              print('call ${widget.data.Key_Id} : ${call.toString()}');
              final res = await ApiFacade.callApi(context: context, call: call);
              final jsonString = res!.bodyString;
              // var map ={
              //   "Doctor_Name": "Test Doctor",
              //   "DeviceID": "caHQI8VYT7uwsWCcLQbfR0:APA91bEq2hDw4gJGCF-5lJQ3bVPiAP0VVtgoh3clT44civT5tlLNLW2NwuJh_ZHYwh95O6G0MVJndaQgOqHSC4IlQLPbVFl8Ym0ccHIZUFDwWxjh-F6_1mSl6JBzdeKTW9PElxZeggZK",
              //   "MobileNumber": "9080116506",
              //   "Hospital_id": "0",
              //   "Key_id": "10155",
              //   "sessionid": "",
              //   "tokenid": "",
              //   "Doctor_id": 178936,
              //   "Display_Type": "D",
              //   "User_Id": 274649,
              //   "Gender": null,
              //   "UserType": null,
              //   "User_Name": "Rakshini ",
              //   "Emailid": "rakshinidf@gmail.com",
              //   "Appointment_Id": 236910,
              //   "Doctor_idS": 0,
              //   "IntervalForOnline": 15
              // };
              // var response  = await http.get(Uri.parse('https://tmsnew.timesmed.com/WebAPIP/Instant?key=10155'));
              // if(response.statusCode == 200){
              //   Autogenerated kolaruResponse = Autogenerated.fromJson(jsonDecode(response.body));
              //   print(kolaruResponse.toString());
              //   // map = jsonDecode(response.body);
              //
              // }
              //          final jsonString = '{${kolaruResponse.split('}{').last}';
              final map = jsonDecode(jsonString);
              print("XXXXXXXXXXXXXXXXXXXXXXX$map");

              context.push(Routes.inAppCallPageDoctor, map);*/
            },
            backgroundColor: Colors.transparent,
            child: const MIconButton(
              color: MTheme.THEME_COLOR,
              child: Icon(
                Icons.videocam,
                color: MTheme.THEME_COLOR,
              ),
            ),
          ),
        ],
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            PatientScheduleHeader(
              // date: MDateUtils.dateToFormattedDateAlt(data.Appointment_Date),
              // date: widget.data.Appointment_Date,
              date: formatDateString(widget.data.Appointment_Date),
              // time: MDateUtils.timeToHourMinute(data.Appointment_Time),
              time: widget.data.Appointment_Time,
            ),
            const SizedBox(
              height: 8,
            ),
            MGradientContainer(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Text.rich(
                  TextSpan(children: [
                    TextSpan(text: '${widget.data.Email_Id},   '),
                    //const TextSpan(text: 'NOT PAID', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                    if (paid)
                      const TextSpan(
                          text: 'PAID',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w600))
                    else
                      const TextSpan(
                          text: 'NOT PAID',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600)),
                    const TextSpan(text: '\nMobile Number: '),
                    TextSpan(
                        text: '${widget.data.Mobile_Number}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    // const TextSpan(text: '\nDoctor Approved Date: '),
                    // TextSpan(
                    //     text: MDateUtils.dateToFormattedDateAlt(data.Appointment_Date),
                    //     style: const TextStyle(fontWeight: FontWeight.w600)),
                    const TextSpan(text: '\nAppointment Type: '),
                    TextSpan(
                        text: '${widget.data.Type_Flag}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const TextSpan(text: '\nAppointment ID: '),
                    TextSpan(
                        text: '${widget.data.Appointment_id}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ]),
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade600, height: 1.5),
                )),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const StatusIndicator(label: 'Cancel'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const StatusIndicator(label: 'Accept'),
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
