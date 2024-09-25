import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/service/firebase/messaging_monitor.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/pages/auth/doctor_sign_up_page.dart';
import 'package:timesmedlite/ui/pages/auth/otp_dialog.dart';
import 'package:timesmedlite/ui/components/login_header.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/auth/patient_sign_up_page.dart';
import 'package:timesmedlite/ui/pages/demo/demo_flow_select.dart';
import 'package:timesmedlite/ui/providers/flow_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:chopper/chopper.dart';

import '../../../const/consts.dart';
import '../../widgets/m_password_text_field.dart';
import 'confirm_mobile_dialog.dart';
import 'forget_paasword_dialog.dart';
import 'otp_dialog_new.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = '', phone = '';

  void saveInfo(Response res, {required BuildContext context}) {
    if (res.body.code == '1') {
      print('doctor login ......................................');

      LocalStorage.setString(LocalStorage.IsType, Consts.doctor);
    } else if (res.body.code == '2') {
      print('patient login ......................................');
      LocalStorage.setString(LocalStorage.IsType, Consts.nurse);
    } else if (res.body.code == '3') {
      print('patient login ......................................');
      LocalStorage.setString(LocalStorage.IsType, Consts.frontOffice);
    } else {
      print('error login ......................................');
    }
    LocalStorage.setJson(LocalStorage.USER, res.body!.data!);
    MessagingMonitor.init(AppConfig.of(context)!.config);
    if (AppConfig.of(context)?.config == Config.doctor) {
      context.replace(Routes.currentAppointment); //patientWaitingList
    } else {
      context.replace(Routes.selectPatient);
    }
  }

  final _formKey = GlobalKey<FormState>();

  String selectedType = 'Select Type';

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      hero: false,
      paddingTop: context.getWPercent(50),
      //bodyPadding: EdgeInsets.only(top: context.getWPercent(60), bottom: 56),
      customHeader: const LoginHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                'LOGIN',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Please sign in to continue.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MTextField(
                      label: 'Phone Number',
                      prefixIcon: const Icon(Icons.person_rounded),
                      type: MInputType.phone,
                      onChanged: (d) {
                        phone = d;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordField(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.key,
                        size: 18,
                      ),
                      onChanged: (d) {
                        password = d;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        child: Text(
                          'Forgot password',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.color),
                        ),
                        onTap: () async {
                          if (AppConfig.of(context)?.config == Config.patient) {
                            final res1 = await showDialog(
                              context: context,
                              builder: (c) => ConfirmMobileDialog(
                                phone: phone,
                              ),
                            );
                            if (res1 != null && res1.length == 10) {
                              print("ressssssssssssssssssss$res1");
                              final call = Injector().apiService.get2(
                                  path: 'sendotptuser',
                                  query: {'MobileNo': res1});
                              final res = await showWaitingDialog(
                                  context: context, call: call);
                              print("res?.body${res?.body.data == null}");
                              if (res?.body.data != null) {
                                if (kDebugMode) {
                                  print(res?.body.data['OTP']);
                                }
                                final otpResponse = await showDialog(
                                    context: context,
                                    builder: (c) => OtpDialogVKA(
                                          phone: phone,
                                          otpSentToUser: res?.body.data['OTP'],
                                        ),
                                    barrierDismissible: false);
                                print("otpResponse$otpResponse");
                                if (otpResponse == 'success') {
                                  print("otpResponse$otpResponse");
                                  final R = await showDialog(
                                      context: context,
                                      builder: (c) =>
                                          ForgotPasswordNewPasswordDialog(
                                            phone: res1,
                                            userID: res?.body.data['UserId'],
                                          ),
                                      barrierDismissible: false);

                                  if (R == 'changed') {
                                    context.replace(Routes.splash);
                                  }
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: res?.body.Rmessage,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }
                            }
                          } else {
                            final res1 = await showDialog(
                              context: context,
                              builder: (c) => ConfirmMobileDialog(
                                phone: phone,
                              ),
                            );
                            if (res1 != null && res1.length == 10) {
                              print("ressssssssssssssssssss$res1");
                              final call = Injector().apiService.get2(
                                  path: 'sendotptdocor',
                                  query: {'MobileNo': res1});
                              final res = await showWaitingDialog(
                                  context: context, call: call);

                              if (res?.body.data != null) {
                                if (kDebugMode) {
                                  print(res?.body.data['OTP']);
                                }
                                final otpResponse = await showDialog(
                                    context: context,
                                    builder: (c) => OtpDialogVKA(
                                          phone: phone,
                                          otpSentToUser: res?.body.data['OTP'],
                                        ),
                                    barrierDismissible: false);
                                print("otpResponse$otpResponse");
                                if (otpResponse == 'success') {
                                  print("otpResponse$otpResponse");
                                  final R = await showDialog(
                                      context: context,
                                      builder: (c) =>
                                          ForgotPasswordNewPasswordDialog(
                                            phone: res1,
                                            userID: res?.body.data['DoctorId'],
                                          ),
                                      barrierDismissible: false);

                                  if (R == 'changed') {
                                    context.replace(Routes.splash);
                                  }
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: res?.body.Rmessage,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }
                            }
                          }
                        }),
                    Icon(
                      Icons.help,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    )
                  ],
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DoctorSignUpPage()));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.maxFinite,
                //height: MediaQuery.of(context).size.height * 0.065,
                child: OutlinedButton(
                    onPressed: () async {
                      print(password);
                      if (_formKey.currentState!.validate()) {
                        if (AppConfig.of(context)?.config == Config.patient) {
                          final call = Injector().apiService.login(
                              path: 'LoginValidation',
                              mobile: phone,
                              password: password);
                          final Response? res = await ApiFacade.callApi(
                              context: context, call: call);
                          if (res != null) {
                            saveInfo(res, context: context);
                          }
                        } else {
                          final call = Injector().apiService.login(
                              path: 'DoctorLogin',
                              doctorPhone: phone,
                              password: password);
                          final Response? res = await ApiFacade.callApi(
                              context: context, call: call);
                          if (res != null) {
                            saveInfo(res, context: context);
                          }
                        }
                      }
                    },
                    child: const Text('Login')),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Don’t have an account?',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.color)),
                    Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                onPressed: () {
                  if (AppConfig.of(context)?.config == Config.doctor) {
                    showDialog(
                      context: context,
                      builder: (c) {
                        String? tempSelectedType =
                            selectedType; // Create a local variable to hold the state within the dialog
                        return AlertDialog(
                          title: Text('Select the Register Type'),
                          content: StatefulBuilder(
                            builder: (context, setState) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButton<String>(
                                  hint: Text(tempSelectedType ?? 'Select Type'),
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('Doctor'), value: 'Doctor'),
                                    DropdownMenuItem(
                                        child: Text('Nurse'), value: 'Nurse'),
                                    DropdownMenuItem(
                                        child: Text('Front Office'),
                                        value: 'Front Office'),
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      tempSelectedType =
                                          val; // Update local state within the dialog
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text('Confirm'),
                                        onPressed: () {
                                          if (tempSelectedType != null) {
                                            setState(() {
                                              selectedType =
                                                  tempSelectedType!; // Update the original state
                                            });
                                            Navigator.pop(
                                                context); // Close the dialog

                                            if (selectedType == 'Doctor') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorSignUpPage(),
                                                ),
                                              );
                                            } else if (selectedType ==
                                                'Nurse') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorSignUpPage(), // Assuming you have a separate page for Nurse
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DoctorSignUpPage()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientSignUpPage()));
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).dividerColor)),
                padding: const EdgeInsets.all(8),
                child: const Text('OR'),
              ),
              const SizedBox(
                height: 24,
              ),
              MTextField(
                label: 'Mobile Number',
                prefixIcon: const Icon(Icons.phone_rounded),
                type: MInputType.phone,
                onChanged: (d) {
                  phone = d;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: OutlinedButton(
                    onPressed: () async {
                      if (AppConfig.of(context)?.config == Config.patient) {
                        final call = Injector().apiService.get(
                            path: 'Generate_OTP',
                            query: {'MobileNumber': phone});
                        final Response? res = await ApiFacade.callApi(
                            context: context, call: call);

                        if (res != null) {
                          if (kDebugMode) {
                            print(res.body);
                          }
                          final Response? otpResponse = await showDialog(
                              context: context,
                              builder: (c) => OtpDialog(
                                    phone: phone,
                                  ),
                              barrierDismissible: false);
                          if (otpResponse != null) {
                            saveInfo(otpResponse, context: context);
                          }
                        }
                      } else {
                        ///TODO: Doctor Apis
                      }
                    },
                    child: const Text('Send OTP')),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
