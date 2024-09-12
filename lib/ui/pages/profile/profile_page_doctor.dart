import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../const/consts.dart';
import '../../../di/dependency_injection.dart';
import '../../components/waiting_dialog.dart';
import '../home/home_bottom_navigation.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final String title;

  ProfilePage({Key? key, required this.user, required this.title})
      : super(key: key);
  final bloc = ApiBuilderBloc(path: 'DoctorDetails', query: {
    'Doctor_id': LocalStorage.getUID().toString(),
  });

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation( //HomePageBase
      title: title.toUpperCase(),
      body: BlocProvider(
        create: (context) => bloc..add(const Load()),
        child: ApiBuilder<User>(
            fromJson: User.fromJsonFactory,
            customBuilder: (data, load) {
              print("UUUUUUUUUUUUUUUUUUUUSEEEEEEEEEER${data.first}");
              final user = data.first;
              return SingleChildScrollView(
                child: UserProvider(
                  data: user,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      MListTile(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Row(),
                          const UserAvatar2(
                            radius: 40,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${user.name}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: MTheme.THEME_COLOR),
                          ),
                          Text(
                            '${user.qualification}',
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.caption?.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )),
                      MListTile(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(child: UserInfo(Info.phone)),
                          Container(
                            height: 56,
                            width: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(child: UserInfo(Info.whatsapp)),
                        ],
                      )),
                      MListTile(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(child: UserInfo(Info.email)),
                          Container(
                            height: 56,
                            width: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(child: UserInfo(Info.key)),
                        ],
                      )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        width: double.maxFinite,
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () {
                              print(user.id);
                              print(LocalStorage.getUID().toString());
                              showDialogWithFields(context, user.id);
                            },
                            child: const Text('Change Password')),
                      ),
                      MListTile(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: UserInfo(
                            Info.custom,
                            icon: FontAwesomeIcons.hospitalWide,
                            lable: '${user.hospitalName}',
                            textColor: MTheme.THEME_COLOR,
                          )),
                          Container(
                            height: 56,
                            width: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(child: UserInfo(Info.phone)),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            }),
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
        decoration: new BoxDecoration(
            color: Colors.amber,
            border: Border.all(width: 0.0, color: Colors.amber),
            borderRadius: BorderRadius.circular(12.0)),
        child: TextButton(
          child: Text("OK"),
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
                      decoration: BoxDecoration(
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
                                  icon: Icon(Icons.close, color: Colors.white),
                                  onPressed: () => Navigator.pop(_),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(
                                "Change Password".toUpperCase(),
                                style: TextStyle(
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
                      child: Text(
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
                              color: Color.fromARGB(255, 172, 172, 172)),
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
                                    "Checking if ID is recieved properly:  'Doctor_id': $id");
                                final call = Injector()
                                    .apiService
                                    .get(path: 'ChangePassword', query: {
                                  //'Doctor_id':  id,
                                  'Doctor_id': LocalStorage.getUID().toString(),
                                  'Password':
                                      passwordController.text.toString(),
                                });
                                final res = await showWaitingDialog(
                                    context: context, call: call);
                                if (res?.body.message == "Password Changed") {
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
                                }
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis'),
                            )),
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

class UserAvatar2 extends StatelessWidget {
  final double radius;
  final IconData? empty;
  const UserAvatar2({Key? key, this.radius = 26, this.empty}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = LocalStorage.getUser();
    print("TTTT${user}");
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
            Icon(empty ?? CupertinoIcons.person_alt, size: radius * 1.5, color: Colors.white70,),
            if(user != null && user.image != null ) CachedNetworkImage(imageUrl: '${Consts.IMAGE_DOCTOR_BASE_URL}${user.image ?? ''}')
          ],
        ),
      ),
    );
  }
}
