import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/model/appointment_data.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:intl/intl.dart';
import 'book_appointment_dialog.dart';

class AppointmentListItem extends StatelessWidget {
  final contextfromBookAppointmentPage;
  final bool upcoming;
  final AppointmentData data;

  const AppointmentListItem(
      {Key? key,
      this.upcoming = false,
      required this.data,
      required this.contextfromBookAppointmentPage})
      : super(key: key);

  String formatApiTime(String apiTime) {
    DateTime parsedTime = DateFormat("HH:mm:ss").parse(apiTime);
    String formattedTime = DateFormat.jm().format(parsedTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    print('dataaaaaaaaaaaaaaaaaaaaa               $data');

    return MListTile(
      actions: upcoming
          ? [
              CustomSlidableAction(
                onPressed: (_) {
                  context
                      .push(Routes.medicalRecordsList, {'appointment': data});
                },
                backgroundColor: Colors.transparent,
                child: const MIconButton(
                  color: MTheme.THEME_COLOR,
                  child: Icon(
                    Icons.settings_backup_restore_rounded,
                    color: MTheme.THEME_COLOR,
                  ),
                ),
                padding: const EdgeInsets.all(0),
              ),
            ]
          : [
              CustomSlidableAction(
                onPressed: (_) {
                  context
                      .push(Routes.medicalRecordsList, {'appointment': data});
                },
                backgroundColor: Colors.transparent,
                child: const MIconButton(
                  color: MTheme.THEME_COLOR,
                  child: Icon(
                    Icons.settings_backup_restore_rounded,
                    color: MTheme.THEME_COLOR,
                  ),
                ),
                padding: const EdgeInsets.all(0),
              ),
              CustomSlidableAction(
                onPressed: (_) async {
                  await showDialog(
                      context: context,
                      builder: (c) => BookAppointmentDialog(
                            contextfromBookAppointmentPage:
                                contextfromBookAppointmentPage,
                            doctor: InstantDoctor(
                              Doctor_Name: data.doctorName,
                              Doctor_id: data.doctorId,
                            ),
                          ));
                  //showDialog(context: context, builder: (c) => Center(child: CircularProgressIndicator()));
                },
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                child: const MIconButton(
                  color: MTheme.THEME_COLOR,
                  child: Icon(
                    FontAwesomeIcons.solidCalendarCheck,
                    color: MTheme.THEME_COLOR,
                  ),
                ),
              ),
            ],
      child: UserTile(
        caption: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.doctorCategory ?? ''),
            const SizedBox(
              height: 6,
            ),
            Text("Appointment ID : ${data.id}"),
            const SizedBox(
              height: 2,
            ),
            upcoming
                ? Text("AppointmentTime : ${formatApiTime(
                    data.time.toString(),
                  )}")
                : Container(),
            const SizedBox(
              height: 2,
            ),
            Text("Type : ${data.type}"),
          ],
        ),
        trailing: upcoming
            ? TextButton(
                onPressed: () {
                  context.push(Routes.inQueuePageFromUpcomingAppointment,
                      {'appointmentData': data});
                },
                child: const Text('Connect with Doctor'))
            : null,
      ),
    );
  }
}
