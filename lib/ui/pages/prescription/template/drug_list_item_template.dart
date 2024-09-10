
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/prescription/template/single_template_view_page.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../model/saved_presc.dart';
import '../../../components/waiting_dialog.dart';
import '../../../theme/theme.dart';
import '../../../widgets/m_icon_button.dart';
import '../../../widgets/m_list_tile.dart';
import '../prescription_edit_page.dart';
import '../prescription_editor.dart';

class DrugListItemTemplate extends StatelessWidget {
  final SavedPrescription? data;
  final appointmentid,Template_Name,Description;
  const DrugListItemTemplate({Key? key, this.data,required this.appointmentid,required this.Template_Name,this.Description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        itemCount: data?.ListPresc?.length,
        itemBuilder: (context,index) {
          return data?.ListPresc![index].Prescription_id==''?Container():MListTile(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: DefaultTextStyle(
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 13,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data?.ListPresc![index].Drug_Name}", style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w600),),
                        Text('Frequency: ${data?.ListPresc![index].Frequency}, ${data?.ListPresc![index].Days} Days, Qty: ${data?.ListPresc![index].dosage}, ${data?.ListPresc![index].Instruction}'),
                      ],
                    ),
                  )),

                  const SizedBox(width: 16,),
                  MIconButton(child: const Icon(Icons.delete_outline, color: Colors.red, size: 20,),
                    color: Colors.red,
                    padding: const EdgeInsets.all(4),
                    onTap: (){
                      showAlertDialog(context,data?.ListPresc![index].Prescription_id);
                    },
                  ),
                ],
              ));
        }
    );
  }

  showAlertDialog(BuildContext context,Pid) {
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
        onPressed: () async{
          final call = Injector()
              .apiService
              .get(path: 'Prescription_Delete', query: {
            'Prescription_id': Pid
          },);
          final res1 = await showWaitingDialog(
              context: context, call: call);
          if (res1?.body.message == 'Delted') {
            print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res1}");

            context.pop();
            context.popDialog();
            showDialog(context: context, builder: (c) =>   SingleTempalteViewDialog(appointment_id_for_this_template:
            //data[ind]["Appointment_id"],
            '157196',
              Template_Name:Template_Name.toString(),
              Description:Description.toString() ,));
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
      content: Text("Are you sure you want to delete this prescribed drug from prescription"),
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
