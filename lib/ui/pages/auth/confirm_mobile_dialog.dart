import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';

import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';
import 'package:chopper/chopper.dart';

class ConfirmMobileDialog extends StatefulWidget {
  final String phone;

  const ConfirmMobileDialog({Key? key, required this.phone}) : super(key: key);

  @override
  State<ConfirmMobileDialog> createState() => _ConfirmMobileDialogState();
}

class _ConfirmMobileDialogState extends State<ConfirmMobileDialog> {

  String password = '',
      PHONE = '';

  TextEditingController mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(PHONE);
    return MDialog(
        title: Row(
          children: [
            mobileNumber.text.length==10?const Text('Confirm your mobile number'):const Text('Please enter your mobile number'),
            const Spacer(),
            IconButton(onPressed: (){
              context.popDialog();
            }, icon: Icon(Icons.close_rounded))
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
              child: MTextField(
                controller:mobileNumber ,
                label: 'Phone Number',
                prefixIcon: const Icon(Icons.person_rounded),
                type: MInputType.phone,
                onChanged: (d) {
                  PHONE = d;
                  setState(() {

                  });
                },
              ),
            ),
            mobileNumber.text.length==10?OutlinedButton(
              onPressed: (){
                context.pop( mobileNumber.text);
                mobileNumber.clear();

              }, child: const Text("Confirm Mobile"),):Container(),
            const SizedBox(height: 32,)
          ],
        ));
  }

  @override
  void initState() {
    // initTimer(const Duration(seconds: Consts.RESEND_OTP_DURATION));
    PHONE = widget.phone;
    mobileNumber.text=widget.phone;
    super.initState();
  }

  Duration current = const Duration(seconds: Consts.RESEND_OTP_DURATION);
  initTimer(Duration length, {Duration interval = const Duration(seconds: 1), Duration decrement = const Duration(seconds: 1)}){
    current = length;
    Timer.periodic(interval, (timer) {
      if(current.inSeconds == 0) {
        timer.cancel();
      } else {
        if(mounted){
          setState((){
            current = Duration(seconds: current.inSeconds - decrement.inSeconds);
          });
        } else {
          timer.cancel();
        }

      }
    });
  }

  resendOtp() async {
    setState((){
      initTimer(const Duration(seconds: Consts.RESEND_OTP_DURATION));
    });
  }
}