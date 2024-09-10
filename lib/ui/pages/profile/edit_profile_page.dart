import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
import '../appointment/book_appointment_page.dart';
import '../../bloc/patient/patient_bloc.dart';
import '../../components/waiting_dialog.dart';
import '../../theme/theme.dart';

class EditAccountProfileScreen extends StatefulWidget {
  // final ApiBuilderBloc? bloc;
  final String patientId;
  final String Patient_Registration_Number;
  final String First_Name;
  final String Last_Name;
  final String DOB;
  final String Age;
  final String Gender;
  final String Phone_Number;
  final String EMail_Id;
  final String Password;
  final String patientImage;
  final Function functionToRunBloc;

  const EditAccountProfileScreen({
    Key? key,
    required this.patientId,
    required this.Patient_Registration_Number,
    required this.First_Name,
    required this.Last_Name,
    required this.DOB,
    required this.Age,
    required this.Gender,
    required this.Phone_Number,
    required this.EMail_Id,
    required this.Password,
    required this.patientImage,
    required this.functionToRunBloc,
  }) : super(key: key);

  @override
  State<EditAccountProfileScreen> createState() =>
      _EditAccountProfileScreenState();
}

class _EditAccountProfileScreenState extends State<EditAccountProfileScreen> {
  final GlobalKey<FormState> form = GlobalKey();
  late Patient data;
  Map<String, dynamic>? relation;
  DateDuration? duration;
  String? maritalStatus;
  dynamic age;
  TextEditingController ageString = TextEditingController();
  bool showMobileField = false;

  bool dobChanged = false;

  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController userMobileNumber = TextEditingController();
  TextEditingController userPrimaryMobileNumber = TextEditingController();
  TextEditingController userPrimaryUserId = TextEditingController();
  TextEditingController ageFromDob = TextEditingController();

  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController patientRegistrationNumberController =
      TextEditingController();
  TextEditingController userIdController = TextEditingController();

  String gender = "";
  String userId = "";
  String familyMemberId = "";
  String relationShipName = "";

  // Map<String, dynamic>? relationShipName;
  String primaryMobile = "";
  String primaryUserId = "";
  String DOB = "";

  String mmddyyyy = "";
  DateTime? initialDate;

