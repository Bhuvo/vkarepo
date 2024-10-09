import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../components/patient_bottom_navigation.dart';
import '../../routes/routes.dart';
import '../dashboard/dashboard_card.dart';
import '../home/home_bottom_navigation.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      bottom: const PatientBottomNavigation(),
      title: Text('Dashboard'),
      body:Column(
        children: [
          Row(
            children: [
              DashboardCard(
                title: '5',
                subTitle:'Upcoming video Appointments',
                color: Color(0xFF2fa6c4),
                asset: 'assets/images/scheduled.png',
                onTap: (){
                  context.push(Routes.calendarPage);
                },
              ),
              DashboardCard(
                title: '3',
                subTitle:'Previous video Appointments',
                color: Colors.green.shade400,
                asset: 'assets/images/ic_5.png',
                onTap: (){
                  context.push(Routes.patientWaitingList );
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '4',
                subTitle:'Upcoming clinical Appointments',
                color: Colors.grey.shade600,
                asset: 'assets/images/scheduled.png',
                onTap: (){
                  context.push(Routes.calendarPage);
                },
              ),
              DashboardCard(
                title: '8',
                subTitle:'Previous clinical Appointments',
                color: Color(0xFFf2bd2e),
                asset: 'assets/images/ic_5.png',
                onTap: (){
                  context.push(Routes.patientWaitingList );
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '9',
                subTitle:'Total Number of INR Appointments',
                color: Colors.red,
                asset: 'assets/images/Appointment.png',
                onTap: (){
                  context.push(Routes.calendarPage);
                },
              ),
              DashboardCard(
                title: '2',
                subTitle:'INR Waiting List',
                color: Colors.grey.shade600,
                asset: 'assets/images/scheduled.png',
                onTap: (){
                  context.push(Routes.patientWaitingList );
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '3',
                subTitle:'Prescription Order Count',
                color: Color(0xFFf2bd2e),
                asset: 'assets/images/ic_1.png',
                onTap: (){
                  context.push(Routes.calendarPage);
                },
              ),
              DashboardCard(
                title: '2',
                subTitle:'Lab test Order Count',
                color: Color(0xFFf8457a),
                asset: 'assets/images/ic_4.png',
                onTap: (){
                  context.push(Routes.patientWaitingList );
                },
              ),
            ],
          ),
        ],),
    );
  }
}
