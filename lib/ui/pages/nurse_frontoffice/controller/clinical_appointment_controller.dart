import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/booking_appointment_patient.dart';

class ClinicalAppointmentController {

   List<BookingAppointmentPatient> patientList = [];

   Future<void> getClinicalAppointmentList(String docId ,String hosId,String status ,String from ,String to) async {
     var response = await http.get(Uri.parse('https://api.timesmed.com/WebAPI2/GetVkaAppointmentList?DoctorId=$docId&status_id=$status&From=$from&To=$to&hos_id=$hosId'));
     if(response.statusCode == 200){
       if(jsonDecode(response.body)['ResponseMessage'] == 'No Records Found'){
         return;
       }
       var jsonResponse = jsonDecode(response.body)['Data']['pat_list'];
       patientList = jsonResponse.map<BookingAppointmentPatient>((json) => BookingAppointmentPatient.fromJson(json)).toList();
     }else{
       print('Error while fetching appointment list');
     }
   }

   Future<void> changeStatus(String nurseId,String appId ,String status) async {
     var response = await http.get(Uri.parse('https://api.timesmed.com/WebAPI2/update_appointment?app_id=$appId&Id=$nurseId&status=$status'),
         headers: {'Content-Type': 'application/json',
           'Accept': 'application/json',});
     if(response.statusCode == 200){
       print('Status changed successfully');
     }else{
       print('Error while changing status');
     }
   }

}