  @override
  void initState() {
    print(widget.patientId);
    print(widget.DOB);
    print(widget.patientImage);
    print("patient image here");
    setState(() {
      userFirstNameController.text = widget.First_Name;
      userLastNameController.text = widget.Last_Name;
      userAge.text = widget.Age;
      userMobileNumber.text = widget.Phone_Number;
      gender = widget.Gender;
      emailIdController.text = widget.EMail_Id;
      passwordController.text = widget.Password;
      patientRegistrationNumberController.text =
          widget.Patient_Registration_Number;
      userIdController.text = widget.patientId.toString();
      // primaryUserId = widget.primaryUserId;
      // userPrimaryMobileNumber.text = widget.primaryMobile;
      // userPrimaryUserId.text = widget.primaryUserId;

      // List<String> parts = widget.DOB.split('/');
      // mmddyyyy = '${parts[1]}/${parts[0]}/${parts[2]}';
      //
      // initialDate = DateTime.parse("${parts[2]}-${parts[1]}-${parts[0]}");
      // print("initial date $initialDate");
      String apiDate = widget.DOB.toString();
      DateFormat apiDateFormat = DateFormat("MM/dd/yyyy hh:mm:ss a");
      if (apiDate == "") {
        DateTime now = DateTime.now();
        String formattedDateTime = DateFormat('M/d/y hh:mm:ss a').format(now);
        apiDate = formattedDateTime;
        DateTime dateTime = apiDateFormat.parse(apiDate);
        DateTime dateOnly =
            DateTime(dateTime.year, dateTime.month, dateTime.day);
        initialDate = dateOnly;
      } else {
        DateTime dateTime = apiDateFormat.parse(apiDate);
        DateTime dateOnly =
            DateTime(dateTime.year, dateTime.month, dateTime.day);
        initialDate = dateOnly;
      }
      // DateTime dateTime = apiDateFormat.parse(apiDate);
      // DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);

      // initialDate = dateOnly;
      if (widget.Gender == "Male") {
        gender = "Male";
      } else if (widget.Gender == "Female") {
        gender = "Female";
      } else {
        gender = "Others";
      }
      print(gender);
      print(widget.Gender);
      print("prints gender");
    });
    // if (widget.data != null) {
    //   data = widget.data!;
    // } else {
    //   final user = LocalStorage.getUser();
    //   data = Patient(primaryUserId: user.userId, primaryAccountNo: 0);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = context.read<PatientBloc>().patient;
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(Consts.ADD_PATIENT_EDIT.toUpperCase()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: userIdController,
                  readOnly: true,
                  enabled: false,
                  decoration: const InputDecoration(
                      label: Text('Patient Id'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                TextFormField(
                  controller: patientRegistrationNumberController,
                  readOnly: true,
                  enabled: false,
                  decoration: const InputDecoration(
                    label: Text('Patient Registration Number'),
                    hintStyle: TextStyle(fontSize: 14),
                    counter: SizedBox(
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                TextFormField(
                  controller: userFirstNameController,
                  decoration: const InputDecoration(
                      label: Text('Patient First Name'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                // TextFormField(
                //   controller: userLastNameController,
                //   decoration: const InputDecoration(
                //       label: Text('Patient Last Name'),
                //       hintStyle: TextStyle(fontSize: 14),
                //       counter: SizedBox(
                //         height: 0,
                //       )),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // MTextField(
                //   controller: userMobileNumber,
                //   label: 'Patient Mobile Number',
                //   value: data.userName,
                //   onChanged: (d) {
                //     data = data.copyWith(userName: d);
                //   },
                // ),
                TextFormField(
                  controller: userMobileNumber,
                  decoration: const InputDecoration(
                      label: Text('Patient Mobile Number'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                MDateTimePicker(
                  label: 'DOB',
                  onChanged: (DateTime? selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        dobChanged = true;
                        DOB = MDateUtils.dateToFormattedDate(
                          selectedDate.toString(),
                          true,
                          generic: true,
                        );
                        age = DateTime.now().difference(selectedDate).inDays ~/
                            365;
                        ageFromDob.text = age.toString();
                        userAge.text = age.toString();
                      });
                    } else {
                      setState(() {
                        DOB = widget.DOB.toString();
                      });
                    }
                  },
                  start: DateTime(1900),
                  end: DateTime.now(),
                  hintDateFormat: 'mm/dd/yyyy',
                  initial: initialDate,
                  // initial: DateFormat("dd/MM/yyyy").parse('01/01/1900'),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: userAge,
                  decoration: const InputDecoration(
                      label: Text('Age'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                MRadioChip<String>(
                  value: gender,
                  onChanged: (d) {
                    setState(() {
                      gender = d;
                      print("gender changed");
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
                  height: size.height * 0.012,
                ),
                // TextFormField(
                //   controller: userPrimaryMobileNumber,
                //   readOnly: true,
                //   enabled: false,
                //   decoration: const InputDecoration(
                //       label: Text('Primary Mobile Number'),
                //       hintStyle: TextStyle(fontSize: 14),
                //       counter: SizedBox(
                //         height: 0,
                //       )),
                // ),
                // BlocProvider(
                //   create: (_) => ApiBuilderBloc(
                //       path: 'RelationShipList',
                //       query: {'User_id': LocalStorage.getUser().userId})
                //     ..add(const Load()),
                //   child: ApiBuilder(
                //     loading: const DropDownShimmer(
                //       label: 'Relationship',
                //     ),
                //     jsonBuilder: (rels, load) {
                //       return MDialogDown<Map<String, dynamic>>(
                //           value: relation,
                //           // hint: familyMemberId,
                //           items: rels,
                //           label: 'Select Relationship',
                //           onChanged: (d) {
                //             setState(() {
                //               relation = d;
                //               familyMemberId = d?['FamilyMember_id'].toString() ?? "";
                //               print(familyMemberId);
                //             });
                //             // data = data.copyWith(
                //             //     relationName: d?['RelationName'],
                //             //     familyMemberId: d?['FamilyMember_id']);
                //           },
                //           labelKey: 'RelationName');
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                TextFormField(
                  controller: emailIdController,
                  decoration: const InputDecoration(
                      label: Text('Email Id'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),

                SizedBox(
                  height: size.height * 0.012,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      label: Text('Password'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),

                SizedBox(
                  height: size.height * 0.012,
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                // BlocProvider(
                //   create: (_) => ApiBuilderBloc(
                //       path: 'RelationShipList',
                //       query: {'User_id': LocalStorage.getUser().userId})
                //     ..add(const Load()),
                //   child: ApiBuilder(
                //     loading: const DropDownShimmer(
                //       label: 'Relationship',
                //     ),
                //     jsonBuilder: (rels, load) {
                //       return MDialogDown<Map<String, dynamic>>(
                //           value: relation,
                //           items: rels,
                //           label: 'Relationship',
                //           onChanged: (d) {
                //             setState(() {
                //               relation = d;
                //             });
                //             data = data.copyWith(
                //                 relationName: d?['RelationName'],
                //                 familyMemberId: d?['FamilyMember_id']);
                //           },
                //           labelKey: 'RelationName');
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: OutlinedButton(
          child: const Text('Click to Edit'),
          onPressed: () async {
            if (userFirstNameController.text.isEmpty &&
                DOB.isEmpty &&
                userAge.text.isEmpty &&
                gender.isEmpty &&
                userMobileNumber.text.isEmpty &&
                emailIdController.text.isEmpty &&
                passwordController.text.isEmpty) {
              await Fluttertoast.showToast(
                msg: "Cannot Save When Field is Empty",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: MTheme.THEME_COLOR,
                textColor: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.018,
              );
            } else {
              final call = Injector().apiService.get(path: 'EditUser', query: {
                'Patient_Id': userIdController.text,
                'Patient_Registration_Number':
                    patientRegistrationNumberController.text,
                'First_Name': userFirstNameController.text,
                // 'Last_Name': userLastNameController.text,
                'DOB':
                    dobChanged == true ? DOB.toString() : widget.DOB.toString(),
                'Age': userAge.text,
                'Gender': gender,
                'Phone_Number': userMobileNumber.text,
                'EMail_Id': emailIdController.text,
                'Password': passwordController.text,
              });
              print("before submitting");
              final res = await showWaitingDialog(context: context, call: call);
              print(res?.body.message);
              if (res?.body.message == "Patient Details Updated SuccessFully") {
                await Fluttertoast.showToast(
                    msg: "Patient Details Updated SuccessFully",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0);
                context.read<PatientBloc>().add(
                      Select(
                        Patient(
                          userId: userIdController.text,
                          regNo: patientRegistrationNumberController.text,
                          patientName: userFirstNameController.text,
                          patientImage: widget.patientImage,
                          // 'Last_Name': userLastNameController.text,
                          dob: dobChanged == true
                              ? DOB.toString()
                              : widget.DOB.toString(),
                          age: userAge.text,
                          gender: gender,
                          phone: userMobileNumber.text,
                          email: emailIdController.text,
                          password: passwordController.text,
                        ),
                      ),
                    );
                familyBloc.add(const Refresh());
                widget.functionToRunBloc();
                context.pop();
              }
            }
          },
        ),
      ),
    );
  }
}
