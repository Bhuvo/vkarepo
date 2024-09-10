import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_edit_page.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_editor.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/saved_presc.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class DrugListItem extends StatelessWidget {
  final SavedPrescription? data;
  final doctorid, patientid, appointmentid, Epharmachy_Masterid;
  final ApiBuilderBloc bloc;

  const DrugListItem(
      {Key? key,
      this.data,
      required this.doctorid,
      required this.patientid,
      required this.appointmentid,
      required this.Epharmachy_Masterid,
      required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data?.ListPresc?.length,
        itemBuilder: (context, index) {
          return data?.ListPresc![index].Prescription_id == ''
              ? Container()
              : MListTile(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data?.ListPresc![index].Drug_Name}",
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Frequency: ${data?.ListPresc![index].Frequency}, ${data?.ListPresc![index].Days} Days, Qty: ${data?.ListPresc![index].dosage}, Food Instruction: ${data?.ListPresc![index].Instruction} , Doctor Notes: ${data?.ListPresc![index].Doctor_Notes}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      MIconButton(
                        child: const Icon(
                          Icons.edit,
                          color: MTheme.THEME_COLOR,
                          size: 20,
                        ),
                        color: MTheme.THEME_COLOR,
                        padding: const EdgeInsets.all(4),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrescriptionEditPage(
                                        drugid: data?.ListPresc![index].Drug_id,
                                        drugname:
                                            data?.ListPresc![index].Drug_Name,
                                        frequency:
                                            data?.ListPresc![index].Frequency,
                                        days: data?.ListPresc![index].Days,
                                        qty: data?.ListPresc![index].dosage,
                                        foodrel:
                                            data?.ListPresc![index].Instruction,
                                        notes: data
                                            ?.ListPresc![index].Doctor_Notes,
                                        doctorid: doctorid,
                                        patientid: patientid,
                                        appointmentid: appointmentid,
                                        Epharmachy_Masterid:
                                            Epharmachy_Masterid,
                                        Prescription_id: data
                                            ?.ListPresc![index].Prescription_id,
                                        numberofdrugsinprescription:
                                            data?.ListPresc?.length,
                                      )));
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      MIconButton(
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        color: Colors.red,
                        padding: const EdgeInsets.all(4),
                        onTap: () {
                          showAlertDialog(
                              context, data?.ListPresc![index].Prescription_id);
                        },
                      ),
                    ],
                  ));
        });
  }

  showAlertDialog(BuildContext context, Pid) {
    // set up the button
    Widget okButton = Container(
      margin: const EdgeInsets.only(
          top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
      decoration: new BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 0.0, color: Colors.amber),
          borderRadius: BorderRadius.circular(12.0)),
      child: TextButton(
        child: Text("OK"),
        onPressed: () async {
          final call = Injector().apiService.get(
            path: 'Prescription_Delete',
            query: {'Prescription_id': Pid},
          );
          final res1 = await showWaitingDialog(context: context, call: call);
          if (res1?.body.message == 'Delted') {
            print(
                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res1}");

            context.pop();
            bloc.add(UpdateQuery(
              {'Appointment_id': appointmentid},
            ));
            //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>PrescriptionEditor(counter: 1,Epharmachy_Masterid: Epharmachy_Masterid,patientid:patientid ,appointmentid: appointmentid,)));
          } else {
            print("Unable to delete prescription");
          }
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      alignment: Alignment.center,
      content: Text(
          "Are you sure you want to delete this prescribed drug from prescription"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
