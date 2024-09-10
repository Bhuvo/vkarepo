import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({Key? key}) : super(key: key);

  static const routes = [
    Routes.splash,
    Routes.login,
    Routes.dashboard,
    Routes.demo,
    Routes.patientRegistration,
    Routes.addFamily,
    Routes.patientRegistrationList,
    Routes.todayInrScheduleList,
    Routes.totalPendingList,
    Routes.totalInrLineList,
    Routes.patientInrDetails,
    Routes.doctorProfile,
    Routes.selectPatient,
    Routes.bookAppointment,
    Routes.bookAppointmentPage,
    Routes.bookAppointmentDialog,
    Routes.medicalRecordsList,
    Routes.medicalRecordDetails,
    Routes.homeWithBottomNavigation,
    Routes.calendarPage,
    Routes.patientWaitingList,
    Routes.callLogs,
    Routes.missedCalls,
    Routes.selectPatientDetails,
    Routes.inQueuePage,
    Routes.updateCallStatus,
    Routes.inAppCallPage,
    Routes.inAppCallPageDoctor,
    Routes.inAppChatPage,
    Routes.labTestRequest,
    Routes.prescriptionEditor,
    Routes.templateList,
    Routes.clinicalNotesList,
    Routes.clinicalNotesEditor,
    Routes.clinicalNotesView,
    Routes.documentPreview,
  ];

  static const highlights = [
    Routes.bookAppointment,
    Routes.patientWaitingList,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 56),
        itemBuilder: (c, i){
        final item = routes[i];
        return InkWell(
          onTap: (){
            context.push(item);
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              child: Text(item.replaceAll('/', ''), style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 12, color: highlights.contains(item) ? Colors.green : null ),)),
        );
      }, itemCount: routes.length,)

    );
  }
}
