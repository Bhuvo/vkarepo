import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../../widgets/m_date_time_picker.dart';
import '../../widgets/m_radio_chip.dart';

class AdminSignUpPage extends StatefulWidget {
  const AdminSignUpPage({super.key});

  @override
  State<AdminSignUpPage> createState() => _AdminSignUpPageState();
}

class _AdminSignUpPageState extends State<AdminSignUpPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

   TextEditingController emailController = TextEditingController();
   TextEditingController dobController = TextEditingController();
   TextEditingController ageController = TextEditingController();
   TextEditingController addressController = TextEditingController();

   TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

   String gender = "";
  int? age;

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
      body:SingleChildScrollView(
        child: Padding( padding: const EdgeInsets.symmetric(
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
              'Please sign up as Admin to continue.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 32,
            ),
        
            Form(
                key: formKey,
                child:Column(
              children: [
                MTextField(
                  label:'First Name',
                  controller: firstNameController,
                ),
                Space(10),
                MTextField(
                  label:'Last Name',
                  controller: lastNameController,
                ),
                Space(10),
                MTextField(
                  label:'Phone Number',
                  controller: phoneController,
                  type:MInputType.phone,
                ),
                Space(10),
                MTextField(
                  label: 'Email',
                  type: MInputType.email,
                  controller: emailController,
                ),
                Space(10),
                MRadioChip<String>(
                  value: gender,
                  onChanged: (d) {
                    setState(() {
                      gender = d;
                    });
                  },
                  items:  const [
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
                Space(10),
                MDateTimePicker(
                  label: 'DOB',
                  onChanged: (selectedDate) {
                    dobController.text = '${selectedDate!.day}/${selectedDate.month}/${selectedDate.year}';
                    setState(() {
                      age = DateTime.now() 
                          .difference(selectedDate!)
                          .inDays ~/
                          365;
                      ageController.text = age.toString();
                    });
                  },
                  start: DateTime(1900),
                  end: DateTime.now(),
                  hintDateFormat: 'dd/mm/yyyy',
                  // initial: DateFormat("dd/MM/yyyy").parse('01/01/1900'),
                ),
                Space(10),
                MTextField(
                  label: 'Address',
                  maxLines: 5,
                  controller: addressController,
                ),
                Space(10),
                MTextField(
                  type: MInputType.password,
                  suffixIcon: Icon(Icons.remove_red_eye),
                  label:'Password',
                  controller: passwordController,
                ),
                Space(10),
                MTextField(
                    type: MInputType.password,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    label:'Confirm Password',
                   controller: confirmPasswordController,
                ),
                Space(10),
                OutlinedButton(onPressed: () async {
                 if( formKey.currentState!.validate()){
                   if(passwordController.text == confirmPasswordController.text){
                     final call =  Injector().vkaService.post(path:'Save_Hospital_Admin', query: {
                       'First_Name': firstNameController.text,
                       'Last_Name': lastNameController.text,
                       'Phone_Number': phoneController.text,
                       'Email': emailController.text,
                       'Gender': gender,
                       'Dob': dobController.text,
                       'Address': addressController.text,
                       'Password': passwordController.text
                     });
                     final res = await showWaitingDialog(
                         context: context, call: call);
                     print(call.then((res) => print('responce ${res.bodyString}')));
                     print(res?.body);
                     Fluttertoast.showToast(
                         msg: "Signup Done Please Log In",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         backgroundColor: Colors.green,
                         textColor: Colors.white,
                         fontSize: 16.0);
                     context.replace(Routes.login);
                   }
                 }
                }, child: Text('Sign Up')),
                Space(10),
              ],
            ))
          ],
        ),
        ),
      ),
    );
  }
}
