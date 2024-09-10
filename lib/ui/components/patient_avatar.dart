import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

import '../providers/patient_provider.dart';

class PatientUserAvatar extends StatelessWidget {
  final double radius;
  final IconData? empty;

  const PatientUserAvatar({Key? key, this.radius = 26, this.empty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = UserProvider.of(context);
    final user = PatientProvider.of(context);
    print("TTTT${user}");
    return Container(
      width: radius * 2,
      height: radius * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Theme.of(context).dividerColor,
          border: Border.all(color: Colors.white)
          //boxShadow: MTheme.SHADOW_LIGHT
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              empty ?? CupertinoIcons.person_alt,
              size: radius * 1.5,
              color: Colors.white70,
            ),
            if (user != null &&
                user.patientImage != null &&
                user.patientImage != "user.png")
              CachedNetworkImage(
                imageUrl:
                    '${Consts.Patient_Display_Picture_Upload}${user.patientImage ?? ''}',
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              )
          ],
        ),
      ),
    );
  }
}
