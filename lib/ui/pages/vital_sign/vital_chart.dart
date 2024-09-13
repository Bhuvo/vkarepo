// lib/screens/vital_signs_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/vital_sign/controller/vital_sign.dart';
import 'package:timesmedlite/ui/pages/vital_sign/model/vital_signs_chart_model.dart';
import 'package:timesmedlite/ui/widgets/line_chart_design.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class VitalSignChartPage extends StatefulWidget {
  String patientId;
  VitalSignChartPage({super.key, required this.patientId});
  @override
  _VitalSignChartPageState createState() => _VitalSignChartPageState();
}

class _VitalSignChartPageState extends State<VitalSignChartPage> {
  late VitalSignsChartModel _vitalSignsReport; // To store fetched data
  bool _isLoading = true; // To manage loading state
  String? _errorMessage; // To store error messages if any

  @override
  void initState() {
    super.initState();
    _fetchVitalSignsReport(); // Fetch data when the screen loads
  }

  Future<void> _fetchVitalSignsReport() async {
    try {
      _vitalSignsReport = await VitalSignController().getVitalSignsReport(
widget.patientId,LocalStorage.getUID()
      ); // Fetch data
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
              : _vitalSignsReport == null || _vitalSignsReport!.data.isEmpty
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
                              LineChartDesign(
                                vitalSignsReportModel: _vitalSignsReport,
                                chartType: 'SPO2',
                                valueKey: 'spo2',
                              ),
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
