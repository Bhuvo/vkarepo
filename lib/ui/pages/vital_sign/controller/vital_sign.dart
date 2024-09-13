import 'dart:convert';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/pages/vital_sign/model/add_vital_signs.dart';
import 'package:timesmedlite/ui/pages/vital_sign/model/get_vial_sign.dart';
import 'package:http/http.dart' as http;
import 'package:timesmedlite/ui/pages/vital_sign/model/vital_signs_chart_model.dart';

class VitalSignController {
  final String base_url = 'https://tmsnew.timesmed.com/';

  Future<VitalSignsChartModel> getVitalSignsReport(
    userId,
    doctorId,
  ) async {
    final response = await http.get(Uri.parse(base_url +
        'VKAAPI2/Get_Vital_Signs_Report?Patient_Id=$userId&Appointment_Id=1&Doctor_Id=$doctorId'));
    try {
      if (response.statusCode == 200) {
        return VitalSignsChartModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetVitalSignsModel> getVitalSigns(
    userId,
    doctorId,
  ) async {
    final String baseUrl =
        'https://tmsnew.timesmed.com/WebAPIP/LoadSummary?User_id=$userId&DoctorId=$doctorId';
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        GetVitalSignsModel getVitalSignsModel =
            GetVitalSignsModel.fromJson(json);
        return getVitalSignsModel;
      } else {
        throw Exception('Failed to load getVitalSignsModel');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> submitVitals({
    context,
    required int userId,
    required int doctorId,
    required int appointmentId,
    int? nurseId,
    required int bpSystolic,
    required int bpDiastolic,
    required int pulse,
    required int height,
    required int weight,
    required double bmi,
    required int waist,
    required int hip,
    required double temp,
    required int spo2,
    required String dietAndExercise,
    required String notes,
    required String diagnoses,
    required int doctorFlag,
    required int nurseFlag,
    required int summaryId,
  }) async {
    final url = Uri.parse(
        'https://tmsnew.timesmed.com/WebAPIP/SaveAppointmentSummary?');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer <your_token>',
    };

    // Prepare the body by assigning values separately
    final body = {
      "user_id": userId,
      "doctor_id": doctorId,
      "appointment_id": appointmentId,
      "nurse_id": nurseId,
      "bp_systolic": bpSystolic,
      "bp_diastolic": bpDiastolic,
      "pulse": pulse,
      "height": height,
      "weight": weight,
      "bmi": bmi,
      "waist": waist,
      "hip": hip,
      "temp": temp,
      "spo2": spo2,
      "diet_and_exercise": dietAndExercise,
      "notes": notes,
      "diagnoses": diagnoses,
      "doctor_flag": doctorFlag,
      "nurse_flag": nurseFlag,
      "summary_id": summaryId,
    };

    try {
      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        print('Vitals submitted successfully');
        AddVitalSignModel addVitalSignModel =
            AddVitalSignModel.fromJson(json.decode(response.body));
        showMessage(
            context: context, message: addVitalSignModel.responseMessage);
      } else {
        print('Failed to submit vitals: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

// Future<void> saveVitalSign(
  //   context,
  //   String userId,
  //   String doctorId,
  //   String appointmentId,
  //   String nurseId,
  //   String bpSystolic,
  //   String bpDiastolic,
  //   String pulse,
  //   String height,
  //   String weight,
  //   String bmi,
  //   String waist,
  //   String hip,
  //   String temp,
  //   String spo2,
  //   String dietAndExercise,
  //   String notes,
  //   String diagnoses,
  //   String doctorFlag,
  //   String nurseFlag,
  //   String summaryId,
  // ) async {
  //   // Construct the URL and query parameters
  //   final Uri url = Uri.https(
  //     'tmsnew.timesmed.com',
  //     '/WebAPIP/SaveAppointmentSummary',
  //   );
  //
  //   // Define the body parameters
  //   final Map<String, String> body = {
  //     'User_id': userId,
  //     'Doctor_id': doctorId,
  //     'Appointment_id': appointmentId,
  //     'Nurse_Id': nurseId,
  //     'BP_Systolic': bpSystolic,
  //     'BP_Diastolic': bpDiastolic,
  //     'Pulse': pulse,
  //     'Height': height,
  //     'Weight': weight,
  //     'BMI': bmi,
  //     'Waist': waist,
  //     'Hip': hip,
  //     'Temp': temp,
  //     'SPO2': spo2,
  //     'Diet_And_Exercise': dietAndExercise,
  //     'Notes': notes,
  //     'Diagnoses': diagnoses,
  //     'Doctor_Flag': doctorFlag,
  //     'Nurse_Flag': nurseFlag,
  //     'Summary_id': summaryId,
  //   };
  //
  //   try {
  //     // Sending a POST request
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type':
  //             'application/x-www-form-urlencoded', // Set the appropriate content type
  //       },
  //       body: body,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Successfully received response
  //       print('Response data: ${response.body}');
  //       AddVitalSignModel addVitalSignModel =
  //           AddVitalSignModel.fromJson(jsonDecode(response.body));
  //       showMessage(
  //           context: context, message: addVitalSignModel.responseMessage);
  //     } else {
  //       // Handle server errors
  //       print('Error: ${response.statusCode} ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     // Handle network errors
  //     print('Network error: $e');
  //     showMessage(context: context, message: 'Network error: $e');
  //   }
  // }

/*  Future<void> saveVitalSigns(
      context,
      String userId,
      String doctorId,
      String appointmentId,
      String nurseId,
      String dietAndExercise,
      double bpSystolic,
      double bpDiastolic,
      double pulse,
      double height,
      double weight,
      double waist,
      double hip,
      double temperature,
      double spo2,
      double bmi,
      String notes,
      String diagnosis) async {
    // Define the API endpoint
    final String apiUrl =
        'https://tmsnew.timesmed.com/WebAPIP/SaveAppointmentSummary?';

    // Define the query parameters
    final Map<String, dynamic> queryParams = {
      'User_id': userId,
      'Doctor_Id': doctorId ?? '37941',
      'Appointment_Id': "1",
      'Diet_And_Exercise': dietAndExercise,
      'BP_Systolic': bpSystolic.toString(),
      'BP_Diastolic': bpDiastolic.toString(),
      'Pulse': pulse.toString(),
      'Height': height.toString(),
      'Weight': weight.toString(),
      'Waist': waist.toString(),
      'Hip': hip.toString(),
      'Temperture': temperature.toString(),
      'SPO2': spo2.toString(),
      'BMI': bmi.toString(),
      'Notes': notes,
      'Diagnosis': diagnosis,
    };

    // Build the complete URL with query parameters
    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    try {
      // Send the GET request
      final http.Response response = await http.get(uri);

      // Check the response status
      if (response.statusCode == 200) {
        // Success
        print('Vital signs saved successfully: ${response.body}');
        VitalSavedModel vitalSavedModel =
            VitalSavedModel.fromJson(json.decode(response.body));
        showMessage(context: context, message: vitalSavedModel.responseMessage);
      } else {
        // Failure
        print(
            'Failed to save vital signs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors
      print('Error saving vital signs: $e');
    }
  }*/
}
