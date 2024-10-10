import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_call_list_dialog.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../routes/routes.dart';

class VideoDashboard extends StatefulWidget {
  const VideoDashboard({super.key});

  @override
  State<VideoDashboard> createState() => _VideoDashboardState();
}

class _VideoDashboardState extends State<VideoDashboard> {
  ApiBuilderBloc bloc = ApiBuilderBloc(
      timesmedApi: true,
      path: 'DoctorCallsDashboardCount?Doctor_id=${LocalStorage.getUID()}');

  @override
  Widget build(BuildContext context) {

    return HomeBottomNavigation(
        title: 'Video Dashboard',
        body: BlocProvider(
          create: (_) => bloc..add(const Load()),
          child: ApiBuilder(
            type: ApiBuilderType.single,
            fromJson: (data) => data ,
              builder: (data, snapshot) {
              final map = data as Map<String, dynamic>;

                return ListView(
                  children: [
                    Row(
                      children: [
                        DashboardCard(
                          title: '${map['Total_No_Of_Appointments'] ?? 0}',
                          subTitle:'Calender',
                          color: const Color(0xFF2fa6c4),
                          asset: 'assets/images/scheduled.png',
                          onTap: (){
                            context.push(Routes.calendarPage);
                          },
                        ),
                        DashboardCard(
                          title: '${map['Total_No_Of_Patient_Waiting'] ?? 0}',
                          subTitle:'Patients Waiting',
                          color: Colors.green.shade400,
                          asset: 'assets/images/consultation_online.png',
                          onTap: (){
                            context.push(Routes.patientWaitingList );
                          },
                        ),
                      ],
                    ),
                    DashboardCard(
                      title: '${map['Total_No_Of_Instant_Call'] ?? 0}',
                      subTitle:'Instant Calls',
                      color: Colors.green.shade400,
                      asset: 'assets/images/waiting.png',
                      flex: 0,
                      onTap: (){
                        showDialog(context: context, builder: (c) => const InstantCallListDialog());
                      },
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          title: '${map['Total_No_Of_MissedCalls'] ?? 0}',
                          subTitle:'Missed Calls',
                          color: const Color(0xFFf2bd2e),
                          asset: 'assets/images/appointment_missed.png',
                          onTap: (){
                            context.push(Routes.missedCalls);
                          },
                        ),
                        DashboardCard(
                          title: '${map['Total_No_Of_Call_Log'] ?? 0}',
                          subTitle:'Call Log',
                          color: Colors.grey.shade600,
                          asset: 'assets/images/scheduled.png',
                          onTap: (){
                            context.push(Routes.callLogs);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }
          ),
        )
    );

  }
}
