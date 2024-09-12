import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/dashboard_data.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../schedule/schedule_details_page.dart';
import '../schedule/schedule_list_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final bloc = ApiBuilderBloc(path: 'DashboardCount', query: {'Doctor_id': LocalStorage.getUser().id});
  @override
  Widget build(BuildContext context) {


    return HomeBottomNavigation(
        title: Consts.DASHBOARD,
        // appBarBottom: const DoctorHeader(),
        // paddingTop: 140,
        body: BlocProvider<ApiBuilderBloc>(
          create: (context) => bloc..add(const Load()),
          child: ApiBuilder<DashboardData>(
            fromJson: DashboardData.fromJsonFactory,
            builder: (data, _) {
              return RefreshIndicator(
                onRefresh: () async {
                  bloc.add(const Refresh());
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DashboardCard(
                              title: '${data.patient}',
                              subTitle: 'Total Patient\nRegistration',
                              color: const Color(0xff29abe2),
                              asset: 'assets/images/ic_1.png',
                              onTap: () {
                               // context.push(Routes.patientRegistrationList);
                              },
                            ),
                            DashboardCard(
                              title: '${data.inr}',
                              subTitle: 'Total Patient\nToday INR Testing',
                              color: const Color(0xff0b9b92),
                              asset: 'assets/images/ic_2.png',
                              onTap: () {
                              //  context.push(Routes.todayInrScheduleList);
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DashboardCard(
                              title: '${data.completed}',
                              subTitle:
                                  'Total Patient\nToday INR Testing Completed',
                              color: const Color(0xff21d279),
                              asset: 'assets/images/ic_3.png',
                              onTap: () {
                                //context.push(Routes.totalCompletedList);
                             //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleListPage(title: "Total Completed Cases",)));
                              },

                            ),
                            DashboardCard(
                              title: '${data.pending}',
                              subTitle:
                                  'Total Patient\nToday INR Testing Pending',
                              color: const Color(0xfffabd2f),
                              asset: 'assets/images/ic_4.png',
                              // onTap: () {
                              //   context.push(Routes.totalPendingList);
                              // },
                            ),
                          ],
                        ),
                        DashboardCard(
                          title: '${data.totalPending}',
                          subTitle: 'Total Pending Cases',
                          color: const Color(0xffff4d4d),
                          asset: 'assets/images/ic_5.png',
                          flex: 0,
                        ),
                        SizedBox(
                          height: context.width,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
