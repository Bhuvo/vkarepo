import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/pages/medical_record/model/prescription_template_model.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class PrescriptionListController{

  List<PrescriptionTemplateModel> data =  [];

  Future<void> getTemplateList()async{
    print('https://doctor.timesmed.com/PrintLayout/Get_Prescription_Layout_API?Hospital_Id=${LocalStorage.getUser().hospitalId}&Doctor_Id=0&Admin_Id=${LocalStorage.getUser().hospitalAdminId}');
    final response = await http.get(Uri.parse('https://doctor.timesmed.com/PrintLayout/Get_Prescription_Layout_API?Hospital_Id=${LocalStorage.getUser().hospitalId}&Doctor_Id=0&Admin_Id=${LocalStorage.getUser().hospitalAdminId}'));
    if(response.statusCode == 200){
      List<dynamic> result = jsonDecode(response.body);
      data = result.map((e)=> PrescriptionTemplateModel.fromJson(e)).toList();
      print('Lenght of Template List: ${data.length}');
    }else{
      print('Error while getting Template List');
    }
  }

  Future<void> changeStatus(BuildContext context,String id ,String status)async {
    var response = await http.post(Uri.parse('https://doctor.timesmed.com/PrintLayout/Change_Status_API?PrintTemplate_id=$id&Active_Flag=$status'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if(response.statusCode == 200){
      showMessage(context: context, message:'Status Changed Successfully');
    }else{
    }
  }
}