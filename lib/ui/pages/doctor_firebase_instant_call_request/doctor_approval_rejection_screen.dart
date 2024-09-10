import 'package:flutter/material.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../const/consts.dart';
import '../../../di/dependency_injection.dart';
import '../../../facade/api_facade.dart';
import '../../components/waiting_dialog.dart';
import '../../widgets/m_scaffold.dart';

class FCMMessageDoctorAcceptorRejectUserInstantRequest extends StatelessWidget {
  final paylaodFromFCM;

  const FCMMessageDoctorAcceptorRejectUserInstantRequest(
      {Key? key, required this.paylaodFromFCM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MScaffold(
        body: Column(
      children: [
        Spacer(),
        Container(
          height: 250,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color.fromARGB(255, 11, 146, 156),
                                  Color.fromARGB(255, 32, 208, 122)
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Center(
                              child: Text(
                            Consts.INSTANT_CALL_REQUEST,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ))),
                      Spacer(),
                      Text(
                        "Patient ${paylaodFromFCM['PatientName']}(${paylaodFromFCM['Patient_id']}) has requested for a instant call.Please approve or reject the request.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Container(
                          width: double.infinity,
                          height: 55,
                          child: Row(
                            children: [
                              Spacer(),
                              TextButton.icon(
                                onPressed: () async {
                                  final call = Injector().apiService.get(
                                      path: 'UpdateApporvalMobile',
                                      query: {
                                        'Queue_id': paylaodFromFCM['Queue_Id']
                                            .toString(),
                                        'Value': "Y",
                                      });
                                  final res = await showWaitingDialog(
                                      context: context, call: call);
                                  if (res?.body.message == "Updated") {
                                    print(
                                        "Approved:::::::::::::::::::::::::::::::: $res");
                                   Navigator.of(context).pop();
                                  }
                                },
                                icon: Icon(Icons.check),
                                label: Text('Accept'),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                ),
                              ),
                              Spacer(),
                              Spacer(),
                              TextButton.icon(
                                onPressed: () async {
                                  final call = Injector().apiService.get(
                                      path: 'UpdateApporvalMobile',
                                      query: {
                                        'Queue_id': paylaodFromFCM['Queue_Id']
                                            .toString(),
                                        'Value': "R",
                                      });
                                  final res = await showWaitingDialog(
                                      context: context, call: call);
                                  if (res?.body.message == "Updated") {
                                    print(
                                        "Approved:::::::::::::::::::::::::::::::: $res");
                                    Navigator.of(context).pop();
                                  }
                                },
                                icon: Icon(Icons.close),
                                label: Text('Reject'),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                              ),
                              Spacer(),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Spacer(),
      ],
    ));
  }
}
