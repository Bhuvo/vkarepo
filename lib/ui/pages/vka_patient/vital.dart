import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/vital_sign/model/get_vial_sign.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/map/vital_textfield.dart';
import 'package:timesmedlite/utils/local_storage.dart';

import '../../components/show_message.dart';
import '../../widgets/line_chart_design.dart';
import '../vital_sign/model/add_vital_signs.dart';
import '../vital_sign/model/vital_signs_chart_model.dart';
import '../vital_sign/vital_chart.dart';

class Vital extends StatefulWidget {
  const Vital({super.key});

  @override
  State<Vital> createState() => _VitalState();
}

class _VitalState extends State<Vital> {
  // VitalSignController _apiService = VitalSignController();
  GetVitalSignsModel? getVitalSignsModel;

  Future<GetVitalSignsModel> getVitalSigns(
      userId,
      doctorId,
      ) async {
    final String baseUrl =
        'https://tmsnew.timesmed.com/WebAPIP/LoadSummary?Patient_Id=310713';
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
    required String userId,
    String? nurseId,
    required String bpSystolic,
    required String bpDiastolic,
    required String pulse,
    required String height,
    required String weight,
    required String bmi,
    required String waist,
    required String hip,
    required String temp,
    required String spo2,
    required String dietAndExercise,
    required String notes,
    required String diagnoses,
    required String doctorFlag,
    required String nurseFlag,
  }) async {
    final url = Uri.parse(
        'https://tmsnew.timesmed.com/WebAPIP/SaveAppointmentSummary');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer <your_token>',
    };

    final body = {
      "user_id": userId,
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
      "Patient_Flag" :'1'
    };

    // final Data bodyData = Data(
    //   patientId: userId,
    //   bPSystolic: bpSystolic.toString(),
    //   bPDiastolic: bpDiastolic.toString(),
    //   pulse: pulse.toString(),
    //   height: height.toString(),
    //   weight: weight.toString(),
    //   bMI: bmi.toString(),
    //   temperture: temp.toString(),
    //   dietAndExercise: dietAndExercise,
    //   notes: notes,
    //   diagnosis: diagnoses,
    // );
    try {
      final response =
      await http.post(url.replace(queryParameters: body), headers: headers,);

      if (response.statusCode == 200) {
        print('Vitals submitted successfully');
        // AddVitalSignModel addVitalSignModel =
        // AddVitalSignModel.fromJson(json.decode(response.body));
        // showMessage(
        //     context: context, message: addVitalSignModel.responseMessage);
        showMessage(context: context, message: 'Vitals submitted successfully');
        // context.pop();
        print('Vitals submitted successfully ${response.body}');
      } else {
        print('Failed to submit vitals: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  void getdata() async {
    getVitalSignsModel =
    await getVitalSigns(LocalStorage.getUser().userId, LocalStorage.getUID());
    if (getVitalSignsModel != null) {
      dietAndExerciseController.text =
          getVitalSignsModel!.data.dietAndExercise ?? "";
      bpSystolicController.text = getVitalSignsModel!.data.bpSystolic ?? "";
      bpDiastolicController.text = getVitalSignsModel!.data.bpDiastolic ?? "";
      pulseController.text = getVitalSignsModel!.data.pulse ?? "";
      heightController.text = getVitalSignsModel!.data.height ?? "";
      weightController.text = getVitalSignsModel!.data.weight ?? "";
      waistController.text = getVitalSignsModel!.data.waist ?? "";
      hipController.text = getVitalSignsModel!.data.hip ?? "";
      temperatureController.text = getVitalSignsModel!.data.temp ?? "";
      spo2Controller.text = getVitalSignsModel!.data.spo2 ?? "";
      bmiController.text = getVitalSignsModel!.data.bmi ?? "";
      notesController.text = getVitalSignsModel!.data.notes ?? "";
      diagnosisController.text = getVitalSignsModel!.data.diagnoses ?? "";
    } else {
      print("Error");
    }
  }

  // final VitalSignController _apiServiceC = VitalSignController();

  // Controllers for text fields
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController doctorIdController = TextEditingController();
  final TextEditingController appointmentIdController = TextEditingController();
  final TextEditingController dietAndExerciseController =
  TextEditingController();
  final TextEditingController bpSystolicController = TextEditingController();
  final TextEditingController bpDiastolicController = TextEditingController();
  final TextEditingController pulseController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController hipController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController spo2Controller = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();

  // Function to save vital signs

  @override
  void initState() {
    // TODO: implement initState
    // getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MScaffold(
      title: const Text(Consts.VITAL_SIGNS_REPORT),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              VitalTextField(
                  controller: dietAndExerciseController,
                  labelText: 'Diet And Exercise',
                  maxLines: 4,
                  height: 30),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                      child: VitalTextField(
                        controller: bpSystolicController,
                        labelText: 'Bp-Systolic',
                        suffixText: 'mmHg',
                        keyboardType: TextInputType.number,
                      )),
                  // Text(
                  //   '/',
                  //   style: TextStyle(
                  //     fontSize: 30.0,
                  //   ),
                                       // ),
                  // Expanded(
                  //   child: TextField(
                  //       controller: bpDiastolicController,
                  //       keyboardType: TextInputType.number,
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           enabledBorder: InputBorder.none)),
                  // ),
                  SizedBox(width: 16.0),
                  Expanded(
                      child: VitalTextField(
                        controller: bpDiastolicController,
                        labelText: 'B-Diastolic',
                        suffixText: 'mmHg',
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
             SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: VitalTextField(
                      controller: heightController,
                      labelText: 'Height',
                      suffixText: 'CM',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: VitalTextField(
                      controller: weightController,
                      labelText: 'Weight',
                      suffixText: 'KG',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Row(
              //   children: [
              //     Expanded(
              //       child: VitalTextField(
              //         controller: waistController,
              //         labelText: 'Waist',
              //         suffixText: 'CM',
              //         keyboardType: TextInputType.number,
              //       ),
              //     ),
              //     SizedBox(width: 16.0),
              //     Expanded(
              //       child: VitalTextField(
              //         controller: hipController,
              //         labelText: 'Hip',
              //         suffixText: 'CM',
              //         keyboardType: TextInputType.number,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: VitalTextField(
                      controller: temperatureController,
                      labelText: 'Temperature',
                      suffixText: '°C',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                      child: VitalTextField(
                        controller: pulseController,
                        labelText: 'Pulse',
                        suffixText: 'Bpm',
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
              SizedBox(height: 16.0),
              VitalTextField(
                controller: bmiController,
                labelText: 'BMI',
                suffixText: 'kg/m2',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              VitalTextField(
                  controller: notesController, labelText: 'Notes', maxLines: 4),
              SizedBox(height: 16.0),
              VitalTextField(
                  controller: diagnosisController,
                  labelText: 'Diagnosis',
                  maxLines: 4),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('View Chart'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VitalSignChartPage(
                                    patientId: LocalStorage.getCursorPatient().userId.toString(),
                                isFromPatient: true,
                                )));
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Save Vital Signs'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                       // print(LocalStorage.getCursorPatient().userId.toString());
                       // print(LocalStorage.getJson(LocalStorage.CURSOR_USER));
                      setState(() {
                        submitVitals(
                            context: context,
                            userId: LocalStorage.getCursorPatient().userId.toString(),
                            // doctorId: LocalStorage.getUID().toString(),
                            height: heightController.text,
                            weight: weightController.text,
                            bpSystolic: bpSystolicController.text,
                            bpDiastolic: bpDiastolicController.text,
                            pulse: pulseController.text,
                            waist: waistController.text,
                            hip: hipController.text,
                            temp: temperatureController.text,
                            spo2: spo2Controller.text,
                            bmi: bmiController.text,
                            notes: notesController.text,
                            diagnoses: diagnosisController.text,
                            doctorFlag: '1',
                            nurseFlag: '0',
                            dietAndExercise:dietAndExerciseController.text
                        )
                            .then((value) => {
                          dietAndExerciseController.clear(),
                          diagnosisController.clear(),
                          bpSystolicController.clear(),
                          bpDiastolicController.clear(),
                          pulseController.clear(),
                          heightController.clear(),
                          weightController.clear(),
                          waistController.clear(),
                          hipController.clear(),
                          temperatureController.clear(),
                          spo2Controller.clear(),
                          bmiController.clear(),
                          notesController.clear(),
                        });
                        print('Welcome');
                      });
                    },
                  ),
                ],
              ),
              /* ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FloatNavigatorPage(
                                  patientId: ,
                            )));
                  },
                  child: Text('Float'))*/
            ],
          ),
        ),
      ),
    );
  }
}