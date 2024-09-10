import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_editor.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../const/consts.dart';
import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/waiting_dialog.dart';
import '../../widgets/m_counter_field.dart';
import '../../widgets/m_dialog_down.dart';
import '../../widgets/m_scaffold.dart';
import '../../widgets/m_search_down.dart';
import '../../widgets/m_text_field.dart';

class PrescriptionEditPage extends StatefulWidget {
  final drugid,
      drugname,
      frequency,
      days,
      qty,
      foodrel,
      notes,
      doctorid,
      patientid,
      appointmentid,
      Epharmachy_Masterid,
      Prescription_id,
      numberofdrugsinprescription;

  const PrescriptionEditPage(
      {super.key,
      required this.drugid,
      required this.drugname,
      required this.frequency,
      required this.days,
      required this.qty,
      required this.foodrel,
      required this.notes,
      required this.doctorid,
      required this.patientid,
      required this.appointmentid,
      required this.Epharmachy_Masterid,
      required this.Prescription_id,
      required this.numberofdrugsinprescription});

  @override
  State<PrescriptionEditPage> createState() => _PrescriptionEditPageState();
}

class _PrescriptionEditPageState extends State<PrescriptionEditPage> {
  String? foodRel;
  Map<String, dynamic>? freq, drugName;
  int? days, qty, conuter = 0, numberofdrugsinprescriptioninsidestate;
  String? frequency;

  final ApiBuilderBloc frequencybloc = ApiBuilderBloc(path: 'PresFrequency');

  // final bloc = ApiBuilderBloc(path: 'SavedPresc', query: {
  //   'Appointment_id': '157194',
  // });

  final dummyDrugs = [
    'Melatonin',
    'Meftal',
    'Meloxicam',
    'Metformin',
    'Methotrexate',
    'Metoprolol',
  ];

  // final freqs = [
  //   "1-1-0-1",
  //   "1-0-0-1",
  //   "1-1-0-0",
  //   "1-0-0-0",
  //   "0-1-0-0",
  //   "0-0-1-0",
  //   "0-0-0-1",
  //   "1-1-1-1",
  //   "0-0-0-0",
  // ];
  //
  // final foodRels = [
  //   'Before Food',
  //   'After Food',
  //   'Intake/How to use',
  //   'Apply External',
  // ];

  TextEditingController drugController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    foodRel = widget.foodrel;
    frequency = widget.frequency;
    drugName = {
      "Drug_id": widget.drugid,
      "Drug_Name": widget.drugname,
      "p_id": 43791,
      "Fav_id": 0,
      "Available_Count": 0,
      "Given_Time": null,
      "Suggested_Flag": null,
      "Composition": '',
      "Manufacturer_name": null,
      "Drug_List": null
    };

