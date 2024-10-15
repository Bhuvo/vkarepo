import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/booking_appointment_patient.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/vital_sign/add_vital_sign_dialog.dart';
import 'package:timesmedlite/ui/pages/vital_sign/vital_chart.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../widgets/space.dart';

class ScheduledAppointmentListItem extends StatelessWidget {
  final BookingAppointmentPatient data;
  final Function()? onTap;
  const ScheduledAppointmentListItem({Key? key, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("xxx${data.Appointment_id}");
    final user = User(
      userId: data.User_id,
      fullName: data.User_Name,
    );

    final nurse = LocalStorage.isNurse;

    return UserProvider(
      data: user,
      child: MListTile(
        onTap:onTap ?? () {
          context.push(Routes.appointmentPatientDetails, {'data': data});
        },
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserTile(
              isAppointment: true,
              patientId: data.User_id,
              date: data.Appointment_Date,
              time: data.Appointment_Time,
              avatarRadius: 16,
              caption: SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
            ),
            const Divider(
              height: 20,
            ),
            MTextContent2(
              head: 'Symptoms:',
              content: '${data.symptoms ?? 'No Symptoms'}',
            ),
            MTextContent2(
              head: 'Hospital Name:',
              content: '${data.Hospital_Name ?? ''}',
            ),
            const Divider(
              height: 20,
            ),
            // Row(
            //   children: [
            //     const SizedBox(
            //       width: 16,
            //     ),
            //     Expanded(
            //       child: MTextContent2(
            //         flex: true,
            //         margin: EdgeInsets.symmetric(horizontal: 0),
            //         head: 'Confirmed Appointments:',
            //         content: '${data.confirmed ?? 0}',
            //       ),
            //     ),
            //     MTextContent2(
            //       head: 'Missed Appointments:',
            //       content: '${data.Missed ?? 0}',
            //       margin: EdgeInsets.symmetric(horizontal: 0),
            //       contentColor: Colors.red,
            //     ),
            //     const SizedBox(
            //       width: 16,
            //     ),
            //   ],
            // ),
            // const Divider(
            //   height: 20,
            // ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MTextContent2(
                      head: 'Visit ID:',
                      content: '${data.Appointment_id}',
                    ),
                    MTextContent2(
                      head: 'Token No. :',
                      content: '${data.Token_Number ?? '-'}'.padLeft(2, '0'),
                    ),
                  ],
                ),
                Container(
                  width: 0.5,
                  height: 100,
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                data.Payment_Flag == 'N' ? 'NOT PAID' : 'PAID',
                                style: TextStyle(
                                    color: data.Payment_Flag == 'N'
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            // Container(
                            //   width: 0.5,
                            //   height: 16,
                            //   color: Theme.of(context).dividerColor,
                            //   margin: EdgeInsets.symmetric(horizontal: 10),
                            // ),
                            if(data.DiseaseDetails_Flag == '1')...[
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                                  ),
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VitalSignChartPage(
                                              patientId: '${data.User_id}',
                                              isFromPatient: false,
                                            )));
                                  }, child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.heartPulse,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('VITAL COLLECTED', style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12
                                  ))
                                ],
                              ))
                            ] else const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('VITAL NOT COLLECTED',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),

                            // if(data.DiseaseDetails_Flag == '1')...[
                            //   TextButton(
                            //       style: TextButton.styleFrom(
                            //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                            //       ),
                            //       onPressed: (){
                            //         // Routes.detailedClinicalNotes
                            //         context.push(Routes.detailedClinicalNotes, {'data': data});
                            //       }, child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       FaIcon(
                            //         FontAwesomeIcons.notesMedical,
                            //         color: Colors.green,
                            //         size: 16,
                            //       ),
                            //       SizedBox(
                            //         width: 8,
                            //       ),
                            //       AutoSizeText('COMPLAINTS\nCOLLECTED', style: TextStyle(
                            //           color: Colors.green,
                            //           fontSize: 12
                            //       ))
                            //     ],
                            //   ))
                            // ] else const Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            //   child: Text(
                            //     'COMPLAINTS NOT COLLECTED',
                            //     textAlign: TextAlign.end,
                            //     style: TextStyle(
                            //         color: Colors.red,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 10),
                            //   ),
                            // ),

                            if(data.Prescription_Flag == '1')...[
                              TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                                  ),
                                  onPressed: (){
                                    final args = {
                                      'patientid': '${data.User_id}',
                                      'doctorid': '${data.Doctor_id}',
                                      'appointmentid': '${data.Appointment_id}',
                                    };
                                    print(args);
                                    context.push(Routes.prescriptionEditor, args);
                                  }, child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.prescriptionBottleAlt,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  AutoSizeText('PRESCRIPTION\nCOLLECTED', style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12
                                  ))
                                ],
                              ))
                            ] else const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              child: Text(
                                'PRESCRIPTION NOT COLLECTED',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),

                            if(data.LabTest_Flag == '1')...[
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                                  ),
                                  onPressed: (){
                                    context.push(Routes.labTestRequest, {
                                      'patientid': '${data.User_id}',
                                      'doctorid': '${data.Doctor_id}',
                                      'appointmentid': '${data.Appointment_id}',
                                    });
                                  }, child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.vial,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  AutoSizeText('LAB TEST COLLECTED', style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12
                                  ))
                                ],
                              ))
                            ] else const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              child: Text(
                                'LAB TEST NOT COLLECTED',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: status(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient ID: ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: '${user.userId}',
                        drawText: false,
                        height: 40,
                        width: 128,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Bar Code: ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        data: '${data.Appointment_id}',
                        //drawText: false,
                        height: 40,
                        width: 40,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
            ),
             Row(
              children: [
                Space(),
                Text('Click for full details', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).dividerColor,
                  fontSize: 10
                )),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.grey,),
                Space()
              ],
            ),
            const Space(10)
            // MListTile(
            //     color: Colors.white54,
            //     child: Row(
            //       children: [
            //         Expanded(
            //             child: TextButton(
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [
            //               FaIcon(
            //                 FontAwesomeIcons.print,
            //                 color: MTheme.ICON_COLOR,
            //                 size: 16,
            //               ),
            //               SizedBox(
            //                 width: 8,
            //               ),
            //               Text('Print')
            //             ],
            //           ),
            //           onPressed: () {},
            //         )),
            //         Container(
            //           width: 0.5,
            //           height: 16,
            //           color: Theme.of(context).dividerColor,
            //         ),
            //         Expanded(
            //             child: TextButton(
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: const [
            //               FaIcon(
            //                 FontAwesomeIcons.heartPulse,
            //                 color: MTheme.ICON_COLOR,
            //                 size: 16,
            //               ),
            //               SizedBox(
            //                 width: 8,
            //               ),
            //               Text('Vital Sign')
            //             ],
            //           ),
            //           onPressed: () {
            //             showDialog(
            //                 context: context,
            //                 builder: (c) => AddVitalSignDialog(
            //                       userId: data.User_id,
            //                     ));
            //           },
            //         )),
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }

  Widget status() {
    switch (data.view_status) {
      case 'M':
        return const StatusIndicator(label: 'MISSED');
      default:
        return StatusIndicator(
          label: 'UNKNOWN: ${data.view_status}',
          color: Colors.grey,
        );
    }
  }
}
