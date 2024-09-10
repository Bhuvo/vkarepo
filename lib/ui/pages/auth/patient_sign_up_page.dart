import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/login_header.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../../widgets/m_date_time_picker.dart';
import '../../widgets/m_dialog_down.dart';
import '../../widgets/m_password_text_field.dart';
import '../../widgets/m_radio_chip.dart';
import '../../widgets/m_text_field.dart';

class PatientSignUpPage extends StatefulWidget {
  PatientSignUpPage({Key? key}) : super(key: key);

  @override
  State<PatientSignUpPage> createState() => _PatientSignUpPageState();
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final ApiBuilderBloc country_list_bloc =
      ApiBuilderBloc(path: 'CoutryList', api2: true);

  final ApiBuilderBloc state_list_bloc = ApiBuilderBloc(
      path: 'StateByCountry', query: {'Country_id': 1}, api2: true);

  final ApiBuilderBloc city_list_bloc =
      ApiBuilderBloc(path: 'CityByState', query: {'State_id': 31}, api2: true);

  final ApiBuilderBloc location_list_bloc = ApiBuilderBloc(
      path: 'LocationByCity',
      query: {'City_id': 1, 'State_id': 31},
      api2: true);

  Map<String, dynamic>? countryname, statename, cityname, locationname;

  String gender = "";
  String? maritalStatus;
  String? DOB;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageFromDob = TextEditingController();
  int? age;

