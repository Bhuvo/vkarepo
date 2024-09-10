import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../components/login_header.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../../widgets/m_date_time_picker.dart';
import '../../widgets/m_password_text_field.dart';
import '../../widgets/m_radio_chip.dart';
import '../../widgets/m_text_field.dart';

class DoctorSignUpPage extends StatefulWidget {
  DoctorSignUpPage({Key? key}) : super(key: key);

  @override
  State<DoctorSignUpPage> createState() => _DoctorSignUpPageState();
}

class _DoctorSignUpPageState extends State<DoctorSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String gender = "";

  String? maritalStatus;

  TextEditingController doctorNameController = TextEditingController();

  TextEditingController doctorMobileNumberController = TextEditingController();

  TextEditingController doctorAgeController = TextEditingController();

  TextEditingController doctorEmailController = TextEditingController();

  TextEditingController doctorPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageFromDob = TextEditingController();
  int? age;
  int minLines = 1;

  bool isValidEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
        hero: false,
        paddingTop: context.getWPercent(10),
        //bodyPadding: EdgeInsets.only(top: context.getWPercent(60), bottom: 56),
        customHeader: Container(
            alignment: Alignment.center,
            height: context.getWPercent(30),
            padding: const EdgeInsets.all(20),
            child: Hero(
                tag: 'LOGO',
                child: SvgPicture.asset(
                  'assets/svg/tm_logo_w.svg',
                  fit: BoxFit.fitWidth,
                  color: Colors.white,
                  height: context.height * 0.1,
                  width: context.width * 0.1,
                ))),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    'SignUp',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Please sign up to continue.',
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
                          controller: doctorNameController,
                          label: 'Name',
                          prefixIcon: const Icon(Icons.person_rounded),
                          type: MInputType.text,
                          onChanged: (d) {
                            //phone = d;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value?.length == null) {
                              return 'Please enter your email address';
                            } else if (!isValidEmail(value!) &&
                                value.length >= 3) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          // onChanged: (value) {
                          //   print(value);
                          //   print(emailController.text);
                          //   setState(() {
                          //     if (emailController.text.length ) {
                          //       minimumValue = false;
                          //     } else {
                          //       minimumValue = true;
                          //     }
                          //   });
                          // },
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              contentPadding: minLines > 1
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 24)
                                  : null,
                              label: const Text('Email'),
                              hintText: 'Email',
                              hintStyle: const TextStyle(fontSize: 12),
                              counter: const SizedBox(
                                height: 0,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MTextField(
                          controller: doctorMobileNumberController,
                          label: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                          type: MInputType.phone,
                          onChanged: (d) {
                            //phone = d;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MDateTimePicker(
                          label: 'DOB',
                          onChanged: (selectedDate) {
                            setState(() {
                              age = DateTime.now()
                                      .difference(selectedDate!)
                                      .inDays ~/
                                  365;
                              ageFromDob.text = age.toString();
                            });
                          },
                          start: DateTime(1900),
                          end: DateTime.now(),
                          hintDateFormat: 'mm/dd/yyyy',
                          // initial: DateFormat("dd/MM/yyyy").parse('01/01/1900'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MTextField(
                          enabled: false,
                          controller: ageFromDob,
                          label: 'Age',
                          prefixIcon: const Icon(Icons.calendar_month),
                          type: MInputType.email,
                          onChanged: (d) {
                            //phone = d;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MRadioChip<String>(
                          value: gender,
                          onChanged: (d) {
                            setState(() {
                              gender = d;
                            });
                          },
                          items: const [
                            MRadioItem(
                                value: 'Male',
                                icon: FontAwesomeIcons.person,
                                label: 'Male'),
                            MRadioItem(
                                value: 'Female',
                                icon: FontAwesomeIcons.personDress,
                                label: 'Female'),
                            MRadioItem(
                                value: 'Others',
                                icon: FontAwesomeIcons.transgender,
                                label: 'Others'),
                          ],
                          label: 'Gender',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MRadioChip<String>(
                          value: maritalStatus,
                          onChanged: (d) {
                            setState(() {
                              maritalStatus = d;
                            });
                          },
                          items: const [
                            MRadioItem(
                                value: 'Single',
                                icon: Icons.person,
                                label: 'Single'),
                            MRadioItem(
                                value: 'Married',
                                icon: Icons.group,
                                label: 'Married'),
                          ],
                          label: 'Marital Status',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // PasswordField(
                        //   prefixIcon: const Icon(
                        //     FontAwesomeIcons.key,
                        //     size: 18,
                        //   ),
                        //   onChanged: (d) {
                        //     //password = d;
                        //   },
                        // ),
                        MTextField(
                          controller: doctorPasswordController,
                          label: 'Password',
                          prefixIcon: const Icon(Icons.onetwothree),
                          type: MInputType.email,
                          onChanged: (d) {
                            //phone = d;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    // height: context.height * 0.065,
                    child: OutlinedButton(
                        onPressed: () async {
                          if (doctorNameController.text.isNotEmpty &&
                              doctorPasswordController.text.isNotEmpty &&
                              doctorMobileNumberController.text.isNotEmpty &&
                              ageFromDob.text.isNotEmpty &&
                              emailController.text.isNotEmpty) {
                            final call = Injector()
                                .apiService
                                .post(path: 'DoctorRegistration', query: {
                              'Doctor_PhoneNumber':
                                  doctorMobileNumberController.text,
                              //"150933",
                              'Doctor_Name': doctorNameController.text,
                              'Password': doctorPasswordController.text,
                              'Doctor_mailid': emailController.text,
                              'Doctor_Age': ageFromDob.text,
                              'Gender': gender.toString(),
                            });
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            print(call);
                            print(res?.body);
                            Fluttertoast.showToast(
                                msg: "Signup Done Please Log In",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            context.replace(Routes.login);
                          } else {
                            if (doctorNameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Your Name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (emailController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Your Email ID",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (ageFromDob.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Your Age",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (!emailController.text.contains('@') &&
                                !emailController.text.endsWith('.com')) {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Your Mobile Number",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (doctorPasswordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please Enter a Password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (gender.isEmpty || gender == "") {
                              Fluttertoast.showToast(
                                  msg: "Please Select a Gender",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        },
                        child: const Text('Sign Up')),
                  ),
                ]))));
  }
}
