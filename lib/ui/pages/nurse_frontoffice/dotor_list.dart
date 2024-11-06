import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/pages/appointment/Clinical%20Visit/model/doctor_model.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../model/user.dart';
import '../../../model/vka_doctor_details.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/login_header.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/user_tile.dart';
import '../../providers/patient_provider.dart';
import '../../routes/routes.dart';
import '../../theme/theme.dart';
import '../../widgets/m_divider.dart';
import '../../widgets/m_scaffold.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  final ApiBuilderBloc bloc = ApiBuilderBloc(path: 'GetDoctorDetails_By_Admin',
      api2: true,
      query: {'Admin_Id':  LocalStorage.getUser().hospitalAdminId ,
      'Active_Flag': 'A'
      });

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      hero: false,
      paddingTop: context.getWPercent(50),
      customHeader: const LoginHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              const SizedBox(height: 64,),
              Text('SELECT DOCTOR', style: Theme.of(context).textTheme.bodyLarge,),
              Text('Please select your doctor.', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 16,),
              BlocProvider(create: (_) => bloc..add(const Load()),
                child: ApiBuilder(
                  loading: const DropDownShimmer(label: 'Select Doctor',),
                  jsonBuilder: (data, load){
                    //return DropDownShimmer(label: 'Select Patient',);
                    // return MDialogDown<Map<String, dynamic>>(
                    //     items: data.map((e) => e.toJson()).toList(), label: 'Select Patient', onChanged: (d){
                    //       print(d);
                    //   LocalStorage.setJson(LocalStorage.CURSOR_USER, d!);
                    //   print(LocalStorage.getUser().userId.toString());
                    //   print(LocalStorage.getUser().patientImage);
                    //   print(LocalStorage.getUser().name);
                    //   context.read<PatientBloc>().add(Select(Patient.fromJson(d)));
                    //   navigate(context);
                    // }, labelKey: 'PatientName');
                    return Card(
                      margin: const EdgeInsets.only(left: 30,right: 30),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: data.map((e) {
                            print('map is ${e['Doctor_id']}');
                            return Column(
                              children: [
                                UserProvider(
                                  data: User.fromJson(e),
                                  child: UserTile(
                                    trailing: IconButton(onPressed: (){
                                      // LocalStorage.clear();
                                      // log('The user details are ${LocalStorage.getUser()}');
                                      User val = LocalStorage.getUser();
                                      // print('Doctor Id ${e['Doctor_id']}');
                                      val = val.copyWith(
                                        id: e['Doctor_id'],
                                        fullName: e['Doctor_Name'],
                                        gender: e['Gender'],
                                        dob: e['Doctor_DOB'],
                                        email: e['Email_id'],
                                        specialization: e['DoctorCategory_Name'],
                                        phone: e['Doctor_PhoneNumber'],
                                      );
                                      LocalStorage.setJson(LocalStorage.USER, val.toJson());
                                      log('The user details are ${LocalStorage.getUser()}');
                                      print(LocalStorage.getUID());
                                      context.replace(Routes.currentAppointment);
                                      // LocalStorage.setJson(LocalStorage.USER, e);
                                    // LocalStorage.setJson(LocalStorage.CURSOR_USER, e.toJson());
                                    // print(LocalStorage.getUser().userId.toString());
                                    // print(LocalStorage.getUser().patientImage);
                                    // print(LocalStorage.getUser().name);
                                    // context.read<PatientBloc>().add(Select(Patient.fromJson(e.toJson())));
                                  }, icon: Icon(Icons.arrow_forward_ios,color: MTheme.ICON_COLOR,)),
                                    caption:Column(
                                      children: [
                                        Text('Qualification: ${e['Doctor_Qualification']}'),
                                        Space(10), 
                                        Text('Specialization: ${e['DoctorCategory_Name']}'),
                                        Space(10),
                                        Text('Age: ${e['Doctor_Age']} | Gender: ${e['Gender']}'),
                                      ],
                                    ),
                                  ),
                                ),
                                data.length > 1 ?MDivider() : Container()
                              ],
                            );
                          }).toList() ?? [],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32,),
            ],
          ),
        ),
      ),
    );
  }
}
