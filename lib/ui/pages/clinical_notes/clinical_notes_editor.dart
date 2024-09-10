import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/clinical_notes_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/clinical_note_loadsummary.dart';
import '../../components/waiting_dialog.dart';

class ClinicalNotesEditor extends StatefulWidget {
  final ClinicalNotesLoadSummary? data;
  final String? doctorID;
  final String? userID;
  final String? appointmentID;
   ClinicalNotesEditor({Key? key,this.data,this.doctorID,this.userID,this.appointmentID}) : super(key: key);

  @override
  State<ClinicalNotesEditor> createState() => _ClinicalNotesEditorState();
}

class _ClinicalNotesEditorState extends State<ClinicalNotesEditor> {

  late double height =  double.parse(widget.data?.Height), weight = double.parse(widget.data?.Weight), pulse =  double.parse(widget.data?.Pulse), temp =  double.parse(widget.data?.Temp);

  late final disease_name_text_controller = TextEditingController(text:widget.data?.Disease_name.toString() );
  late final allergies_text_controller = TextEditingController(text:widget.data?.Allergies.toString() );
  late final symptoms_text_controller = TextEditingController(text:widget.data?.Symptoms.toString() );
  late final diagnoses_text_controller = TextEditingController(text:widget.data?.Diagnoses.toString() );
  late final causes_text_controller = TextEditingController(text:widget.data?.Causes.toString() );
  late final investigation_text_controller = TextEditingController(text:widget.data?.Investigation.toString() );
  late final notes_text_controller = TextEditingController(text:widget.data?.Notes.toString() );
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.CLINICAL_NOTES),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              MSlider(
                value: height,
                label: 'Height',
                min: 20,
                max: 400,
                onChanged: (d){
                  setState((){
                    height = d;
                  });
                },
                valueBuilder: (v){
                  return Text('${v.toStringAsFixed(1)}cm', style: TextStyle(fontSize: 16, color: MTheme.THEME_COLOR),);
                },
              ),
              MSlider(
                value:  weight,
                label: 'Weight',
                max: 200,
                onChanged: (d){
                  setState((){
                    weight = d;
                  });
                },
                valueBuilder: (v){
                  return Text('${v.round()}kg', style: TextStyle(fontSize: 16, color: MTheme.THEME_COLOR),);
                },
              ),
              MSlider(
                value:  pulse,
                label: 'Pulse',
                max: 150,
                onChanged: (d){
                  setState((){
                    pulse = d;
                  });
                },
                valueBuilder: (v){
                  return Text('${v.round()}/min', style: TextStyle(fontSize: 16, color: MTheme.THEME_COLOR),);
                },
              ),
              MSlider(
                value:  temp,
                label: 'Temperature',
                max: 150,
                onChanged: (d){
                  setState((){
                    temp = d;
                  });
                },
                valueBuilder: (v){
                  return Text('${v.round()}c', style: TextStyle(fontSize: 16, color: MTheme.THEME_COLOR),);
                },
              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: disease_name_text_controller,
                label: 'Disease Complaints',
                minLines: 3,
                maxLines: 5,
              ) ,
              const SizedBox(height: 8,),
              MTextField(
                controller: allergies_text_controller,
                label: 'Allergies',
                minLines: 3,
                maxLines: 5,

              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: symptoms_text_controller,
                label: 'Symptoms',
                minLines: 3,
                maxLines: 5,

              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: diagnoses_text_controller,
                label: 'Diagnoses',
                minLines: 3,
                maxLines: 5,

              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: causes_text_controller,
                label: 'Causes',
                minLines: 3,
                maxLines: 5,

              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: investigation_text_controller,
                label: 'Investigation',
                minLines: 3,
                maxLines: 5,

              ),
              const SizedBox(height: 8,),
              MTextField(
                controller: notes_text_controller,
                label: 'Notes',
                minLines: 3,
                maxLines: 5,

              ),
            ],
          ),),
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: context.getWPercent(10), vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: OutlinedButton(onPressed: (){
              disease_name_text_controller.clear();
              allergies_text_controller.clear();
              diagnoses_text_controller.clear();
              causes_text_controller.clear();
              investigation_text_controller.clear();
               notes_text_controller.clear();
              context.pop();
            }, child: Text('Cancel', style: TextStyle(color: Colors.white),), style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),)),
            const SizedBox(width: 16,),
            Expanded(child: OutlinedButton(onPressed: () async{
              // print("${height} ${weight} ${pulse} ${temp} ${widget.data?.Summary_id} ${diagnoses_text_controller.text}");
              final call = Injector().apiService.post2(
                path: 'SaveAppointmentSummary', body: {
                "Summary_id": widget.data?.Summary_id,
                "Pulse": "${pulse}",
                "Disease_name": disease_name_text_controller.text,
                "Allergies": allergies_text_controller.text,
                "Symptoms": symptoms_text_controller.text,
                "Height": "${height}",
                "Weight": "${weight}",
                "Temp": "${temp}",
                "Diagnoses":diagnoses_text_controller.text,
                "Causes": causes_text_controller.text,
                "Investigation": investigation_text_controller.text,
                "Notes": notes_text_controller.text,
                "Doctor_id": "${widget.doctorID}",
                "Appointment_id": "${widget.appointmentID}",
                "User_id": "${widget.userID}",
                "Status_Flag":  widget.data?.Status_Flag,
                "ClincialList":  widget.data?.ClincialList,
              }
              );
                  final res = await showWaitingDialog(context: context, call: call);
              print("RES::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${res?.body}");

              if(res?.body.message == "Saved Successfully"){

                disease_name_text_controller.clear();
                allergies_text_controller.clear();
                diagnoses_text_controller.clear();
                causes_text_controller.clear();
                investigation_text_controller.clear();
                notes_text_controller.clear();

                context.pop();
                //context.popDialog();
              }
              else{
               AlertDialog(title: Text("ERRRRRRRRR"),);
              }
            }, child: Text('Submit'), )),
          ],
        ),
      ),
    );
  }
}
