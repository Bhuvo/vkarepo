import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../utils/local_storage.dart';
import '../../routes/routes.dart';
import '../dashboard/dashboard_header.dart';
import '../home/home_bottom_navigation.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  final bloc = ApiBuilderBloc(path: 'GetAdminDashboardCount' ,vka: true,query: {
    'AdminId' : LocalStorage.getUser().hospitalAdminId
  });

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
     title: 'Admin Dashboard',
      body: BlocProvider(
        create: (_) => bloc..add(const Load()),
        child: ApiBuilder(
          jsonBuilder: (list, load) {
            var data = list.first;
              return SingleChildScrollView(
                child: Column(children: [
                  Space(),
                  Row(
                    children: [
                      DashboardCard(
                        title: data['ActiveDoctors'] ?? '',
                        subTitle: 'Active Doctors',
                        color:  Color(0xFF2fa6c4),
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                          await context.push(Routes.doctorsList,
                              {
                                'status': 'A',
                                'adminId': '1',
                                'doctor':true,
                                'title': 'Doctor',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                      DashboardCard(
                        title: data['InActiveDoctors'] ?? '',
                        subTitle: 'Inactive Doctors',
                        color: Color(0xFFf8457a),
                        asset: 'assets/images/scheduled.png',
                        onTap: ()async {
                          await context.push(Routes.doctorsList,
                              {
                                'status': 'D',
                                'adminId': '1',
                                'doctor':true,
                                'title': 'Doctor',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        title: data['ActiveNurses'] ?? '',
                        subTitle: 'Active Nurses',
                        color: Colors.purple.shade400,
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                          await context.push(Routes.doctorsList,
                              {
                                'status': 'A',
                                'adminId': '1',
                                'nurse':true,
                                'title': 'Nurse',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                      DashboardCard(
                        title: data['InActiveNurses'] ?? '',
                        subTitle: 'Inactive Nurses',
                        color: Colors.green.shade400,
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                         await context.push(Routes.doctorsList,
                              {
                                'status': 'D',
                                'adminId': '1',
                                'nurse':true,
                                'title': 'Nurse',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        title: data['ActiveFo'] ?? '',
                        subTitle: 'Active Front Office',
                        color: Color(0xFFf2bd2e),
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                          await context.push(Routes.doctorsList,
                              {
                                'status': 'A',
                                'adminId': '1',
                                'fo':true,
                                'title': 'Front office',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                      DashboardCard(
                        title: data['InActiveFo'] ?? '',
                        subTitle: 'Inactive Front Office',
                        color: Colors.brown.shade400,
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                          await context.push(Routes.doctorsList,
                              {
                                'status': 'D',
                                'adminId': '1',
                                'fo':true,
                                'title': 'Front office',
                              }
                          );
                          bloc..add(Refresh());
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        title: data['ActivePresc'] ?? '',
                        subTitle: 'prescription Lettered',
                        color: Colors.orange,
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                         await context.push(Routes.prescriptionLetteredList);
                         bloc..add(Refresh());
                        },
                      ),
                      DashboardCard(
                        title: data['ActiveHosp'] ?? '',
                        subTitle: 'Hospital Details',
                        color: Colors.red.shade600,
                        asset: 'assets/images/scheduled.png',
                        onTap: () async {
                          await context.push(Routes.hospitalDetail);
                          bloc..add(Refresh());
                        },
                      ),
                    ],
                  ),
                ],),
              );

          }
        ),
      ),
    );
  }
}
