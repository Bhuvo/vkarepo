import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../components/patient_bottom_navigation.dart';
import '../../routes/routes.dart';
import '../dashboard/dashboard_card.dart';
import 'package:http/http.dart'as http;
import '../home/home_bottom_navigation.dart';
import 'controller/patient_dashboard_controller.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {

  PatientDashBoardController controller = PatientDashBoardController();

  // var clinicalAppointmentData;
  // var videoAppointmentData;
  // var labOrderData;
  // var prescriptinOrderData;
  // var inrData;
  var data;

  @override
  void initState() {
    load();
    super.initState();
  }

  bool loading = true;

  load() async {
    if(mounted) {
      setState(() {
        loading = true;
      });
    }
    data = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'A');
    // clinicalAppointmentData = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'A');
    // videoAppointmentData = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'E');
    // labOrderData = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'PH');
    // prescriptinOrderData = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'LB');
    // inrData = await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId ,'INR');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      bottom: const PatientBottomNavigation(),
      title: const Text('Dashboard'),
      body: loading ? const LoadingWidget() : RefreshIndicator(
        onRefresh: () async {
          return await load();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    DashboardCard(
                      title: '${data['UpcomingVideoAppointment'] ?? '0'}',
                      subTitle:'Upcoming video Appointments',
                      color: Color(0xFF2fa6c4),
                      asset: 'assets/images/scheduled.png',
                      onTap: (){
                        context.managedPush(Routes.bookAppointment );
                      },
                    ),
                    DashboardCard(
                      title: '${data['UpcomingClinicalAppointment'] ?? '0'}',
                      subTitle:'Upcoming clinical Appointments',
                      color: Colors.grey.shade600,
                      asset: 'assets/images/scheduled.png',
                      onTap: (){
                        context.managedPush(Routes.bookAppointment );
                      },
                    ),

                  ],
                ),
                Row(
                  children: [
                    DashboardCard(
                      title: '${data['PreviousVideoAppointments'] ?? '0'}',
                      subTitle:'Previous video Appointments',
                      color: Colors.green.shade400,
                      asset: 'assets/images/ic_5.png',
                      onTap: (){
                        context.push(Routes.bookAppointment );
                      },
                    ),
                    DashboardCard(
                      title: '${data['PreviousClinicalAppointment']}',
                      subTitle:'Previous clinical Appointments',
                      color: const Color(0xFFf2bd2e),
                      asset: 'assets/images/ic_5.png',
                      onTap: (){
                        context.managedPush(Routes.bookAppointment );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    DashboardCard(
                      title: '${data['INR_Count'] ?? '0'}',
                      subTitle:'Total Number of INR Appointments',
                      color: Colors.red,
                      asset: 'assets/images/Appointment.png',
                      onTap: (){
                        context.managedPush(Routes.patientScreenINRDetails, {
                          'PatID': '${LocalStorage.getCursorPatient().userId}',
                          'DcoID': '178936'
                        });
                      },
                    ),
                    DashboardCard(
                      title: '${data['INR_Pending_Count'] ?? '0'}',
                      subTitle:'INR Waiting List',
                      color: Colors.grey.shade600,
                      asset: 'assets/images/scheduled.png',
                      onTap: (){
                        context.managedPush(Routes.patientScreenINRDetails, {
                          'PatID': '${LocalStorage.getCursorPatient().userId}',
                          'DcoID': '178936'
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    DashboardCard(
                      title: '${data['Prescription_count'] ?? '0'}',
                      subTitle:'Prescription Order Count',
                      color: const Color(0xff07a8b7),
                      asset: 'assets/images/ic_1.png',
                      onTap: (){
                        context.push(Routes.ordersList, {} );
                      },
                    ),
                    // DashboardCard(
                    //   title: '${labOrderData['New_Appointment'] ?? '0'}',
                    //   subTitle:'Lab test Order Count',
                    //   color: const Color(0xFFf8457a),
                    //   asset: 'assets/images/ic_4.png',
                    //   onTap: (){
                    //     context.push(Routes.labTestRequest, {} );
                    //   },
                    // ),
                  ],
                ),
                const Space(100)
              ],),
          ),
        ),
      ),
    );
  }
}
