import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class DoctorRejectsApproval extends StatelessWidget {
  const DoctorRejectsApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDialog(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Doctor Rejected your Request\n Please try after sometime',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
