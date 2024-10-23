import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timesmedlite/ui/pages/medical_record/model/prescription_template_model.dart';

class PrescriptionListController{

  List<PrescriptionTemplateModel> data =  [];

  Future<void> getTemplateList()async{
    final response = await http.get(Uri.parse('https://doctor.timesmed.com/PrintLayout/Get_Prescription_Layout_API?Hospital_Id=41835&Doctor_Id=184376'));
    if(response.statusCode == 200){
      List<dynamic> result = jsonDecode(response.body);
      data = result.map((e)=> PrescriptionTemplateModel.fromJson(e)).toList();
      print('Lenght of Template List: ${data.length}');
    }else{
      print('Error while getting Template List');
    }
  }
}