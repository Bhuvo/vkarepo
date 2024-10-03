import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';


class WaitingTimerForApproval extends StatefulWidget {
  const WaitingTimerForApproval({Key? key}) : super(key: key);

  @override
  State<WaitingTimerForApproval> createState() => _WaitingTimerForApprovalState();
}

class _WaitingTimerForApprovalState extends State<WaitingTimerForApproval> {

  @override
  void initState() {
    super.initState();
    initTimer(const Duration(seconds: Consts.WAITING_DURATION));
  }

  @override
  Widget build(BuildContext context) {
    return MDialog(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            CupertinoActivityIndicator(),
            SizedBox(
              height: 16,
            ),
            Text(
              printDuration(current),
              style: const TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Kindly Wait for few Minutes until Doctor Accepts your Consultation Request. Please do not press the back button',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }


Duration current = const Duration(seconds: Consts.WAITING_DURATION);

initTimer(Duration length,
    {Duration interval = const Duration(seconds: 1),
      Duration decrement = const Duration(seconds: 1)}) {
  current = length;
  Timer.periodic(interval, (timer) {
    if (current.inSeconds == 0) {
      timer.cancel();
      context.popDialog(Consts.TIMEOUT);
    } else {
      if (mounted) {
        setState(() {
          current =
              Duration(seconds: current.inSeconds - decrement.inSeconds);
        });
      } else {
        timer.cancel();
      }
    }
  });
}
}
