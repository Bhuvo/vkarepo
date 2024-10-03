import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/shimmer/drop_down_shimmer.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:http/http.dart' as http;
import '../../theme/theme.dart';

//https://tmsnew.timesmed.com/WebAPIP/RelationShipRegister?User_Name=Vignesh&Gender=Male&MobileNumber=9000000000&FamilyMember_id=1&DOB=02/06/1992&Age=28&PrimaryAccount_No=0&UHID=0&PrimaryMobile=9884992217&Primary_User_id=3158

class AddFamily extends StatefulWidget {
  final Patient? data;
  final ApiBuilderBloc? bloc;

  const AddFamily({Key? key, this.data, this.bloc}) : super(key: key);

  @override
  State<AddFamily> createState() => _AddFamilyState();
}

class _AddFamilyState extends State<AddFamily> {
  final GlobalKey<FormState> form = GlobalKey();
  late Patient data;
  Map<String, dynamic>? relation;
  DateDuration? duration;
  String? maritalStatus;
  String? gender;
  dynamic age;
  TextEditingController ageString = TextEditingController();
  TextEditingController ageFromDob = TextEditingController();
  bool showMobileField = false;
  String primaryUserMobileNumber = '';

  fetchData() async {
    var queryParameters = {
      'PatientId': LocalStorage.getUser().userId.toString(),
    };
    final uri3 =
        Uri.parse("https://tmsnew.timesmed.com/WebAPI2/VKAPatientProfile")
            .replace(
                queryParameters: queryParameters = {
      'PatientId': LocalStorage.getUser().userId.toString(),
    });
    final response3 = await http.get(uri3);
    print(response3.body);
    var jsonResponse = jsonDecode(response3.body);
    setState(() {
      primaryUserMobileNumber =
          jsonResponse["Data"][0]["Phone_Number"].toString();
    });
    print(primaryUserMobileNumber);
    print("prints primary user number");
  }



  void onTextChanged(String value) {
    // Check if the entered text is empty.
    if (value.isEmpty) {
      // Clear the controller's value.
      // _controller.clear();
    }
  }

