import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class PatientBottomNavigation extends StatelessWidget {
  const PatientBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MBottomNavigation(
      key: ValueKey('bottomnav'),
      items: Consts.PATIENT_BOTTOM_NAVIGATION_ITEMS,
    );
  }
}