    days = int.parse(widget.days);
    qty = int.parse(widget.qty);
    addNoteController.text = widget.notes;
    numberofdrugsinprescriptioninsidestate = widget.numberofdrugsinprescription;
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.PRESCRIPTION),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(children: [
            MSearchDown<Map<String, dynamic>>(
              controller: drugController..text = drugName!["Drug_Name"],
              label: 'Drug Name',
              hint: 'Search by Drug Name',
              labelKey: 'Drug_Name',
              suffixIcon: const Icon(CupertinoIcons.search),
              onSearched: (String d) async {
                print(d);
                final res = await Injector()
                    .apiService
                    .rawGet(path: 'GetTablet', query: {
                  'Doctor_id': LocalStorage.getUID(),
                  //'178936',
                  'term': d
                });
                List<Map<String, dynamic>> list = [];
                print("RES :::::::::::::::::::::::::::::::  ${res.bodyString}");
                if (res.isSuccessful) {
                  print("SUCCESS");

                  if (json.decode(res.bodyString) is List) {
                    print("res.bodyString is List");
                    for (var e in json.decode(res.bodyString) as List) {
                      list.add(e as Map<String, dynamic>);
                    }
                  }
                }
                return list;
              },
              onChanged: (d) {
                setState(() {
                  drugName = d;
                  print("DDDDDDDDDDDDRRRRRR$drugName");
                });
              },
            ),
            // MDialogDown<String>(
            //   label: 'Drug Name',
            //   items: dummyDrugs, value: drugName, onChanged: (d){
            //   setState((){
            //     drugName = d;
            //   });
            // },),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: MDialogDown<String>(
                    label: 'Frequency',
                    isExpanded: true,
                    // items: freqs,
                    items: Consts.freqs,
                    value: frequency ?? widget.frequency,
                    onChanged: (d) {
                      setState(() {
                        frequency = d;
                      });
                    },
                  ),
                ),
                // Expanded(
                //   child: BlocProvider(
                //     create: (_) => frequencybloc..add(const Load()),
                //     child: ApiBuilder(
                //       loading: const DropDownShimmer(
                //         label: 'Frequency',
                //       ),
                //       jsonBuilder: (data, load) {
                //         print("data:  $data");
                //         //return DropDownShimmer(label: 'Select Patient',);
                //         return MDialogDown<Map<String, dynamic>>(
                //             items: data,
                //             label: 'Frequency',
                //             onChanged: (d) {
                //               setState(() {
                //                 freq = d;
                //               });
                //             },
                //             value: freq,
                //             labelKey: 'Frequency_Name');
                //       },
                //     ),
                //   ),
                // ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: MCounterField(
                  key: ValueKey('days::$days'),
                  value: days ?? int.parse(widget.days),
                  onChanged: (d) {
                    setState(() {
                      days = d;
                    });
                  },
                  label: 'Days',
                ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: MCounterField(
                  key: ValueKey('qty::$qty'),
                  value: qty ?? int.parse(widget.qty),
                  onChanged: (d) {
                    setState(() {
                      qty = d;
                    });
                  },
                  label: 'Qty',
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: MDialogDown<String>(
                    label: 'Food Relation',
                    isExpanded: true,
                    // items: foodRels,
                    items: Consts.foodRels,
                    value: foodRel ?? widget.foodrel,
                    onChanged: (d) {
                      setState(() {
                        foodRel = d;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),

            MTextField(
              controller: addNoteController..text = widget.notes,
              label: 'Add Notes',
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      child: Text('Save'),
                      onPressed: () async {
                        // foodRel=foodRel??widget.foodrel;
                        // freq=freq??widget.frequency;
                        // drugName=drugName??widget.drugname;
                        // days=
                        print(
                            "Frequ::::::::::::::::::::::::::::::::::::::::::::::::::::$frequency");
                        if (foodRel == null ||
                            frequency == null ||
                            drugName == null ||
                            days == null ||
                            qty == null ||
                            addNoteController.text == null) {
                          showAlertDialog(context);
                        } else {
                          print(
                              "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS${widget.doctorid} ${frequency} ${widget.Prescription_id} ${qty} ${drugName} ${days} ${foodRel} ${widget.patientid} ${widget.appointmentid} ${widget.Epharmachy_Masterid} ${addNoteController.text}");
                          final call = Injector().apiService.rawGet(
                            path: 'SavePrescription',
                            query: {
                              'Doctor_id': widget.doctorid,
                              'Dos_Morning': frequency!.split('-')[0] == "1"
                                  ? "Full"
                                  : null,
                              'Dos_Afternoon': frequency!.split('-')[1] == "1"
                                  ? "Full"
                                  : null,
                              'Dos_Night': frequency!.split('-')[3] == "1"
                                  ? "Full"
                                  : null,
                              'Dos_Evening': frequency!.split('-')[2] == "1"
                                  ? "Full"
                                  : null,
                              'Prescription_id': widget.Prescription_id,
                              'Dosage': qty,
                              'Drug_id': drugName!['Drug_id'].toString(),
                              'DrugName': drugName!['Drug_Name'].toString(),
                              'Type_id': "0",
                              'Frequency': frequency,
                              'Duration': days,
                              'Instruction': foodRel,
                              'InstructionFood': addNoteController.text,
                              'Paitent_id': widget.patientid,
                              'Appointment_id': widget.appointmentid,
                              'Epharmachy_Masterid': widget.Epharmachy_Masterid,
                              'Morning': frequency!.split('-')[0],
                              'Evening': frequency!.split('-')[2],
                              'Afternoon': frequency!.split('-')[1],
                              'Night': frequency!.split('-')[3],
                              'MorningTime': "08:00:00",
                              'AfternoonTime': "13:00:00",
                              'EveningTime': "18:00:00",
                              'NightTime': "20:00:00",
                              'Doctor_Notes': addNoteController.text,
                            },
                          );
                          final res = await showWaitingDialog(
                              context: context, call: call);

                          if (res != null) {
                            print(
                                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res}");
                            context.pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrescriptionEditor(
                                        counter:
                                            numberofdrugsinprescriptioninsidestate ==
                                                    1
                                                ? 0
                                                : 1,
                                        Epharmachy_Masterid:
                                            widget.Epharmachy_Masterid,
                                      )),
                            );
                          } else {
                            print("Unable to save prescription");
                          }
                        }
                      },
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = Container(
      margin: const EdgeInsets.only(
          top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
      decoration: new BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 0.0, color: Colors.amber),
          borderRadius: BorderRadius.circular(12.0)),
      child: TextButton(
        child: Text("OK"),
        onPressed: () {
          context.pop();
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      alignment: Alignment.center,
      content: Text(
        "Please add a vaule to ${foodRel == null ? 'Food Relation,' : ''} ${freq == null ? 'Frequency,' : ''} ${drugName == null ? 'Drug Name,' : ''} ${days == null ? 'Days,' : ''} ${qty == null ? 'Quantity,' : ''} ${addNoteController.text == '' ? 'Add Notes' : ''} ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
