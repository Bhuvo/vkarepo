import 'dart:convert';

import 'package:http/http.dart'as http;

class PatientDashBoardController{

  Future<dynamic> getClinicalAppointmentData(String UserId ,String type)async {
     var response = await  http.get(Uri.parse('https://user.timesmed.com/User/Patient_Dashboard_Count_Api?type=$type&Patient_Id=$UserId'));
     if(response.statusCode ==200){
       return jsonDecode(response.body);
     }else {
       return false;
     }
  }
}