import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

import '../../components/waiting_dialog.dart';
import '../../theme/theme.dart';

class AddFamilyEditScreen extends StatefulWidget {
  final Patient? data;

  final ApiBuilderBloc? bloc;
  final String userName;
  final String mobileNumber;
  final String age;
  final String userId;
  final String familyMemberId;
  final String relationShipName;
  final String gender;
  final String primaryMobile;
  final String primaryUserId;
  final String DOB;

  const AddFamilyEditScreen({
    Key? key,
    this.data,
    this.bloc,
    required this.userName,
    required this.mobileNumber,
    required this.age,
    required this.userId,
    required this.familyMemberId,
    required this.relationShipName,
    required this.gender,
    required this.primaryMobile,
    required this.primaryUserId,
    required this.DOB,
  }) : super(key: key);

  @override
  State<AddFamilyEditScreen> createState() => _AddFamilyEditScreenState();
}

class _AddFamilyEditScreenState extends State<AddFamilyEditScreen> {
  final GlobalKey<FormState> form = GlobalKey();
  late Patient data;
  Map<String, dynamic>? relation;
  DateDuration? duration;
  String? maritalStatus;
  dynamic age;
  TextEditingController ageString = TextEditingController();
  bool showMobileField = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController relationShipNameController = TextEditingController();
  TextEditingController userMobileNumber = TextEditingController();
  TextEditingController userPrimaryMobileNumber = TextEditingController();
  TextEditingController userPrimaryUserId = TextEditingController();
  TextEditingController ageFromDob = TextEditingController();

  // TextEditingController ageString = TextEditingController();
  // TextEditingController ageString = TextEditingController();

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

  bool dobChanged = false;

  @override
  void initState() {
    print(widget.userName);
    print(widget.mobileNumber);
    print("printing name and mobile number");
    print("DOB ${widget.DOB}");
    print("relationshipname ${widget.relationShipName}");
    setState(() {
      userNameController.text = widget.userName;
      userAge.text = widget.age;
      userMobileNumber.text = widget.mobileNumber;
      relationShipNameController.text = widget.relationShipName;
      gender = widget.gender;
      userId = widget.userId;
      familyMemberId = widget.familyMemberId;
      relationShipName = widget.relationShipName;
      primaryMobile = widget.primaryMobile;
      primaryUserId = widget.primaryUserId;
      userPrimaryMobileNumber.text = widget.primaryMobile;
      userPrimaryUserId.text = widget.primaryUserId;

      List<String> parts = widget.DOB.split('/');
      mmddyyyy = '${parts[1]}/${parts[0]}/${parts[2]}';

      initialDate = DateTime.parse("${parts[2]}-${parts[1]}-${parts[0]}");
      print("initial date $initialDate");
      if (widget.gender == "Male") {
        gender = "Male";
      } else if (widget.gender == "Female") {
        gender = "Female";
      } else {
        gender = "Others";
      }
      print(gender);
      print(widget.gender);
      print("prints gender");
    });
    if (widget.data != null) {
      data = widget.data!;
    } else {
      final user = LocalStorage.getUser();
      data = Patient(primaryUserId: user.userId, primaryAccountNo: 0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                // MTextField(
                //   controller: userNameController,
                //   label: 'Patient Name',
                //   value: data.userName,
                //   onChanged: (d) {
                //     data = data.copyWith(userName: d);
                //   },
                // ),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                      label: Text('Patient Name'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                      label: Text('Patient Mobile Number'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                const SizedBox(
                  height: 16,
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
                  readOnly: true,
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
                MRadioChip<String>(
                  value: gender,
                  onChanged: (d) {
                    setState(() {
                      gender = d;
                      print(data);
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
                TextFormField(
                  controller: relationShipNameController,
                  readOnly: true,
                  enabled: false,
                  decoration: const InputDecoration(
                      label: Text('RelationShip Name'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),
                const SizedBox(
                  height: 16,
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
                TextFormField(
                  controller: userPrimaryUserId,
                  readOnly: true,
                  enabled: false,
                  decoration: const InputDecoration(
                      label: Text('Primary User Id'),
                      hintStyle: TextStyle(fontSize: 14),
                      counter: SizedBox(
                        height: 0,
                      )),
                ),

                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
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
          child: const Text('Click to Update'),
          onPressed: () async {
            print(data.age);
            final call =
                Injector().apiService.get(path: 'RelationShipUpdate', query: {
              'User_id': userId,
              'User_Name': userNameController.text,
              'Gender': gender,
              'MobileNumber': userMobileNumber.text,
              'FamilyMember_id': familyMemberId,
              // 'DOB': DOB.toString(),
              'DOB':
                  dobChanged == true ? DOB.toString() : widget.DOB.toString(),
              'Age': userAge.text,
              // 'PrimaryMobile': primaryMobile,
              // 'Primary_User_id': LocalStorage.getUser().id.toString(),
              'Primary_User_id': userPrimaryUserId.text,
            });
            print("printing the above details");
            print(userId);
            print(userNameController.text);
            print(gender);
            print(userMobileNumber.text);
            print(familyMemberId);
            print(DOB);
            print(userAge.text);
            print(userPrimaryUserId.text);
            print("before submitting");
            final res = await showWaitingDialog(context: context, call: call);
            print("inside res");
            print(call);
            print(res);
            print(res?.bodyString);
            print(res?.isSuccessful);
            print(res?.error);
            print(res?.base);
            print(res?.statusCode);
            print(res?.body.message);
            if (res?.body.message == "Updated SuccessFully" && mounted) {
              await Fluttertoast.showToast(
                  msg: "Updated SuccessFully",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
              if (mounted) {
                context.pop(Patient(
                  userId: userId,
                  patientName: userNameController.text,
                  firstName: userNameController.text,
                  userName: userNameController.text,
                  gender: gender,
                  mobile: userMobileNumber.text,
                  familyMemberId: familyMemberId,
                  dob: DOB.toString(),
                  age: userAge.text,
                  // 'PrimaryMobile': primaryMobile,
                  // 'Primary_User_id': LocalStorage.getUser().id.toString(),
                  primaryUserId: userPrimaryUserId.text,
                ));
              }
            }
          },
        ),
      ),
    );
  }
}
