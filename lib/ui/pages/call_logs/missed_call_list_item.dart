import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/missed_call_log.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/check_item.dart';
import 'package:timesmedlite/ui/components/patient_schedule_header.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class MissedCallListItem extends StatelessWidget {
  final MissedCallLog data;

  const MissedCallListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = User(
        fullName: data.User_Name,
        userId: data.User_id,
        phoneNumber: '${data.MobileNumber ?? 'No Number'}');

    return UserProvider(
      data: user,
      child: MListTile(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            PatientScheduleHeader(
              date: data.Appointment_Date,
              time: data.Appointment_Time,
              patientImage: data.PatientImage,
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: data.transaction_status == 'Success'
                              ? 'PAID'
                              : 'UNPAID',
                          style: TextStyle(color: Colors.green)),
                    ]),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      context.push(
                          Routes.missedCallReschedule, {'UserData': data});
                    },
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.calendarCheck,
                          size: 11,
                          color: Colors.white,
                        ),
                        Text(
                          '  RE SCHEDULE',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
