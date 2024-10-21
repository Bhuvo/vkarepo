import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/medical_record/model/prescription_template_model.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:http/http.dart'as http;
import '../../theme/theme.dart';

class AddPrescriptionTemplate extends StatefulWidget {
  const AddPrescriptionTemplate({super.key});

  @override
  State<AddPrescriptionTemplate> createState() => _AddPrescriptionTemplateState();
}

class _AddPrescriptionTemplateState extends State<AddPrescriptionTemplate> {

  PrescriptionTemplateModel model = PrescriptionTemplateModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MTheme.THEME_COLOR,title: Text('Add New Template',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          )),),
      body: SingleChildScrollView(
        child: Column(children: [
          MTextField(
            label: 'Hospital Address',
            maxLines: 4,
            onChanged: (val){
              model.hospitalAddress = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Email' ,
            onChanged: (val){
              model.hospitalEmailid = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Phone',
            onChanged: (val){
              model.hospitalPhoneNumber = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Working Hours',
            onChanged: (val){
              model.hospitalWorkingHours = val;
            },
          ),
          Space(),
          OutlinedButton(onPressed: ()async{
            var response = await http.post(Uri.parse('https://doctor.timesmed.com/PrintLayout/Save_ImagePrint_API?').replace(
              queryParameters: {
                'Hospital_id': '41835',
                'Doctor_id': '0',
                'HospitalAddress': model.hospitalAddress,
                'HospitalEmailid': model.hospitalEmailid,
                'Hospital_PhoneNumber': model.hospitalPhoneNumber,
                'HospitalWorkingHours': model.hospitalWorkingHours
              }
            ));

          }, child: const Text('Add Template'))
        ],),
      ),
    );
  }
}
