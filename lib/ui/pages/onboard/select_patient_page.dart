import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/login_header.dart';
import 'package:timesmedlite/ui/components/shimmer/drop_down_shimmer.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class SelectPatientPage extends StatelessWidget {
  const SelectPatientPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ApiBuilderBloc bloc = ApiBuilderBloc(path: 'SavedPatientList', query: {'User_id': LocalStorage.getUser().userId});
    return MScaffold(
      hero: false,
      paddingTop: context.getWPercent(60),
      customHeader: const LoginHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 64,),
            Text('SELECT PATIENT', style: Theme.of(context).textTheme.bodyLarge,),
            Text('Please select your patient.', style: Theme.of(context).textTheme.caption,),
            const SizedBox(height: 16,),
            BlocProvider(create: (_) => bloc..add(const Load()),
              child: ApiBuilder<Patient>(
                fromJson: Patient.fromJsonFactory,
                loading: const DropDownShimmer(label: 'Select Patient',),
                customBuilder: (data, load){
                  //return DropDownShimmer(label: 'Select Patient',);
                  return MDialogDown<Map<String, dynamic>>(
                      items: data.map((e) => e.toJson()).toList(), label: 'Select Patient', onChanged: (d){
                    LocalStorage.setJson(LocalStorage.CURSOR_USER, d!);
                    print(LocalStorage.getUser().userId.toString());
                    print(LocalStorage.getUser().patientImage);
                    print(LocalStorage.getUser().name);
                    context.read<PatientBloc>().add(Select(Patient.fromJson(d)));
                    navigate(context);
                  }, labelKey: 'PatientName');
                },
              ),
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: OutlinedButton(
          child: const Text('Add Patient'),
          onPressed: () async {
            final res = await context.push(Routes.addFamily);
            if(res != null){
              bloc.add(const Refresh());
            }
          },
        ),
      ),
    );
  }

  void navigate(BuildContext context){
    context.replace(Routes.bookAppointment);
  }
}
