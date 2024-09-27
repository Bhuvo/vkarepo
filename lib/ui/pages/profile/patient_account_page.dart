import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/patient_bottom_navigation.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_header.dart';
import 'package:timesmedlite/ui/pages/profile/upload_display_picture_screen.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import '../../../di/dependency_injection.dart';
import '../../../model/booking_appointment_patient.dart';
import '../../../model/patient.dart';
import '../../../model/vka_patient_info.dart';
import '../../../utils/local_storage.dart';
import '../../bloc/patient/patient_bloc.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/user_tile.dart';
import '../../components/waiting_dialog.dart';
import '../../providers/patient_provider.dart';
import '../../routes/routes.dart';
import '../auth/logout.dart';
import 'edit_profile_page.dart';

class PatientAccountPage extends StatefulWidget {
  // final BookingAppointmentPatient? data;
  const PatientAccountPage({
    Key? key,
    // this.data,
  }) : super(key: key);

  @override
  State<PatientAccountPage> createState() => _PatientAccountPageState();
}

class _PatientAccountPageState extends State<PatientAccountPage> {
  late ApiBuilderBloc bloc;

  @override
  void initState() {
    super.initState();
    print('id pass ${LocalStorage.getUID()}');
    /// Patient profile api bloc
    bloc = ApiBuilderBloc(
        path: 'VKAPatientProfile',
        query: {
          'PatientId': LocalStorage.getUID(),
        },
        api2: true);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Consts.DUMMY_USER;
    Size size = MediaQuery.of(context).size;
    final p = context.read<PatientBloc>().patient ?? const Patient();
    print(p);
    print(p.patientImage);
    print(p.patientName);
    print("context.read<PatientBloc>().patient");
    return MScaffold(
      title: Text(
        Consts.ACCOUNT,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      // appBarBottom: Padding(
      //   padding: const EdgeInsets.all(8),
      //   child: PatientProvider(
      //       data: p,
      //       child: UserTile(
      //         avatarRadius: 22,
      //         trailing: MIconButton(
      //           child: Icon(
      //             FontAwesomeIcons.rightFromBracket,
      //             size: size.height * 0.025,
      //           ),
      //           onTap: () {
      //             logOut(context);
      //           },
      //         ),
      //       )),
      // ),
      // appBarBottom: const DashboardHeader(),
      paddingTop: MediaQuery.of(context).size.height * 0.1,
      bottom: const PatientBottomNavigation(),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (c) => bloc..add(const Load()),
          child: ApiBuilder(
              shrinkWrap: true,
              jsonBuilder: (data, load) {
                /// setting the values from the api bloc
                final userName =
                    '${data[0]["First_Name"]} ${data[0]["Last_Name"]}';
                final whatsappNumber = '${data[0]["Watsapp_Number"]}' != ""
                    ? '${data[0]["Watsapp_Number"]}'
                    : '${data[0]["Phone_Number"]}';
                final phoneNumber = '${data[0]["Phone_Number"]}';
                final emailId = '${data[0]["EMail_Id"]}';
                final userId = '${data[0]["Patient_Id"]}';
                final timeInTherapeuticRatio =
                    '${data[0]["Time_in_Therapeutic_Ratio"]}' == "null"
                        ? '0'
                        : '${data[0]["Time_in_Therapeutic_Ratio"]}';
                final age = '${data[0]["Age"]}';
                final gender = '${data[0]["Gender"]}';
                final password = '${data[0]["Password"]}';
                final userImage = '${data[0]["Image"]}';
                final DOB = '${data[0]["DOB"]}';
                print("userimage$userImage");
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    MListTile(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(),
                              UserDisplayPictureAvatar(
                                radius: size.height * 0.054,
                                userImage: userImage,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                userName,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: MTheme.THEME_COLOR,
                                  fontWeight: FontWeight.w500,
                                ),
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .bodyLarge
                                //     ?.copyWith(color: MTheme.THEME_COLOR),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.34),
                                    child: Text(
                                      'Age: $age, $gender',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.color,
                                        fontSize: size.height * 0.0146,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: size.width * 0.2),
                                    child: MIconButton(
                                      forceBorder: true,
                                      child: Icon(
                                        FontAwesomeIcons.rightFromBracket,
                                        color: MTheme.THEME_COLOR,
                                        size: size.height * 0.025,
                                      ),
                                      onTap: () {
                                        logOut(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.0172,
                              ),
                            ],
                          ),
                          Positioned(
                            top: 10,
                            right: 16,
                            child: UserInfo(
                              Info.custom,
                              icon: FontAwesomeIcons.userCheck,
                              lable: userId,
                              iconSize: size.height * 0.02,
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.016,
                            right: MediaQuery.of(context).size.width * 0.32,
                            child: InkWell(
                              onTap: () async {
                                final res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageUploadScreen(
                                      userId: userId,
                                      p: p,
                                      functionToRefreshBloc: () {
                                        bloc.add(const Refresh());
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MTheme.THEME_COLOR,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    FontAwesomeIcons.pencil,
                                    color: MTheme.BUTTON_COLOR,
                                    size: MediaQuery.of(context).size.height *
                                        0.018,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    MListTile(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                            child: UserInfo(
                          Info.custom,
                          icon: Icons.phone,
                          lable: phoneNumber,
                          iconSize: size.height * 0.02,
                        )),
                        Container(
                          height: size.height * 0.075,
                          width: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                            child: UserInfo(
                          Info.custom,
                          icon: FontAwesomeIcons.whatsapp,
                          lable: whatsappNumber,
                          iconSize: size.height * 0.02,
                        )),
                      ],
                    )),
                    MListTile(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                            child: UserInfo(
                          Info.custom,
                          icon: Icons.mail,
                          lable: emailId,
                          iconSize: size.height * 0.02,
                        )),
                        Container(
                          height: size.height * 0.075,
                          width: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                          child: UserInfo(
                            Info.custom,
                            icon: FontAwesomeIcons.key,
                            lable: password,
                            iconSize: size.height * 0.02,
                          ),
                        ),
                      ],
                    )),

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.045,
                        vertical: size.height * 0.01,
                      ),
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: OutlinedButton(
                        onPressed: () {
                          print(p.dob);
                          print(p.patientImage);
                          print("patient image .png");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAccountProfileScreen(
                                patientId: p.userId.toString(),
                                Patient_Registration_Number: phoneNumber,
                                First_Name: userName,
                                Last_Name: p.lastName ?? "",
                                DOB: DOB.toString(),
                                Age: age,
                                Gender: gender,
                                Phone_Number: phoneNumber,
                                EMail_Id: emailId,
                                Password: password,
                                patientImage: userImage.toString(),
                                functionToRunBloc: () {
                                  bloc.add(const Refresh());
                                },
                              ),
                            ),
                          );
                          // context.push(Routes.editAccountProfilePage, {
                          //   'patientId': p.userId,
                          //   'Patient_Registration_Number': phoneNumber,
                          //   'First_Name': userName,
                          //   'Last_Name': p.lastName,
                          //   'DOB': p.dob,
                          //   'Age': age,
                          //   'Gender': gender,
                          //   'Phone_Number': phoneNumber,
                          //   'EMail_Id': emailId,
                          //   'Password': password,
                          // });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: MTheme.THEME_COLOR,
                        ),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.045,
                        vertical: size.height * 0.01,
                      ),
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: OutlinedButton(
                        onPressed: () {
                          showDialogWithFields(context, userId);
                        },
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //     width: double.infinity,
                    //     height: MediaQuery.of(context).size.height * 0.13,
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: 16, vertical: 8),
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 12, vertical: 8),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(MTheme.RADIUS),
                    //         color: Colors.red),
                    //     child: BlocProvider(
                    //         create: (context) => ApiBuilderBloc(
                    //               path: 'TTRPercentage',
                    //               query: {
                    //                 'Patient_Id': LocalStorage.getUID(),
                    //               },
                    //               raw: true,
                    //             )..add(const Load()),
                    //         child: ApiBuilder(
                    //             shrinkWrap: true,
                    //             jsonBuilder: (TTR, load) {
                    //               final timeInTherapeuticRatio =
                    //                   '${TTR[0]['Percentage']}' == "null"
                    //                       ? '0'
                    //                       : '${TTR[0]['Percentage']}';
                    //               return Row(
                    //                 children: [
                    //                   Expanded(
                    //                     child: Text(
                    //                       'Time In\nTherapeutic Ratio (TTR) is',
                    //                       style: Theme.of(context)
                    //                           .textTheme
                    //                           .bodyLarge
                    //                           ?.copyWith(
                    //                               color: Colors.white,
                    //                               fontSize: 18),
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     "$timeInTherapeuticRatio %",
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .displayMedium
                    //                         ?.copyWith(
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.w600),
                    //                   ),
                    //                 ],
                    //               );
                    //             }))),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void showDialogWithFields(BuildContext context, var id) {
    final _formKey = GlobalKey<FormState>();
    String? validateEmail(String? value) {
      if (value!.isEmpty)
        return 'Password cannot be empty';
      else
        return null;
    }

    showAlertDialog(BuildContext c, errText) {
      // set up the button
      Widget okButton = Container(
        margin: const EdgeInsets.only(
            top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(width: 0.0, color: Colors.amber),
            borderRadius: BorderRadius.circular(12.0)),
        child: TextButton(
          child: const Text("OK"),
          onPressed: () {
            c.pop();
          },
        ),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(errText, textAlign: TextAlign.center),
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showDialog(
      context: context,
      builder: (_) {
        var passwordController = TextEditingController();
        return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 60,
                      width: 320,
                      padding: const EdgeInsets.only(left: 20.0),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromARGB(255, 11, 146, 156),
                              Color.fromARGB(255, 32, 208, 122)
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                  onPressed: () => Navigator.pop(_),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  // height: MediaQuery.of(context).size.height * 0.08,
                                  child: Text(
                                "Change Password".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Metropolis'),
                              )))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "New Password",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Metropolis'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 6.0, left: 16.0, right: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1.0,
                              color: const Color.fromARGB(255, 172, 172, 172)),
                          borderRadius: BorderRadius.circular(12.0)),
                      width: double.infinity,
                      height: 55,
                      child: TextFormField(
                        validator: validateEmail,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  width: 0.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  width: 0.0),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.black45)),
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'Metropolis-Regular'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(width: 0.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(12.0)),
                      width: double.infinity,
                      height: 55,
                      child: Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // showAlertDialog(
                              //     context, "Password cannot be empty");
                              print(
                                  "Checking if ID is recieved properly:  'patient_id': $id");
                              final call = Injector()
                                  .apiService
                                  .get2(path: 'VKAPatient_PassUpdate', query: {
                                //'Doctor_id':  id,
                                'Patient_Id': id.toString(),
                                'Password': passwordController.text.toString(),
                              });
                              final res = await showWaitingDialog(
                                  context: context, call: call);
                              if (res?.body.message == "Password Updated") {
                                print("RESP::::   res?.body.message ");
                                context.pop(); //context.pop();
                                await Fluttertoast.showToast(
                                    msg: "Password Changed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: MTheme.THEME_COLOR,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  bloc.add(
                                    const Refresh(),
                                  );
                                });
                              }
                            }
                          },
                          child: const Text("Save",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class UserDisplayPictureAvatar extends StatelessWidget {
  final double radius;
  final IconData? empty;
  final String? userImage;

  const UserDisplayPictureAvatar({
    Key? key,
    this.radius = 26,
    this.empty,
    this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context);
    print("TTTT${user}");
    print(
        "print details of user ${user?.gender} ${user?.userId} ${user?.patientImage} ${user?.phoneNumber} ${user?.phone}");
    print(userImage);
    print(user?.patientImage);
    return Container(
      width: radius * 2,
      height: radius * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Theme.of(context).dividerColor,
          border: Border.all(color: Colors.white)
          //boxShadow: MTheme.SHADOW_LIGHT
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              empty ?? CupertinoIcons.person_alt,
              size: radius * 1.5,
              color: Colors.white70,
            ),
            if (userImage != "user.png")
              Image.network(
                '${Consts.Patient_Display_Picture_Upload}$userImage',
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              ),
          ],
        ),
      ),
    );
  }
}
