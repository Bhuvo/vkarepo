import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';

class UserAgeGender extends StatelessWidget {
  const UserAgeGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context);
    final patient = PatientProvider.of(context);
    return Text('Age: ${user?.age ?? patient?.age}, ${user?.gender ?? patient?.gender}', );
  }
}
