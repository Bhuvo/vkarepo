import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class DoctorScheduleListItem extends StatelessWidget {
  final InstantDoctor? data;
  final VoidCallback? onBookTap;
  final String? doctorGender;
  final String? doctorTotalExperience;
  final String? doctorQualification;
  final String? doctorFee;

  const DoctorScheduleListItem({
    Key? key,
    this.data,
    this.onBookTap,
    this.doctorGender,
    this.doctorTotalExperience,
    this.doctorQualification,
    this.doctorFee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('dataaaaaaaaaa from book app    $data');
    print(data?.Doctor_Name);
    print(data?.Doctor_ExperienceYears);
    print(doctorTotalExperience);
    return UserProvider(
      data: User(fullName: data?.Doctor_Name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            UserTile(
              avatarRadius: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              caption: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //     '${data?.Doctor_Qualification ?? 'MD (General Medicine), General Physician'}'),
                  Text(doctorQualification ??
                      data?.Doctor_Qualification ??
                      "MBBS"),
                  // doctorQualification == "null"
                  //     ? const Text("MBBS")
                  //     : Text("$doctorQualification"),
                  const SizedBox(
                    height: 6,
                  ),
                  Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.person,
                        color: MTheme.ICON_COLOR,
                        size: 10,
                      ),
                      // Text('${data?.Gender ?? ''}'),
                      Text(doctorGender ?? data?.Gender),
                      const FaIcon(
                        FontAwesomeIcons.briefcaseMedical,
                        color: MTheme.ICON_COLOR,
                        size: 10,
                      ),
                      Text(
                        '${doctorTotalExperience ?? data?.Doctor_ExperienceYears} Years',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(data?.Registrations ??
                      'Reg.No:55459-Tamil Nadu Medical Council-1993'),
                ],
              ),
            ),
            MGradientContainer(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: UserInfo(
                    Info.custom,
                    icon: FontAwesomeIcons.calendar,
                    lable: MDateUtils.dateToFormattedDate(
                        DateTime.now().toIso8601String(), true),
                    textColor: MTheme.THEME_COLOR,
                    textSize: 11,
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: UserInfo(
                    Info.custom,
                    icon: FontAwesomeIcons.clock,
                    lable: '10:00 PM - 7:00 PM',
                    // lable: ' ${data?.Timing}',
                    textColor: MTheme.THEME_COLOR,
                    textSize: 11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: UserInfo(
                    Info.custom,
                    // lable:
                    //     '₹ ${data?.Fee ?? data?.Eclinic_Charges ?? data?.ClinicFee}',
                    lable:
                        '₹ ${doctorFee ?? data?.Fee ?? data?.Eclinic_Charges ?? data?.ClinicFee}',
                    textColor: Colors.red,
                    textSize: 20,
                  ),
                ),
              ],
            )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.maxFinite,
              height: 50,
              child: OutlinedButton(
                onPressed: onBookTap ??
                    () {
                      context.pop(data);
                      //context.push(Routes.inQueuePage);
                    },
                child: const Text(Consts.BOOK_APPOINTMENT),
              ),
            )
          ],
        ),
      ),
    );
  }
}
