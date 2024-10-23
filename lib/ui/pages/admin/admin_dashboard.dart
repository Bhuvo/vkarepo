import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../routes/routes.dart';
import '../dashboard/dashboard_header.dart';
import '../home/home_bottom_navigation.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
     title: 'Admin Dashboard',
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              DashboardCard(
                title: '5',
                subTitle: 'Active Doctors',
                color:  Color(0xFF2fa6c4),
                asset: 'assets/images/scheduled.png',
                onTap: () async {
                  await context.push(Routes.doctorsList,
                  {
                    'adminId': '1',
                    'doctor':true,
                    'title': 'Doctor',
                  }
                  );
                },
              ),
              DashboardCard(
                title: '6',
                subTitle: 'Inactive Doctors',
                color: Color(0xFFf8457a),
                asset: 'assets/images/scheduled.png',
                onTap: () {
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '2',
                subTitle: 'Active Nurses',
                color: Colors.purple.shade400,
                asset: 'assets/images/scheduled.png',
                onTap: () async {
                  await context.push(Routes.doctorsList,
                      {
                        'adminId': '1',
                        'nurse':true,
                        'title': 'Nurse',
                      }
                  );
                },
              ),
              DashboardCard(
                title: '5',
                subTitle: 'Inactive Nurses',
                color: Colors.green.shade400,
                asset: 'assets/images/scheduled.png',
                onTap: () {
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '8',
                subTitle: 'Active Front Office',
                color: Color(0xFFf2bd2e),
                asset: 'assets/images/scheduled.png',
                onTap: () async {
                  await context.push(Routes.doctorsList,
                      {
                        'adminId': '1',
                        'fo':true,
                        'title': 'Front office',
                      }
                  );
                },
              ),
              DashboardCard(
                title: '2',
                subTitle: 'Front Office',
                color: Colors.brown.shade400,
                asset: 'assets/images/scheduled.png',
                onTap: () {
                },
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                title: '3',
                subTitle: 'prescription Lettered',
                color: Colors.orange,
                asset: 'assets/images/scheduled.png',
                onTap: () {
                  context.push(Routes.prescriptionLetteredList);
                },
              ),
              DashboardCard(
                title: '',
                subTitle: 'Hospital Details',
                color: Colors.red.shade600,
                asset: 'assets/images/scheduled.png',
                onTap: () {
                  context.push(Routes.hospitalDetail);
                },
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
