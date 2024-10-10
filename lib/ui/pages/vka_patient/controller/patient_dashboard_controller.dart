import 'dart:convert';

import 'package:http/http.dart'as http;

class PatientDashBoardController{

  Future<dynamic> getClinicalAppointmentData(dynamic UserId ,String type)async {
     var response = await  http.get(Uri.parse('https://tmsnew.timesmed.com/VKAAPI1/PatientDashboardCount?Patient_Id=$UserId'));
     print(type);
     print(response.body);
     if(response.statusCode ==200){
       return jsonDecode(response.body)['Data'];
     }else {
       return false;
     }
  }
}