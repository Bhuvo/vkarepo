import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/medical_record.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';
import '../../../model/appointment_data.dart';
import '../../app/app_config.dart';

class MedicalRecordListItem extends StatefulWidget {
  final bool isHeader;
  final MedicalRecord? data;
  final Function()? onTap;
  final AppointmentData? appointment;

  const MedicalRecordListItem(
      {Key? key,
      this.onTap,
      this.isHeader = false,
      this.data,
      this.appointment})
      : super(key: key);

  @override
  State<MedicalRecordListItem> createState() => _MedicalRecordListItemState();
}

class _MedicalRecordListItemState extends State<MedicalRecordListItem> {
  String? appointmentDateTime;
  String? date;
  String? time;
  String? formattedTime;

  @override
  void initState() {
    super.initState();
    // Assign appointmentDateTime value from API or elsewhere
    appointmentDateTime = widget.data?.Appointment_Date;
    if (appointmentDateTime != null) {
      print('appointment time $appointmentDateTime');
      formattedTime = '09/24/2024';
      // _parseDateTime();
    }
  }

  void _parseDateTime() {
    DateTime dateTime =
        DateFormat("M/d/yyyy h:mm:ss a").parse(appointmentDateTime!);
    date = DateFormat("M/d/yyyy").format(dateTime);
    time = DateFormat("h:mm a").format(dateTime);

    DateTime parsedTime = DateFormat("HH:mm:ss").parse(widget.data?.Appointment_Time);
     formattedTime = DateFormat.jm().format(parsedTime);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('data::::::::::::::${widget.data}');
    const user = Consts.DUMMY_USER;

    return MListTile(
        animate: false,
        onTap: widget.onTap,
        child: UserProvider(
          data: User(fullName: widget.data?.User_Name),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const UserTile(
                          avatarRadius: 16,
                        ),
                        UserInfo(
                          Info.custom,
                          icon: Icons.date_range,
                          lable: '${widget.data?.Appointment_Date}',
                          textColor: MTheme.THEME_COLOR,
                        ),
                        UserInfo(Info.custom,
                            icon: Icons.access_time_sharp,
                            lable: '${widget.data?.Appointment_Time}',
                            textColor: MTheme.THEME_COLOR),
                      ],
                    ),
                    if (AppConfig.of(context)?.config == Config.doctor)
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [MTheme.THEME_COLOR, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Text("DOCTOR VIEW"),
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                      ),
                    if (AppConfig.of(context)?.config != Config.doctor)
                    UserProvider(
                      data: User(
                        fullName: widget.appointment?.doctorName,
                      ),
                      child: MGradientContainer(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: UserTile(
                                avatarRadius: 16,
                                padding: const EdgeInsets.all(4),
                                textStyle: const TextStyle(
                                    color: MTheme.THEME_COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                caption: widget.isHeader
                                    ? Text(widget.data?.Hospital_Name ??
                                        'Sri Ramachandra Medical Centre')
                                    : null,
                              ),
                            ),
                            if (widget.isHeader)
                              Container(
                                decoration: BoxDecoration(
                                    color: MTheme.THEME_COLOR,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  'VISIT ID : ${widget.data?.Appointment_id}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (!widget.isHeader) ...[
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  width: 8,
                )
              ]
            ],
          ),
        ));
  }
}
