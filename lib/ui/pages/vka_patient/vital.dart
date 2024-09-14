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
    int? nurseId,
    required int patientId,
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
        'https://tmsnew.timesmed.com/VKAAPI2/Save_Vital_Signs?');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer <your_token>',
    };

    // Prepare the body by assigning values separately
    final body = {
     'Patient_Id':patientId,
      "bp_systolic": bpSystolic,
      "bp_diastolic": bpDiastolic,
      "pulse": pulse,
      "height": height,
      "weight": weight,
      "bmi": bmi,
     // "waist": waist,
      // "hip": hip,
      "temp": temp,
      // "spo2": spo2,
      "diet_and_exercise": dietAndExercise,
      "notes": notes,
      "diagnoses": diagnoses,
      "doctor_flag": doctorFlag,
      "nurse_flag": nurseFlag,
      "summary_id": summaryId,
    };

    final Data bodyData = Data(
      patientId: patientId,
      bPSystolic: bpSystolic.toString(),
      bPDiastolic: bpDiastolic.toString(),
      pulse: pulse.toString(),
      height: height.toString(),
      weight: weight.toString(),
      bMI: bmi.toString(),
      temperture: temp.toString(),
      dietAndExercise: dietAndExercise,
      notes: notes,
      diagnosis: diagnoses,
    );
    try {
      final response =
      await http.post(url, headers: headers, body: json.encode(bodyData));

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
    getdata();
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
                                    patientId: LocalStorage.getCursorPatient().userId.toString())));
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
                            patientId: LocalStorage.getCursorPatient().userId,
                            bpSystolic: int.tryParse(
                                bpSystolicController.text ?? '0.0') ??
                                0,
                            bpDiastolic: int.tryParse(
                                bpDiastolicController.text ?? '0') ??
                                0,
                            pulse:
                            int.tryParse(pulseController.text ?? '0') ??
                                0,
                            height:
                            int.tryParse(heightController.text ?? '0') ??
                                0,
                            weight:
                            int.tryParse(weightController.text ?? '0') ??
                                0,
                            bmi: double.tryParse(bmiController.text ?? '0.0') ??
                                0.0,
                            waist:
                            int.tryParse(waistController.text ?? '0') ??
                                0,
                            hip: int.tryParse(hipController.text ?? '0') ?? 0,
                            temp: double.tryParse(temperatureController.text ?? '0.0') ?? 0.0,
                            spo2: int.tryParse(spo2Controller.text ?? '0') ?? 0,
                            dietAndExercise: bmiController.text ?? '0',
                            notes: notesController.text ?? '0',
                            diagnoses: diagnosisController.text ?? '0',
                            doctorFlag: 1,
                            nurseFlag: 0,
                            summaryId: 24330)
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




class VitalSignChartPage extends StatefulWidget {
  String patientId;
  VitalSignChartPage({super.key, required this.patientId});
  @override
  _VitalSignChartPageState createState() => _VitalSignChartPageState();
}

class _VitalSignChartPageState extends State<VitalSignChartPage> {
  late VitalModel _vitalSignsReport; // To store fetched data
  bool _isLoading = true; // To manage loading state
  String? _errorMessage; // To store error messages if any

