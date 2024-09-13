import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/vital_sign/model/vital_signs_chart_model.dart';

class LineChartDesign extends StatelessWidget {
  final VitalSignsChartModel vitalSignsReportModel;
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

    for (var datum in vitalSignsReportModel.data) {
      // Get the value based on the valueKey and check for null
      String? valueString = valueKey == 'weight'
          ? datum.weight
          : valueKey == 'pulse'
              ? datum.pulse
              : valueKey == 'spo2'
                  ? datum.spo2
                  : valueKey == 'bp_systolic'
                      ? datum.bpSystolic
                      : datum.bpDiastolic;

      if (valueString != null && valueString.isNotEmpty) {
        final double? value = double.tryParse(valueString);
        if (value != null) {
          values.add(value);
        }
      }

      // Add date only if it's not null or empty
      if (datum.appointmentDate != null && datum.appointmentDate.isNotEmpty) {
        dates.add(datum.appointmentDate);
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
