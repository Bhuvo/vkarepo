import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/instant_call/day_end_dialog.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_call_list_dialog.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class CallActions extends StatelessWidget {
  final appointmentid, docID, patID;
  final GlobalKey<ExpandableFabState> fab;

  const CallActions(
      {Key? key,
      required this.fab,
      required this.appointmentid,
      this.docID,
      this.patID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
      child: ExpandableFab(
        key: fab,
        distance: 54,
        children: [
          ActionButton(
              onPressed: () {
                context.push(Routes.vitalSignReport, {
                  'patientID': patID,
                });
                /*context.push(Routes.documentPreview, {
                  'appointmentid': appointmentid,
                  'title': Consts.MEDICAL_RECORDS.toUpperCase()
                });*/
              },
              icon: const Icon(
                FontAwesomeIcons.chartLine,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Vital Signs Report'),
          ActionButton(
              onPressed: () {
                context.push(Routes.caseSheet, {
                  'doctorID': docID.toString(),
                  'userID': patID.toString(),
                  'appointmentID': appointmentid.toString()
                });
                /*context.push(Routes.documentPreview, {
                  'appointmentid': appointmentid,
                  'title': Consts.MEDICAL_RECORDS.toUpperCase()
                });*/
              },
              icon: const Icon(
                FontAwesomeIcons.notesMedical,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Case Sheet'),
          ActionButton(
              onPressed: () {
                context.push(Routes.documentPreview, {
                  'appointmentid': appointmentid,
                  'title': Consts.MEDICAL_RECORDS.toUpperCase()
                });
              },
              icon: const Icon(
                FontAwesomeIcons.solidFileCode,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Medical Records'),
          ActionButton(
            onPressed: () {
              print("$appointmentid appointment id");
              context.push(Routes.medicalRecordsList, {
                'appointmentid': appointmentid,
                'docID': docID.toString(),
                'patID': patID.toString(),
              });
              print(docID.toString());
              print(patID.toString());
              print(appointmentid.toString());
            },
            icon: const Icon(
              FontAwesomeIcons.clockRotateLeft,
              color: Colors.amber,
              size: 17,
            ),
            label: 'History',
          ),
          ActionButton(
              onPressed: () {
                context.push(Routes.clinicalNotesList, {
                  'doctorID': docID.toString(),
                  'userID': patID.toString(),
                  'appointmentID': appointmentid.toString()
                });
                print(docID.toString());
                print(patID.toString());
                print(appointmentid.toString());
                print("Notes - notes clicked");
              },
              icon: const Icon(
                FontAwesomeIcons.clipboardCheck,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Notes'),
          ActionButton(
              onPressed: () {
                context.push(Routes.prescriptionEditor, {
                  'patientid': patID,
                  'doctorid': docID,
                  'appointmentid': appointmentid
                });
              },
              icon: const Icon(
                FontAwesomeIcons.filePrescription,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Prescription'),
          ActionButton(
              onPressed: () {
                context.push(Routes.labTestRequest, {
                  'patientid': patID,
                  'doctorid': docID,
                  'appointmentid': appointmentid
                });
              },
              icon: const FaIcon(
                FontAwesomeIcons.flask,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Lab Test'),
          ActionButton(
              onPressed: () {
                context.pop();
              },
              icon: const FaIcon(
                FontAwesomeIcons.userGroup,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Move to Queue'),
        ],
      ),
    );
  }
}
