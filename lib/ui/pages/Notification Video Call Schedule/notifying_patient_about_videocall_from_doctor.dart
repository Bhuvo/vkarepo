import 'package:flutter/material.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../const/consts.dart';
import '../../../di/dependency_injection.dart';
import '../../../facade/api_facade.dart';
import '../../components/waiting_dialog.dart';
import '../../widgets/m_scaffold.dart';

class FCMMessageNotifyingPatientAboutTheVideoCall extends StatelessWidget {
  final paylaodFromFCM;

  const FCMMessageNotifyingPatientAboutTheVideoCall(
      {Key? key, required this.paylaodFromFCM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
        body: Column(
      children: [
        Container(
          height: size.height * 0.75,
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
                          decoration: const BoxDecoration(
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
                            "${paylaodFromFCM["body"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ))),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      // ),
                      Image.asset(
                        "assets/images/doctor_online.jpg",
                        height: size.height * 0.5,
                        width: size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please connect with the scheduled call with the Doctor",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
