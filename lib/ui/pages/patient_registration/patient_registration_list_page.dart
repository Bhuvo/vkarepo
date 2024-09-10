import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/pages/patient_registration/patient_register_list_item.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../components/nothing_widget.dart';

class PatientRegistrationListPage extends StatelessWidget {
  PatientRegistrationListPage({Key? key}) : super(key: key);

  final bloc = ApiBuilderBloc(
      path: 'RegisteredPatientList', query: {'Doctor_id': LocalStorage.getUser().id});

  @override
  Widget build(BuildContext context) {
    return HomePageBase(
      title: Consts.PATIENT_REGISTRATION,
      body: BlocProvider(
        create: (BuildContext context) {
          return
            bloc..add(const Load());
        },
        child: ApiBuilder<Patient>(
          fromJson: Patient.fromJsonFactory,
          //type: ApiBuilderType.searchList,
          empty: NothingWidget(
            title: "No Registered patient",
            icon: Icons.playlist_add_rounded,
            //message: "No call log for the selected date.",
            onRefresh: () {
              bloc.add(const Refresh());
            },

          ),
          builder: (data, i) {
            return PatientProvider(child: const PatientRegisterListItem(), data: data);
          },
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 16),
        child: OutlinedButton(
          child: const Text('Add Patient Registration'),
          onPressed: () async {
            final res = await context.push(Routes.patientRegistration);
            if(res != null) {
              bloc.add(const Refresh());
            }
          },
        ),
      ),
    );
  }
}
