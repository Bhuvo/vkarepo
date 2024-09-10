import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/vital_sign/vital_sign_list_item.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/vital_sign.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class AddVitalSignDialog extends StatefulWidget {
  final userId;

  const AddVitalSignDialog({Key? key, this.userId}) : super(key: key);

  @override
  State<AddVitalSignDialog> createState() => _AddVitalSignDialogState();
}

class _AddVitalSignDialogState extends State<AddVitalSignDialog> {
  String value = Consts.INSTANT;
  DateTime date = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timecontroller = TextEditingController();
  late VitalSign vitalSign;
  List<VitalSign> vSigns = [];

  late ApiBuilderBloc bloc;

  @override
  void initState() {
    bloc = ApiBuilderBloc(path: 'get_Vital_Sign', query: {
      'user_id': widget.userId,
      //3158,
    });
    vitalSign = VitalSign(
      pulseRate: 0.0.toString(),
      admissionId: 0,
      id: 0,
      doctorId: int.parse(LocalStorage.getUID()),
      patientId: widget.userId,
      date:
          "${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}",
      time: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
      systolic: 0.0.toString(),
      height: 0.0.toString(),
      weight: 0.0.toString(),
      diastolic: 0.0.toString(),
      respiration: 0.0.toString(),
      saturation: 0.0.toString(),
      temperature: 0.0.toString(),
      preparedName: "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MDialog(
      title: Row(
        children: [
          const Text(Consts.VITAL_SIGN),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocProvider(
                  create: (context) => bloc..add(const Load()),
                  child: ApiBuilder<VitalSign>(
                    empty: Container(),
                    shrinkWrap: true,
                    fromJson: VitalSign.fromJsonFactory,
                    customBuilder: (data, load) {
                      print("ddddddddddd${data.length}");
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          vSigns.add(data[index]);
                          return VitalSignListItem(
                              data: data[index], bloc: bloc);
                        },
                        itemCount: data.length,
                      );
                    },
                  ),
                ),
                Divider(
                  endIndent: 6,
                  indent: 6,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  child: Text(
                    'Add Vital Sign',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                          child: MDateTimePicker(
                        end: DateTime(2100),
                        start: DateTime(2000),
                        label: 'Date',
                        initial: DateTime.now(),
                        onChanged: (v) {
                          date = v!;
                          print("${date.month}/${date.day}/${date.year}");
                          vitalSign = vitalSign.copyWith(
                              date: "${date.month}/${date.day}/${date.year}");
                        },
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: MTextField(
                        label: 'Time',
                        suffixIcon: GestureDetector(
                          child: Icon(FontAwesomeIcons.solidClock),
                          onTap: () {
                            _selectTime(context);
                            setState(() {});
                          },
                        ),
                        // value: "${selectedTime.hour}:${selectedTime.minute}",
                        controller: timecontroller
                          ..text =
                              "${selectedTime.hour}:${selectedTime.minute}",
                      )),
                    ],
                  ),
                ),
                MSlider(
                  value: double.parse(vitalSign.pulseRate.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(pulseRate: d.round().toString());
                    });
                  },
                  label: 'Pulse Rate',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '$d /min',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.systolic.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(systolic: d.round().toString());
                    });
                  },
                  label: 'Systolic Pressure',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}mm of Hg',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.diastolic.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(diastolic: d.round().toString());
                    });
                  },
                  label: 'Diastolic Pressure',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}mm of Hg',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.saturation.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(saturation: d.round().toString());
                    });
                  },
                  label: 'Saturation',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}%',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.temperature.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(temperature: d.round().toString());
                    });
                  },
                  label: 'Temperation',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}C',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.respiration.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(respiration: d.round().toString());
                    });
                  },
                  label: 'Respiration',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}/min',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.height.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(height: d.round().toString());
                    });
                  },
                  label: 'Height',
                  max: 300,
                  valueBuilder: (d) {
                    return Text(
                      '${d}cm',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                MSlider(
                  value: double.parse(vitalSign.weight.toString()),
                  onChanged: (d) {
                    setState(() {
                      vitalSign =
                          vitalSign.copyWith(weight: d.round().toString());
                    });
                  },
                  max: 300,
                  label: 'Weight',
                  valueBuilder: (d) {
                    return Text(
                      '${d}kg',
                      style: const TextStyle(
                          color: MTheme.THEME_COLOR,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: double.maxFinite,
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          child: const Text('View Chart'),
                          onPressed: () {
                            vSigns.length==0?
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text("Please add reading for the patients to to view charts"),
                                );
                              },
                            ):
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewChart(
                                          data: vSigns,
                                        )));
                            //context.popDialog();
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              side: BorderSide(color: MTheme.ICON_COLOR)),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: OutlinedButton(
                            child: const Text('Save'),
                            onPressed: () async {
                              if (vitalSign.weight == 0 ||
                                  vitalSign.height == 0 ||
                                  vitalSign.respiration == "0.0" ||
                                  vitalSign.temperature == "0.0" ||
                                  vitalSign.saturation == "0.0" ||
                                  vitalSign.diastolic == "0.0" ||
                                  vitalSign.systolic == "0.0" ||
                                  vitalSign.pulseRate == "0.0") {
                                alert(vitalSign);
                                //Navigator.of(context).pop();
                              } else {
                                print("SSSSSSSSSSS${vitalSign.toJson()}");
                                final call = Injector().apiService.get(
                                    path: 'save_Vital_Sign',
                                    query: vitalSign.toJson());
                                final res = await showWaitingDialog(
                                    context: context, call: call);
                                if (res?.body.message == "Saved SuccessFully") {
                                  print(
                                      "Saved SuccessFully:::::::::::::::::::::::::::::::: $res");
                                  bloc.add(const Refresh());
                                }

                                context.popDialog();
                              }
                              ;
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        if (kDebugMode) {
          print(timeOfDay.hour);
        }
        selectedTime = timeOfDay;
        timecontroller.text = "${selectedTime.hour}:${selectedTime.minute}";
        print("Time${timecontroller.text}");
        vitalSign = vitalSign.copyWith(
            time: "${selectedTime.hour}:${selectedTime.minute}");
      });
    }
  }

  alert(VitalSign vitalSign) {
    var alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      alignment: Alignment.center,
      content: Text(
          "Please make sure to enter ${vitalSign.pulseRate == "0.0" ? "Pulse Rate," : ""} ${vitalSign.systolic == "0.0" ? "Systolic Rate," : ""} ${vitalSign.diastolic == "0.0" ? "Diastolic Rate," : ""} ${vitalSign.saturation == "0.0" ? "Saturation Rate," : ""} ${vitalSign.temperature == "0.0" ? "Temperature Rate," : ""} ${vitalSign.respiration == "0.0" ? "Respiration Rate," : ""} ${vitalSign.height == "0.0" ? "Height Rate," : ""} ${vitalSign.weight == "0.0" ? "Weight Rate" : ""}"),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("OK"))
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ViewChart extends StatefulWidget {
  List<VitalSign> data;

  ViewChart({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewChart> createState() => _ViewChartState();
}

class _ViewChartState extends State<ViewChart> {
  List<String> chartlist = [
    'Saturation',
    "Diastolic",
    "Systolic",
    "Pulse rate",
    "Temperature",
    "Respiration"
  ];

  TextEditingController chartcontroller = TextEditingController();
  late List<FlSpot> Data1;
  @override
  void initState() {
    chartcontroller..text = "Saturation";
   Data1 = List.generate(widget.data.length, (index) {
      return FlSpot(
        index + 1.toDouble(),
        double.parse(widget.data[index].pulseRate.toString()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MScaffold(
      title: Text("Chart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MDropDown(
                items: chartlist,
                label: "View Chart",
                controller: chartcontroller,
                onChanged: (v) {
                  print(v);

                  switch (v) {
                    case "Saturation":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].saturation.toString()),
                        );
                      });}

                      break;

                    case "Diastolic":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].diastolic.toString()),
                        );
                      });}

                      break;

                    case "Systolic":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].systolic.toString()),
                        );
                      });}

                      break;

                    case "Pulse rate":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].pulseRate.toString()),
                        );
                      });}

                      break;
                    case "Temperature":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].temperature.toString()),
                        );
                      });}

                      break;
                    case "Respiration":
                      {Data1 = List.generate(widget.data.length, (index) {
                        return FlSpot(
                          index + 1.toDouble(),
                          double.parse(widget.data[index].respiration.toString()),
                        );
                      });}

                      break;
                    default:
                      print(' invalid entry');
                  }
                  setState(() {

                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                        barWidth: 3,
                        show: true,
                        color: Colors.green,
                        spots: Data1)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
