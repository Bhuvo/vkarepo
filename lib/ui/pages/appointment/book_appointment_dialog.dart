import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../facade/api_facade.dart';
import 'call_waiting_dialog.dart';
import 'package:http/http.dart' as http;

class BookAppointmentDialog extends StatefulWidget {
  final contextfromBookAppointmentPage;
  final InstantDoctor doctor;

  const BookAppointmentDialog({Key? key, required this.doctor, required this.contextfromBookAppointmentPage})
      : super(key: key);

  @override
  State<BookAppointmentDialog> createState() => _BookAppointmentDialogState();
}

class _BookAppointmentDialogState extends State<BookAppointmentDialog> {
  String value = Consts.INSTANT;

  final navigatorKey = GlobalKey<NavigatorState>();
  bool isSubmitPressed=false;


  @override
  Widget build(BuildContext context) {
    print("patient ID   ${LocalStorage.getUID()}");
    print("doctor ID   ${widget.doctor.Doctor_id}");
    return MDialog(
      title: Row(
        children: [
          Text(Consts.BOOK_AN_APPOINTMENT.toUpperCase()),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: MRadioChip<String>(
                value: value,
                items: const [
                  MRadioItem(value: Consts.INSTANT, label: Consts.INSTANT),
                  MRadioItem(value: Consts.SCHEDULE, label: Consts.SCHEDULE),
                ],
                type: MRadioChipType.radio,
                onChanged: (d) {
                  setState(() {
                    value = d;
                  });
                },
              ),
            ),
            isSubmitPressed?Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Requesting Please wait"),
                SizedBox(width: 10,),
                CircularProgressIndicator(),
              ],
            ),):SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                child: const Text('SUBMIT'),
                onPressed: () async {
                  setState(() {
                    isSubmitPressed=true;
                  });

                  switch (value) {
                    case Consts.INSTANT:
                      print("http response inside");
                      var queryParameters = {
                        'Doctor_id': widget.doctor.Doctor_id.toString(),
                        'User_id': LocalStorage.getUID().toString(),
                      };
                      final uri = Uri.parse(
                              "http://tmsnew.timesmed.com/WebAPIP/QueueRequest")
                          .replace(
                              queryParameters: queryParameters = {
                        'Doctor_id': widget.doctor.Doctor_id.toString(),
                        'User_id':  LocalStorage.getUID().toString(),
                      });
                      final uri2 = Uri.parse(
                          "https://api.timesmed.com/WebAPI2/getOnlineFeeData")
                          .replace(
                          queryParameters: queryParameters = {
                            'DoctorId': widget.doctor.Doctor_id.toString(),
                          });
                      final uri3 = Uri.parse(
                          "https://api.timesmed.com/WebAPI2/GetDoctorDetails")
                          .replace(
                          queryParameters: queryParameters = {
                            'DoctorId':  widget.doctor.Doctor_id.toString(),
                          });
                      final response3 = await http.get(uri3);
                      print(response3.body);
                      var jsonResponse = jsonDecode(response3.body);
                      print(jsonResponse["Data"]["SubCategory_id"].toString());

                        var doctorSpecialityID =
                            jsonResponse["Data"]["SubCategory_id"].toString().toString().split(",")[0];

                      print(doctorSpecialityID);
                      print("printing id");
                      final response = await http.get(uri);
                      final response2 = await http.get(uri2);
                      print(response.body);
                      print(json.decode(response2.body)[0]['eclinicVideo']);
                      var DoctorVideoCallAmount = json.decode(response2.body)[0]['eclinicVideo'];
                      print(DoctorVideoCallAmount);
                      print("http response above");
                      if (response.statusCode == 200&& response2.statusCode==200) {
                        print("::::::::::::::::::::::::::::::::::::::::::::::::$context");
                        context.popDialog();
                        showDialog(
                            context: widget.contextfromBookAppointmentPage,
                            builder: (contextfromBookAppointmentPage) =>  CallWaitingDialog(contextfromBookAppointmentPage: widget.contextfromBookAppointmentPage,amount: DoctorVideoCallAmount,
                            docId: widget.doctor.Doctor_id.toString() ,
                              speciality: doctorSpecialityID.toString(),
                              userId: LocalStorage.getUID().toString(),
                            ),
                            barrierDismissible: false);
                      }
                      break;
                    case Consts.SCHEDULE:
                      context.popDialog();
                      context.push(Routes.scheduleAppointmentPatient,
                          {'instantDoctor': widget.doctor});
                      break;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
