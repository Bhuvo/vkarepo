import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

import 'user_avatar.dart';
import 'user_info.dart';

class PatientScheduleHeader extends StatelessWidget {
  final Widget? caption;
  final String? date, time, patientImage;

  const PatientScheduleHeader(
      {Key? key, this.caption, this.date, this.time, this.patientImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = UserProvider.of(context);
    final patient = PatientProvider.of(context);

    DateFormat timeFormat = DateFormat('h:mm a');
    DateTime time24hrsFormat = DateFormat('HH:mm:ss').parse(time!);

    String formattedTime = timeFormat.format(time24hrsFormat);

    return Row(
      children: [
        const SizedBox(
          width: 2,
        ),
        // UserAvatar(
        //   radius: 20,
        // ),
        patientImage == null
            ? Container(
                width: 20 * 2,
                height: 20 * 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).dividerColor,
                    border: Border.all(color: Colors.white)
                    //boxShadow: MTheme.SHADOW_LIGHT
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(
                        CupertinoIcons.person_alt,
                        size: 20 * 1.5,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: ClipOval(
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/no_image.jpg'),
                    image: NetworkImage(
                        "https://www.timesmed.com/images/doc-imgs/$patientImage"),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Center(child:Icon(Icons.error),);
                    },
                    fit: BoxFit.fitHeight,
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.056,
                  ),
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor?.fullName ?? patient?.userName ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            if (caption != null) caption!
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        UserInfo(
          Info.custom,
          icon: FontAwesomeIcons.calendar,
          lable: date ?? '13 May 2022',
          textColor: MTheme.THEME_COLOR,
          iconSize: MediaQuery.of(context).size.height * 0.018,
        ),
        UserInfo(
          Info.custom,
          icon: FontAwesomeIcons.clock,
          lable: formattedTime,
          textColor: MTheme.THEME_COLOR,
          iconSize: MediaQuery.of(context).size.height * 0.018,
        ),
      ],
    );
  }
}
