import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/ui/widgets/m_password_text_field.dart';

import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';
import 'package:chopper/chopper.dart';

import '../../app/app_config.dart';
import '../../components/waiting_dialog.dart';

class ForgotPasswordNewPasswordDialog extends StatefulWidget {
  final String phone;
  final String userID;

  const ForgotPasswordNewPasswordDialog({Key? key, required this.phone, required this.userID}) : super(key: key);

  @override
  State<ForgotPasswordNewPasswordDialog> createState() => _ForgotPasswordNewPasswordDialogState();
}

class _ForgotPasswordNewPasswordDialogState extends State<ForgotPasswordNewPasswordDialog> {

  String
  PHONE = '';

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MDialog(
        title: Row(
          children: [ Text('Enter New Password'),
            const Spacer(),
            IconButton(onPressed: (){
              context.popDialog();
            }, icon: Icon(Icons.close_rounded))
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                child:  PasswordField(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.key,
                    size: 18,
                  ),
                  onChanged: (d) {
                    password.text = d;
                  },
                ),
              ),
              OutlinedButton(
                onPressed: ()async{
                  if (_formKey.currentState!.validate()) {
                    if (AppConfig.of(context)?.config == Config.patient){
                      final call = Injector().apiService.get2(
                          path: 'updateuserpassword',
                          query: {'MobileNo': widget.phone,'UserId':widget.userID,'Password':password.text});
                      final res = await showWaitingDialog(
                          context: context, call: call);
                      print("ressssssssssssssss${(res?.body.Rmessage)=='Password Updated Successfully'}");
                      if((res?.body.Rmessage)=='Password Updated Successfully')
                      {
                        context.pop('changed');
                      }
                    }
                    else{
                      final call = Injector().apiService.get2(
                          path: 'updatedoctorpassword',
                          query: {'MobileNo': widget.phone,'DoctorId':widget.userID,'Password':password.text});
                      final res = await showWaitingDialog(
                          context: context, call: call);
                      print("res?.body${res?.body}");
                      if((res?.body.Rmessage)=='Password Updated Successfully')
                      {
                        context.pop('changed');
                      }

                    }}

                  print("PaSSWORD cHANGED");

                }, child: const Text("Change Password"),),
              const SizedBox(height: 32,)
            ],
          ),
        ));
  }

  @override
  void initState() {

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