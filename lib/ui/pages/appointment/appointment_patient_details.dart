import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/booking_appointment_patient.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/action_tile.dart';
import 'package:timesmedlite/ui/components/patient_tile.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/scheduled_appointment_list_item.dart';
import 'package:timesmedlite/ui/pages/call/call_actions.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class AppointmentPatientDetails extends StatelessWidget {
  final BookingAppointmentPatient data;
  final int? patID;
  final String? apId;

  const AppointmentPatientDetails(
      {Key? key, required this.data, this.patID, this.apId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = User(
      userId: data.User_id,
      fullName: data.User_Name,
      email: data.Emailid ?? '',
      phone: '',
    );
    var name = data.User_Name;
    var phone = '';
    var userId = data.User_id;

    // print(user);
    // print(data);
    // print("printing user ${data.toJson()}");

    return MScaffold(
      title: const Text(Consts.PATIENT_DETAILS),
      body: UserProvider(
        data: user,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                PatientTile(),
                ActionTile(
                  title: 'Complaints',
                  route: Routes.addPatientComplaints,
                  icon: FontAwesomeIcons.heartCircleExclamation,
                  data: data,
                ),
                ActionTile(
                  title: 'Detail Clinical Notes',
                  route: Routes.detailedClinicalNotes,
                  icon: FontAwesomeIcons.flaskVial,
                  data: data,
                ),
                ActionTile(
                    title: 'Upload Medical Documents',
                    route: Routes.uploadMedicalDocument,
                    data: data,
                    icon: FontAwesomeIcons.fileShield),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CallActions(
        appointmentid: data.Appointment_id,
        docID: LocalStorage.getUID(),
        patID: data.User_id ?? 0,
        fab: GlobalKey<ExpandableFabState>(),
      ),
    );
  }
}
