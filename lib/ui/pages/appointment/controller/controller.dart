
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/appointment_data.dart';
import '../../../../model/appointment_response.dart';
import '../model/model.dart';

class PatientClinicalAppointmentController {
  List<AppointmentData> upcoming = <AppointmentData>[];
  List<AppointmentData> previous = [];

  Future<void> getClinicalAppointmentData(int userId) async {
    var response = await http.get(Uri.parse('https://api.timesmed.com/WebAPI2/GetPatientAppointments?user_id=$userId'));
    if(response.statusCode == 200){
      var upcomingList = jsonDecode(response.body)['Data']['UpcomingAppointmentList'];
      upcoming = upcomingList.map<AppointmentData>((json) => AppointmentData.fromJson(json)).toList();
      var previousList = jsonDecode(response.body)['Data']['PreviousAppointmentList'];
      previous = previousList.map<AppointmentData>((json) => AppointmentData.fromJson(json)).toList();

      print('lenth of data ${upcoming.length}');
      // print('lenth of data ${previous.length}');
    }else{
      print('error while fetching data');
    }
  }
}