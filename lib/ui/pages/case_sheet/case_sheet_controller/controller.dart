import 'dart:convert';

import '../case_sheet_model/model.dart';
import 'package:http/http.dart' as http;

class CaseSheetController {
  CaseSheetModel modelData = CaseSheetModel();
  Data caseSheetData = Data();

  Future<void> getCaseSheetData(String patientId) async {
    var response = await http.get(Uri.parse(
        'https://tmsnew.timesmed.com/VKAAPI2/Get_Patient_Case_Sheet?Patient_Id=$patientId'));
    if (response.statusCode == 200) {
      modelData = CaseSheetModel.fromJson(jsonDecode(response.body));
      caseSheetData =
          modelData.data!.isNotEmpty ? (modelData.data?[0] ?? Data()) : Data();
      print('fetch success');
      print(response.body);
      // print(modelData.data?[0]);
    } else {
      print('fetch failed');
    }
  }

  Future<void> saveCaseSheetData(String patientId, String doctorId,
      String appointmentId, Data data) async {
    data.patientId = int.tryParse(patientId);
    data.doctorId = int.tryParse(doctorId);
    data.appointmentId = int.tryParse(appointmentId);
    print(data.toJson());
    final response = await http.post(
        Uri.parse(
            'https://tmsnew.timesmed.com/VKAAPI2/Save_Patient_Case_Sheet'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      getCaseSheetData(patientId);
      print(response.body);
    } else {
      print(
          'Request failed with status: ${response.statusCode}.${response.body}');
    }
  }
}