  @override
  void initState() {
    if (widget.data != null) {
      data = widget.data!;
    } else {
      final user = LocalStorage.getUser();
      data = Patient(
          primaryUserId: user.userId,
          primaryAccountNo: 0,
          primaryMobile: user.phone);
    }
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text(Consts.ADD_PATIENT.toUpperCase()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MTextField(
                  label: 'Patient Name',
                  value: data.userName,
                  onChanged: (d) {
                    data = data.copyWith(userName: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: MDateTimePicker(
                        start: DateTime(1950),
                        end: DateTime.now(),
                        label: 'DOB',
                        onChanged: (DateTime? date) {
                          print(date);
                          print("printing date");
                          data = data.copyWith(
                            dob: MDateUtils.dateToFormattedDate(
                              date.toString(),
                              true,
                              generic: true,
                            ),
                          );
                          print(data.dob?.substring(6, 10));
                          final DOB_Day = data.dob?.substring(0, 2);
                          final DOB_Year = data.dob?.substring(6, 10);
                          var DOB_Month = data.dob?.substring(3, 5);
                          // switch (DOB_Month) {
                          //   case "Jan":
                          //     {
                          //       DOB_Month = "01";
                          //     }
                          //     break;
                          //   case "Feb":
                          //     {
                          //       DOB_Month = "02";
                          //     }
                          //     break;
                          //   case "Mar":
                          //     {
                          //       DOB_Month = "03";
                          //     }
                          //     break;
                          //   case "Apr":
                          //     {
                          //       DOB_Month = "04";
                          //     }
                          //     break;
                          //   case "May":
                          //     {
                          //       DOB_Month = "05";
                          //     }
                          //     break;
                          //   case "Jun":
                          //     {
                          //       DOB_Month = "06";
                          //     }
                          //     break;
                          //   case "Jul":
                          //     {
                          //       DOB_Month = "07";
                          //     }
                          //     break;
                          //   case "Aug":
                          //     {
                          //       DOB_Month = "08";
                          //     }
                          //     break;
                          //   case "Sep":
                          //     {
                          //       DOB_Month = "09";
                          //     }
                          //     break;
                          //   case "Oct":
                          //     {
                          //       DOB_Month = "10";
                          //     }
                          //     break;
                          //   case "Nov":
                          //     {
                          //       DOB_Month = "11";
                          //     }
                          //     break;
                          //   case "Dec":
                          //     {
                          //       DOB_Month = "12";
                          //     }
                          //     break;
                          //   default:
                          //     {
                          //       DOB_Month;
                          //     }
                          //     break;
                          // }
                          print("printing your dob down");
                          final now = DateTime(int.parse(DOB_Year!),
                              int.parse(DOB_Month!), int.parse(DOB_Day!));
                          duration = AgeCalculator.age(now);
                          print('Your age is ${duration?.years}');
                          setState(() {
                            age =
                                DateTime.now().difference(date!).inDays ~/ 365;
                            ageFromDob.text = age.toString();
                            // age = duration?.years;
                            // ageString.text = age.toString();
                            data = data.copyWith(age: age.toString());
                            if (age >= 18) {
                              setState(() {
                                showMobileField = true;
                              });
                            } else {
                              setState(() {
                                showMobileField = false;
                              });
                            }
                          });
                          print("printing data");
                          print(data);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Expanded(child: Text("Age:${data.age??'0'}",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey.shade700, fontSize: 17),)),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: ageFromDob,
                  enabled: false,
                  decoration: const InputDecoration(
                      label: Text('Age'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                // MTextField(
                //   // enabled: false,
                //   controller: ageString,
                //   label: 'Age',
                //   value: data.age.toString(),
                //   type: MInputType.numeric,
                //   // onChanged: (d) {
                //   //   data = data.copyWith(age: d);
                //   //   // data = data.copyWith(age: ageString.text);
                //   // },
                // ),
                showMobileField == true
                    ? MTextField(
                        label: 'Mobile Number',
                        value: data.mobile,
                        type: MInputType.phone,
                        onChanged: (d) {
                          data = data.copyWith(mobile: d);
                        },
                      )
                    : Container(),

                const SizedBox(
                  height: 16,
                ),
                MRadioChip<String>(
                  value: gender,
                  onChanged: (d) {
                    setState(() {
                      gender = d;
                      data = data.copyWith(gender: d);
                      print(data);
                      print(data.gender);
                      print(gender);
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
                const SizedBox(
                  height: 16,
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
                        icon: FontAwesomeIcons.circle,
                        label: 'Single'),
                    MRadioItem(
                        value: 'Married',
                        icon: FontAwesomeIcons.ring,
                        label: 'Married'),
                  ],
                  label: 'Marital Status',
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocProvider(
                  create: (_) => ApiBuilderBloc(
                      path: 'RelationShipList',
                      query: {'User_id': LocalStorage.getUser().userId})
                    ..add(const Load()),
                  child: ApiBuilder(
                    loading: const DropDownShimmer(
                      label: 'Relationship',
                    ),
                    jsonBuilder: (rels, load) {
                      return MDialogDown<Map<String, dynamic>>(
                          value: relation,
                          items: rels,
                          label: 'Relationship',
                          onChanged: (d) {
                            setState(() {
                              relation = d;
                            });
                            data = data.copyWith(
                                relationName: d?['RelationName'],
                                familyMemberId: d?['FamilyMember_id']);
                          },
                          labelKey: 'RelationName');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: OutlinedButton(
          child: const Text('Click to Register'),
          onPressed: () async {
            print(data.age);
            print(data.mobile);
            print(LocalStorage.getUser().phoneNumber);
            print(data.phone);
            print(LocalStorage.getUser().phone);
            print(data.primaryMobile);
            print(LocalStorage.getUser().whatsapp);
            print(data.whatsapp);
            print("age and mobile number");


            if (showMobileField == false) {
              setState(() {
                data = data.copyWith(mobile: primaryUserMobileNumber);
              });
            }
            if (data.userName == null || data.userName == "") {
              await Fluttertoast.showToast(
                  msg: "Please enter Patient Name",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (data.age == null) {
              await Fluttertoast.showToast(
                  msg: "Please Select Date of Birth",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (data.mobile == null && showMobileField == true) {
              await Fluttertoast.showToast(
                  msg: "Please enter your Mobile Number",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);

              // else if (showMobileField == true) {
              // if (data.mobile == null) {
              //   await Fluttertoast.showToast(
              //       msg: "Please enter your Mobile Number",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: MTheme.THEME_COLOR,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // } else if (data.gender == null) {
              //   await Fluttertoast.showToast(
              //       msg: "Please Select a Gender",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: MTheme.THEME_COLOR,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // } else if (maritalStatus == null) {
              //   await Fluttertoast.showToast(
              //       msg: "Please Select your Marital Status",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: MTheme.THEME_COLOR,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // } else if (data.relationName == null) {
              //   await Fluttertoast.showToast(
              //       msg: "Please Select your Relationship",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: MTheme.THEME_COLOR,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // } else {
              //   final call = Injector().apiService.get(
              //         path: 'RelationShipRegister',
              //         query: data.toJson(),
              //       );
              //   final res =
              //       await ApiFacade.callApi(context: context, call: call);
              //   if (res != null) {
              //     context.pop(data);
              //   }
              // }
            } else if (data.gender == null) {
              await Fluttertoast.showToast(
                  msg: "Please Select a Gender",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (maritalStatus == null) {
              await Fluttertoast.showToast(
                  msg: "Please Select your Marital Status",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (data.relationName == null) {
              await Fluttertoast.showToast(
                  msg: "Please Select your Relationship",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: MTheme.THEME_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              final call = Injector().apiService.get(
                    path: 'RelationShipRegister',
                    query: data.toJson(),
                  );
              final res = await ApiFacade.callApi(context: context, call: call);
              if (res != null) {
                context.pop(data);
              }
            }
          },
        ),
      ),
    );
  }
}