  @override
  void initState() {
    super.initState();
    _fetchVitalSignsReport(); // Fetch data when the screen loads
  }
  Future<VitalModel> getVitalSignsReport(
      userId
      ) async {
    print('getVitalSignsReport $userId'); //297488
    final response = await http.get(Uri.parse('https://tmsnew.timesmed.com/VKAAPI2/Get_Vital_Signs?Patient_Id=$userId'));
    try {
      if (response.statusCode == 200) {
        return VitalModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<void> _fetchVitalSignsReport() async {
    try {
      _vitalSignsReport = await getVitalSignsReport(
          widget.patientId
      ); // Fetch data
      print('hhsjhjdvqwvfjhvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${_vitalSignsReport.data?.length.toString()}');
      setState(() {
        _isLoading = false; // Set loading to false when data is fetched
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString(); // Capture and display the error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text('Vital Signs'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : _vitalSignsReport == null || _vitalSignsReport!.data!.isEmpty
          ? const Center(child: Text('No data available'))
          : Column(
        children: [
          /* ElevatedButton(
                          child: Text('Add Patient Vital Signs'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VitalSignsForm(patientId:widget.patientId.toString())));
                            });
                          },
                        ),*/
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                LineChartDesign(
                  vitalSignsReportModel: _vitalSignsReport,
                  chartType: 'Weight',
                  valueKey: 'weight',
                ),
                LineChartDesign(
                  vitalSignsReportModel: _vitalSignsReport,
                  chartType: 'Pulse',
                  valueKey: 'pulse',
                ),
                // LineChartDesign(
                //   vitalSignsReportModel: _vitalSignsReport,
                //   chartType: 'SPO2',
                //   valueKey: 'spo2',
                // ),
                LineChartDesign(
                  vitalSignsReportModel: _vitalSignsReport,
                  chartType: 'BP_Systolic',
                  valueKey: 'bp_systolic',
                ),
                LineChartDesign(
                  vitalSignsReportModel: _vitalSignsReport,
                  chartType: 'BP_Diastolic',
                  valueKey: 'bp_diastolic',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class VitalModel {
  List<Data>? data;
  String? responseCode;
  String? responseMessage;

  VitalModel({this.data, this.responseCode, this.responseMessage});

  VitalModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  int? vitalSignsId;
  int? patientId;
  String? dietAndExercise;
  String? bPSystolic;
  String? bPDiastolic;
  String? pulse;
  String? height;
  String? weight;
  String? temperture;
  String? bMI;
  String? notes;
  String? diagnosis;
  String? insertDate;

  Data(
      {this.vitalSignsId,
        this.patientId,
        this.dietAndExercise,
        this.bPSystolic,
        this.bPDiastolic,
        this.pulse,
        this.height,
        this.weight,
        this.temperture,
        this.bMI,
        this.notes,
        this.diagnosis,
        this.insertDate});

  Data.fromJson(Map<String, dynamic> json) {
    vitalSignsId = json['Vital_Signs_Id'];
    patientId = json['Patient_Id'];
    dietAndExercise = json['Diet_And_Exercise'];
    bPSystolic = json['BP_Systolic'];
    bPDiastolic = json['BP_Diastolic'];
    pulse = json['Pulse'];
    height = json['Height'];
    weight = json['Weight'];
    temperture = json['Temperture'];
    bMI = json['BMI'];
    notes = json['Notes'];
    diagnosis = json['Diagnosis'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Vital_Signs_Id'] = this.vitalSignsId;
    data['Patient_Id'] = this.patientId;
    data['Diet_And_Exercise'] = this.dietAndExercise;
    data['BP_Systolic'] = this.bPSystolic;
    data['BP_Diastolic'] = this.bPDiastolic;
    data['Pulse'] = this.pulse;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['Temperture'] = this.temperture;
    data['BMI'] = this.bMI;
    data['Notes'] = this.notes;
    data['Diagnosis'] = this.diagnosis;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}



class LineChartDesign extends StatelessWidget {
  final VitalModel vitalSignsReportModel;
  final String chartType;
  final String valueKey;

  const LineChartDesign({
    super.key,
    required this.vitalSignsReportModel,
    required this.chartType,
    required this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    List<String> dates = [];
    List<double> values = [];

    for (Data datum in vitalSignsReportModel.data ?? []) {
      // Get the value based on the valueKey and check for null
      String? valueString = valueKey == 'weight'
          ? datum.weight
          : valueKey == 'pulse'
          ? datum.pulse
          : valueKey == 'bp_systolic'
          ? datum.bPSystolic
          : datum.bPDiastolic;


      if (valueString != null && valueString.isNotEmpty) {
        final double? value = double.tryParse(valueString);
        if (value != null) {
          values.add(value);
        }
      }

      // Add date only if it's not null or empty
      if (datum.insertDate != null && datum.insertDate!.isNotEmpty) {
        dates.add(datum.insertDate ?? '');
      }
    }

    if (dates.isEmpty || values.isEmpty) {
      return Center(child: Text('No data available for $chartType'));
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              chartType,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: dates.length * 100.0, // Adjust width as needed
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            if (index >= 0 && index < dates.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  dates[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Container();
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Container();
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    minX: -1,
                    maxX: (dates.length - 1).toDouble(),
                    minY: 0,
                    maxY: values.isNotEmpty
                        ? values.reduce((a, b) => a > b ? a : b) * 2.0
                        : 250,
                    lineBarsData: [
                      LineChartBarData(
                        spots: values.asMap().entries.map((entry) {
                          int index = entry.key;
                          double value = entry.value;
                          return FlSpot(index.toDouble(), value.toDouble());
                        }).toList(),
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 4,
                        belowBarData: BarAreaData(show: false),
                        dotData: FlDotData(
                          show: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