  // validate email function
  bool isValidEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  int minLines = 1;

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
          child: Column(
            children: [
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
                      enabled: true,
                      controller: nameController,
                      label: 'Name',
                      prefixIcon: const Icon(Icons.person_rounded),
                      type: MInputType.text,
                      onChanged: (d) {
                        //phone = d;
                      },
                    ),
                    // MTextField(
                    //   enabled: true,
                    //   controller: emailController,
                    //   label: 'Email',
                    //   prefixIcon: const Icon(Icons.email_outlined),
                    //   type: MInputType.email,
                    //   onChanged: (d) {
                    //     //phone = d;
                    //   },
                    // ),
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
                        } else if (!isValidEmail(value!) && value.length >= 3) {
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
                    MDateTimePicker(
                      label: 'DOB',
                      onChanged: (selectedDate) {
                        setState(() {
                          print(selectedDate);
                          print("printing date");
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(selectedDate!);
                          print(formattedDate);
                          DOB = formattedDate;

                          print("printing formatted date");
                          age =
                              DateTime.now().difference(selectedDate!).inDays ~/
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
                    // MTextField(
                    //   label: 'Enter Area',
                    //   prefixIcon: const Icon(Icons.location_on),
                    //   type: MInputType.email,
                    //   onChanged: (d) {
                    //     //phone = d;
                    //   },
                    // ),
                    // BlocProvider(
                    //   create: (_) => state_list_bloc..add(const Load()),
                    //   child: ApiBuilder(
                    //     loading: const DropDownShimmer(
                    //       label: 'State',
                    //     ),
                    //     jsonBuilder: (statelist, load) {
                    //       return MDialogDown<Map<String, dynamic>>(
                    //           items: statelist,
                    //           required: false,
                    //           label: 'State',
                    //           // controller: hospitalState,
                    //           onChanged: (d) {
                    //             setState(() {
                    //               statename = d;
                    //               var hospitalStateID =
                    //                   d!['State_id'].toString();
                    //               city_list_bloc.add(UpdateQuery(
                    //                   {'State_id': d['State_id']}));
                    //               print(
                    //                   "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalStateID}");
                    //             });
                    //           },
                    //           value: statename,
                    //           labelKey: 'State_Name');
                    //     },
                    //   ),
                    // ),
                    // BlocProvider(
                    //   create: (_) => city_list_bloc..add(const Load()),
                    //   child: ApiBuilder(
                    //     loading: const DropDownShimmer(
                    //       label: 'City',
                    //     ),
                    //     jsonBuilder: (citylist, load) {
                    //       return MDialogDown<Map<String, dynamic>>(
                    //           items: citylist,
                    //           required: false,
                    //           label: 'City',
                    //           // controller: hospitalCity,
                    //           onChanged: (d) {
                    //             setState(() {
                    //               cityname = d;
                    //               var hospitalCityID =
                    //                   d!['City_id'].toString();
                    //               location_list_bloc.add(UpdateQuery({
                    //                 'City_id': d['City_id'],
                    //                 'State_id': d['State_id']
                    //               }));
                    //               print(
                    //                   "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalCityID}");
                    //             });
                    //           },
                    //           value: cityname,
                    //           labelKey: 'City_Name');
                    //     },
                    //   ),
                    // ),
                    // BlocProvider(
                    //   create: (_) => location_list_bloc..add(const Load()),
                    //   child: ApiBuilder(
                    //     empty: Container(),
                    //     loading: const DropDownShimmer(
                    //       label: 'Location',
                    //     ),
                    //     jsonBuilder: (locationlist, load) {
                    //       return MDialogDown<Map<String, dynamic>>(
                    //           items: locationlist,
                    //           required: false,
                    //           label: 'Location',
                    //           // controller: hospitalLocation,
                    //           onChanged: (d) {
                    //             setState(() {
                    //               locationname = d;
                    //               var hospitalLocationID =
                    //                   d!['Location_id'].toString();
                    //               print(
                    //                   "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalLocationID}");
                    //             });
                    //           },
                    //           value: locationname,
                    //           labelKey: 'Location_Name');
                    //     },
                    //   ),
                    // ),
                    // MTextField(
                    //   label: 'Enter Pincode',
                    //   prefixIcon: const Icon(Icons.pin_drop),
                    //   type: MInputType.phone,
                    //   onChanged: (d) {
                    //     //phone = d;
                    //   },
                    // ),
                    // MTextField(
                    //   enabled: true,
                    //   controller: mobileNumberController,
                    //   label: 'Phone Number',
                    //   prefixIcon: const Icon(Icons.phone),
                    //   type: MInputType.phone,
                    //   onChanged: (d) {
                    //     //phone = d;
                    //   },
                    // ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value?.length == null) {
                          return 'Please enter your mobile number';
                        } else if (mobileNumberController.text.length < 10 &&
                            mobileNumberController.text.length >= 1) {
                          return 'Please enter a 10 digit Mobile Number';
                        }
                        return null;
                      },
                      controller: mobileNumberController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          contentPadding: minLines > 1
                              ? const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 24)
                              : null,
                          label: const Text('Phone Number'),
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(fontSize: 12),
                          counter: const SizedBox(
                            height: 0,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              MTextField(
                enabled: true,
                controller: passwordController,
                label: 'Password',
                prefixIcon: const Icon(Icons.onetwothree),
                type: MInputType.email,
                onChanged: (d) {
                  //phone = d;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              SizedBox(
                width: double.maxFinite,
                // height: context.height * 0.065,
                child: OutlinedButton(
                  onPressed: () async {
                    print("sign up clicked");
                    if (nameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        mobileNumberController.text.isNotEmpty &&
                        mobileNumberController.text.length == 10 &&
                        ageFromDob.text.isNotEmpty &&
                        emailController.text.isNotEmpty) {
                      // final call = Injector()
                      //     .apiService
                      //     .get(path: 'VKA_PatientRegistration', query: {
                      //   "Patient_Id": 0,
                      //   "First_Name": nameController.text,
                      //   "DOB": DOB.toString(),
                      //   "Age": ageFromDob.text,
                      //   "Gender": gender,
                      //   "Phone_Number": mobileNumberController.text,
                      //   "EMail_Id": emailController.text,
                      //   "Password": passwordController.text,
                      // });
                      final call = Injector()
                          .apiService
                          .post(path: 'PatientRegistration', query: {
                        'MobileNumber': mobileNumberController.text,
                        "DOB": DOB.toString(),
                        'User_Name': nameController.text,
                        'Password': passwordController.text,
                        'Emailid': emailController.text,
                        'Age': ageFromDob.text,
                        'Gender1': gender,
                      });
                      final res =
                          await showWaitingDialog(context: context, call: call);
                      print(call);
                      print(res?.body);
                      Fluttertoast.showToast(
                          msg: res?.body?.message.toString() ?? '',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      context.replace(Routes.login);
                    } else {
                      if (nameController.text.isEmpty) {
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
                      if (!emailController.text.contains('@') &&
                          !emailController.text.endsWith('.com')) {
                        Fluttertoast.showToast(
                            msg: "Invalid Email Id Format",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      if (ageFromDob.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Select Age",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      if (mobileNumberController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Your Mobile Number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      if (passwordController.text.isEmpty) {
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
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
