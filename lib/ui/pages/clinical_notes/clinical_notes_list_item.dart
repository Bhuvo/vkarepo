import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/model/clinical_note_loadsummary.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import 'clinical_notes_editor.dart';

class ClinicalNotesListitem extends StatefulWidget {
  final ApiBuilderBloc bloc;
  final ClinicalNotesLoadSummary? data;
  final String? doctorID;
  String? userID;
  final String? appointmentID;

  ClinicalNotesListitem(
      {Key? key,
      this.data,
      this.doctorID,
      this.userID,
      this.appointmentID,
      required this.bloc})
      : super(key: key);

  @override
  State<ClinicalNotesListitem> createState() => _ClinicalNotesListitemState();
}

class _ClinicalNotesListitemState extends State<ClinicalNotesListitem> {
  String currentDate = '';
  String currentTime = '';

  String formattedDate = '';
  String formattedTime = '';

  final String apiDate = "8/1/2023 11:57:39 AM";

  void getDateTime() {
    // Get the current date and time.
    // Parse the API date string into a DateTime object
    // Custom DateFormat pattern to parse the API date
    final customFormat = DateFormat("M/d/y h:mm:ss a");

    // Parse the API date string into a DateTime object
    DateTime dateTime = customFormat.parse(widget.data?.Insert_Date);

    // Format the date as "dd-mm-yyyy"
     formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

    // Format the time as "hh:mm a"
     formattedTime = DateFormat('hh:mm a').format(dateTime);

    setState(() {});
  }

// Sample function to format date as "dd-MM-yyyy".
  String formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
  }

// Sample function to format time as "hh:mm a".
  String formatTime(DateTime dateTime) {
    String period = dateTime.hour < 12 ? 'AM' : 'PM';
    int hour = dateTime.hour % 12;
    hour = hour == 0 ? 12 : hour; // Convert 0 to 12 for 12-hour format.
    int minute = dateTime.minute;
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return MListTile(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onTap: () {
          context.push(Routes.clinicalNotesView, widget.data);
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 8,
                    children: [
                      UserInfo(
                        Info.custom,
                        // lable: ' data.date',
                        // lable: currentDate,
                        lable: formattedDate,
                        icon: Icons.date_range,
                        textColor: MTheme.THEME_COLOR,
                      ),
                      // Container(
                      //   height: 16,
                      //   width: 0.7,
                      //   margin: const EdgeInsets.only(right: 12),
                      //   color: Theme.of(context).dividerColor,
                      // ),
                      UserInfo(
                        Info.custom,
                        // lable: ' data.time',
                        // lable: currentTime,
                        lable: formattedTime,
                        icon: Icons.access_time_outlined,
                        textColor: MTheme.THEME_COLOR,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Disease Complaints: ',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${widget.data?.Disease_name}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MIconButton(
              child: Icon(
                Icons.edit,
                color: MTheme.THEME_COLOR,
                size: 20,
              ),
              color: MTheme.THEME_COLOR,
              padding: EdgeInsets.all(4),
              onTap: () async {
                await context.push(Routes.clinicalNotesEditor, {
                  'doctorID': widget.doctorID.toString(),
                  'userID': widget.userID.toString(),
                  'appointmentID': widget.appointmentID.toString(),
                  'data': widget.data
                });
                print("called");
                widget.bloc.add(Refresh());
              },
            ),
            const SizedBox(
              width: 16,
            ),
            MIconButton(
              child: Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 20,
              ),
              color: Colors.red,
              padding: EdgeInsets.all(4),
              onTap: () async {
                final call =
                    Injector().apiService.get2(path: 'Summary_Delete', query: {
                  'Summary_id': widget.data?.Summary_id,
                });

                final res =
                    await showWaitingDialog(context: context, call: call);
                if (res?.body.message == "Deleted") {
                  print(
                      ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${widget.userID}");
                  var userid = widget.userID;
                  // userID = '123';
                  // userID = userid;
                  widget.bloc.add(UpdateQuery(
                    {
                      'User_id': "$userid",
                      'DoctorId': "${widget.doctorID}",
                    },
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Deleted"),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                  //context.pop();
                }
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 30,
              color: Colors.grey.shade400,
            )
          ],
        ));
  }
}
