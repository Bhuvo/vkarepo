import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/waiting_patient.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/pages/waiting_list/waiting_list_actions.dart';
import 'package:timesmedlite/ui/pages/waiting_list/waiting_list_item.dart';
import 'package:timesmedlite/ui/pages/waiting_list_clinical/waiting_list_clinical_item.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

import '../../widgets/m_apibuilder_empty_widget.dart';

class WaitingListPage extends StatelessWidget {
  WaitingListPage({Key? key}) : super(key: key);
  final GlobalKey<ExpandableFabState> fab = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('doctor id : ${LocalStorage.getUID()}');
    final ApiBuilderBloc bloc = ApiBuilderBloc(
        path: 'Get_Waiting_Patient_List',
        raw: true,
        query: {'Doctor_id': LocalStorage.getUID()});
    return HomeBottomNavigation(
        appBarBottom: const DoctorHeader(),
        paddingTop: 140,
        body: Stack(
          children: [
            BlocProvider(
              create: (c) => bloc..add(const Load()),
              child: ApiBuilder<WaitingPatient>(
                empty: NothingWidget(
                  icon: Icons.people_alt_rounded,
                  title: "No patients",
                  message:
                  "No patient is in the waiting room for a consultation at the moment.",
                  onRefresh: () {
                    bloc.add(const Refresh());
                    print("refreshessss");
                  },
                ),
                fromJson: WaitingPatient.fromJsonFactory,
                customBuilder: (data, load) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const Text.rich(
                          TextSpan(children: [
                            TextSpan(text: '      Patients Available '),
                            TextSpan(
                                text: '● Online',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        ...data
                            .map((e) => WaitingListItem(
                          data: e,
                        ))
                            .toList(),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text.rich(
                          TextSpan(children: [
                            TextSpan(text: '      Patients in '),
                            TextSpan(
                                text: '● Offline',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        const Space(100)
                      ],
                    ),
                  );
                },
              ),
            ),

            // ListView.builder(itemBuilder: (c, i){
            //   return const WaitingListItem();
            // }),
            WaitingListActions(fab: fab)
          ],
        ),
        title: Consts.PATIENT_WAITING_LIST);
  }
}
