import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../routes/routes.dart';

class VideoDashboard extends StatefulWidget {
  const VideoDashboard({super.key});

  @override
  State<VideoDashboard> createState() => _VideoDashboardState();
}

class _VideoDashboardState extends State<VideoDashboard> {
  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
        title: 'Video Dashboard',
        body:ListView(
          children: [
            Row(
              children: [
                DashboardCard(
                  title: '5',
                  subTitle:'Calender',
                  color: Color(0xFF2fa6c4),
                  asset: 'assets/images/scheduled.png',
                onTap: (){
                    context.push(Routes.calendarPage);
                },
                ),
                DashboardCard(
                  title: '3',
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
              title: '6',
              subTitle:'Approval List',
              color: Colors.green.shade400,
              asset: 'assets/images/waiting.png',
              flex: 1,
              onTap: (){
                context.push(Routes.patientApprovelList);
              },
            ),
            Row(
              children: [
                DashboardCard(
                  title: '5',
                  subTitle:'Missed Calls',
                  color: Color(0xFFf2bd2e),
                  asset: 'assets/images/appointment_missed.png',
                  onTap: (){
                      context.push(Routes.missedCalls);
                  },
                ),
                DashboardCard(
                  title: '3',
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
        )
    );
  }
}
