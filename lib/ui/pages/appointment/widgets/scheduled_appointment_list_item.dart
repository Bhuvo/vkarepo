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
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class ScheduledAppointmentListItem extends StatelessWidget {
  final BookingAppointmentPatient data;

  const ScheduledAppointmentListItem({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("xxx${data.Appointment_id}");
    final user = User(
      userId: data.User_id,
      fullName: data.User_Name,
    );

    return UserProvider(
      data: user,
      child: MListTile(
        onTap: () {
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
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: MTextContent2(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    head: 'Confirmed Appointments:',
                    content: '${data.confirmed ?? 0}',
                  ),
                ),
                MTextContent2(
                  head: 'Missed Appointments:',
                  content: '${data.Missed ?? 0}',
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  contentColor: Colors.red,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
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
                      content: '${data.Token_Number ?? ''}'.padLeft(2, '0'),
                    ),
                  ],
                ),
                Container(
                  width: 0.5,
                  height: 40,
                  color: Theme.of(context).dividerColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              data.Payment_Flag == 'N' ? 'NOT PAID' : 'PAID',
                              style: TextStyle(
                                  color: data.Payment_Flag == 'N'
                                      ? Colors.red
                                      : Colors.green,
                                  fontSize: 13),
                            ),
                            Container(
                              width: 0.5,
                              height: 16,
                              color: Theme.of(context).dividerColor,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            Text(
                              data.Vital_Flag == 'P'
                                  ? 'VITAL COLLECTED'
                                  : 'VITAL NOT COLLECTED',
                              style: TextStyle(
                                  color: data.Vital_Flag == 'P'
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        status()
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
                        backgroundColor: Theme.of(context).canvasColor,
                        color: Theme.of(context).highlightColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
