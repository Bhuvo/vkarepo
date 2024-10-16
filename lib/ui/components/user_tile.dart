import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/components/patient_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import '../../model/vka_doctor_details.dart';
import 'user_avatar.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';

class UserTile extends StatelessWidget {
  final VkaDoctorDetails? data;
  final dynamic? patientId;
  final dynamic? date;
  final dynamic? time;
  final bool? isAppointment;

  final Widget? caption, trailing;
  final IconData? emptyAvatar;
  final double avatarRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final String? doctorName;

  const UserTile(
      {Key? key,
      this.data,
      this.patientId,
      this.date,
      this.time,
      this.textStyle,
      this.mainAxisSize = MainAxisSize.max,
      this.emptyAvatar,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.caption,
      this.trailing,
      this.avatarRadius = 22,
      this.padding = const EdgeInsets.all(8.0),
      this.doctorName, this.isAppointment = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = UserProvider.of(context);
    // final doctor = data?.doctorRegistrationList[0].name;
    final patient = PatientProvider.of(context);
    Size size = MediaQuery.of(context).size;
    print("prints details");
    print(patient);
    print(doctor);
    print(patient?.userId);
    print(patient?.gender);
    print(patient?.dob);
    print(patient?.id);
    print(patient?.email);
    print(patient?.patientName);
    print(patient?.patientImage);
    print("details printed above");
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          doctor == null
              ? PatientUserAvatar(
                  radius: avatarRadius,
                  // empty: emptyAvatar,
                )
              : UserAvatar(
                  radius: avatarRadius,
                ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (doctor != null)
                Text(
                    doctor.fullName ??
                        patient?.patientName ??
                        '${patient?.firstName ?? 'dd'} ${patient?.lastName ?? 'ss'}',
                    style: textStyle ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: DefaultTextStyle.of(context).style.color)),
              if (patient != null)
                Text(
                    patient.patientName ??
                        '${patient.firstName ?? 'ere'} ${patient.lastName ?? 'eee'} Age ${patient.age}',
                    style: textStyle ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: DefaultTextStyle.of(context).style.color)),
              if (caption != null) ...[
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.0128),
                      overflow: TextOverflow.fade,
                      maxLines: 3,
                      child: caption!),
                )
              ],
              isAppointment ?? false ?Row(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Patient ID: ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${patientId}   ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MTheme.THEME_COLOR, fontWeight: FontWeight.w700),
                  ),
                  UserInfo(
                    Info.custom,
                    icon: Icons.date_range_rounded,
                    lable: MDateUtils.dateToFormattedDateAlt(date),
                    textColor: MTheme.THEME_COLOR,
                    textSize: 12,
                    iconSize: 14,
                  ),
                  UserInfo(
                    Info.custom,
                    icon: CupertinoIcons.clock,
                    lable: MDateUtils.timeToHourMinute(time),
                    textColor: MTheme.THEME_COLOR,
                    textSize: 12,
                    iconSize: 14,
                  ),
                ],
              ) : Container(),
            ],
          ),
          if (trailing != null) ...[const Spacer(), trailing!]
        ],
      ),
    );
  }
}
