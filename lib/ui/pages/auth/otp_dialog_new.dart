import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';

import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';
import 'package:chopper/chopper.dart';

class OtpDialogVKA extends StatefulWidget {
  final String phone;
  final String otpSentToUser;

  const OtpDialogVKA(
      {Key? key, required this.phone, required this.otpSentToUser})
      : super(key: key);

  @override
  State<OtpDialogVKA> createState() => _OtpDialogVKAState();
}

class _OtpDialogVKAState extends State<OtpDialogVKA> {
  @override
  Widget build(BuildContext context) {
    return MDialog(
        title: Row(
          children: [
            const Text('ENTER YOUR OTP CODE HERE'),
            const Spacer(),
            IconButton(
                onPressed: () {
                  context.popDialog();
                },
                icon: Icon(Icons.close_rounded))
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: MPinField(
                length: 6,
                onComplete: (pin) async {
                  print(pin);
                  print(widget.otpSentToUser);
                  if (widget.otpSentToUser == pin) {
                    context.popDialog("success");
                  } else {
                    Fluttertoast.showToast(
                        msg: "Incorrect Pin",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
            ),
            // Text(
            //   'Didn\'t you receive any code?',
            //   style: Theme.of(context).textTheme.caption,
            // ),
            // TextButton(
            //     onPressed: current.inSeconds == 0 ? resendOtp : null,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         const Text('RESEND NEW CODE '),
            //         if (current.inSeconds != 0) ...[
            //           const Text('IN '),
            //           Text(
            //             printDuration(current),
            //             style: const TextStyle(color: Colors.red),
            //           )
            //         ]
            //       ],
            //     )),
            // const SizedBox(
            //   height: 32,
            // )
          ],
        ));
  }

  @override
  void initState() {
    initTimer(const Duration(seconds: Consts.RESEND_OTP_DURATION));
    super.initState();
  }

  Duration current = const Duration(seconds: Consts.RESEND_OTP_DURATION);

  initTimer(Duration length,
      {Duration interval = const Duration(seconds: 1),
        Duration decrement = const Duration(seconds: 1)}) {
    current = length;
    Timer.periodic(interval, (timer) {
      if (current.inSeconds == 0) {
        timer.cancel();
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

  resendOtp() async {
    setState(() {
      initTimer(const Duration(seconds: Consts.RESEND_OTP_DURATION));
    });
  }
}