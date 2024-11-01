import 'dart:convert';
import 'dart:developer';

import 'package:chopper/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/pages/prescription/drug_list_item.dart';
import 'package:timesmedlite/ui/pages/prescription/template/save_template_dialog.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/inr_patient.dart';
import '../../../model/medical_record.dart';
import '../../../model/patient.dart';
import '../../../model/saved_presc.dart';
import '../../../model/user.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/waiting_dialog.dart';
import '../medical_record/prescription_print.dart';
import '../schedule/line_list_item.dart';

class PrescriptionEditor extends StatefulWidget {
  final patientid, doctorid, appointmentid, counter, Epharmachy_Masterid;
  List<ApiBuilderBloc>? appointmentids_for_when_returing_from_template_screen;

  PrescriptionEditor(
      {Key? key,
      this.patientid,
      this.doctorid,
      this.appointmentid,
      this.counter = 0,
      this.Epharmachy_Masterid,
      this.appointmentids_for_when_returing_from_template_screen})
      : super(key: key);

  // final bloc = ApiBuilderBloc(path: 'GetTablet',
  // query: {
  // 'Doctor_id':
  // LocalStorage.getUID()
  // '178936','term':'Dolo'
  // });

  @override
  State<PrescriptionEditor> createState() => _PrescriptionEditorState();
}

class _PrescriptionEditorState extends State<PrescriptionEditor> {
  late List<SavedPrescription> PresscriptionDrugList = [];
  String? foodRel;
  Map<String, dynamic>? freq, drugName, templist;
  int? days, qty, count;
  TextEditingController addNoteController = TextEditingController();
  int? Epharmachy_Masterid;

  final dummyDrugs = [
    'Melatonin',
    'Meftal',
    'Meloxicam',
    'Metformin',
    'Methotrexate',
    'Metoprolol',
  ];

  // final freqs = [
  //   '1-0-0-0',
  //   '1-1-0-0',
  //   '1-1-1-0',
  //   '1-0-1-0',
  //   '0-1-1-0',
  //   '1-0-0-1',
  // ];
  //
  // final foodRels = [
  //   'Before Food',
  //   'After Food',
  //   'With Food',
  //   'Apply External',
  //   'Before Bedtime',
  //   'On an Empty Stomach As Needed'
  // ];

  Map<String, dynamic>? template_list;

  late ApiBuilderBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = widget.counter;
    Epharmachy_Masterid = widget.Epharmachy_Masterid ?? 0;
    bloc = ApiBuilderBloc(path: 'SavedPresc', query: {
      'Appointment_id': widget.appointmentid,
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ApiBuilderBloc patientbloc = ApiBuilderBloc(
    //     path: 'PatientDetails',
    //     query: {
    //       'Patient_Id': widget.patientid,
    //     },
    //     raw: true);


    late  ApiBuilderBloc prescriptionBloc;
    prescriptionBloc = ApiBuilderBloc(
      path: 'GetDetails_By_AppId',
      query: {
        // 'user_id': widget.patientid,
        // //'user_id': 3158,
        // 'Doctor_id': widget.doctorid
        // //'Doctor_id': 38371
        'AppId': widget.appointmentid
      },
      //raw: true
    );
    final ApiBuilderBloc patientbloc = ApiBuilderBloc(
        path: 'VKAPatientProfile',
        query: {
          'PatientId': widget.patientid,
        },
        api2: true,
        raw: true);
    final ApiBuilderBloc templateListbloc = ApiBuilderBloc(
        path: 'SearchTemplateList',
        query: {
          "Doctor_id":
              //LocalStorage.getUser().id

              widget.doctorid
        },
        raw: true);
    final ApiBuilderBloc frequencybloc = ApiBuilderBloc(path: 'PresFrequency');

    return MScaffold(
      hero: false,
      title: const Text(Consts.DOCTOR_PRESCRIPTION),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocalStorage.isDoctor?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '  ${Consts.PRESCRIPTION}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  templateListbloc.data == []
                      ? BlocProvider(
                    create: (_) => templateListbloc..add(const Load()),
                    child: ApiBuilder(
                      loading: const DropDownShimmer(
                        label: 'Template',
                      ),
                      jsonBuilder: (data, load) {
                        print("data:  $data");
                        //return DropDownShimmer(label: 'Select Patient',);
                        return MDialogDown<Map<String, dynamic>>(
                            items: data,
                            label: 'Template',
                            onChanged: (d) {
                              setState(() {
                                print(
                                    "::::::::::::::::::::::::::::::::::::::::::::::::::::::data${d!['Appointment_id']}");
                                template_list = d;
                                bloc.add(UpdateQuery(
                                  {'Appointment_id': d['Appointment_id']},
                                ));
                                count = count! + 1;
                                // Navigator.pushReplacement(context,
                                //   MaterialPageRoute(builder: (context)=>PrescriptionEditor(counter: 1,Epharmachy_Masterid: widget.Epharmachy_Masterid,appointmentid:'157196', )),);
                              });
                            },
                            value: template_list,
                            labelKey: 'Template_Name');
                      },
                    ),
                  )
                      : Container(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MTextButton(
                          onPressed: () async {
                            Future<Response<ApiResponse>> call =
                            GetmasterPrescription();
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            if (res?.body.R != null) {
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res?.body.R}");
                              Epharmachy_Masterid = res?.body.R;
                              context.push(Routes.templateList, {
                                'patientID': widget.patientid,
                                'Epharmachy_Masterid': Epharmachy_Masterid,
                                'already_added_drugs_to_list':
                                PresscriptionDrugList,
                                'issaveExisting': false,
                              });
                            }
                          },
                          label: 'Template List',
                          icon: Icons.list_alt,
                        ),
                        MTextButton(
                          onPressed: () async {
                            print(
                                "PresscriptionDrugList:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$PresscriptionDrugList");
                            context.push(Routes.templateList, {
                              'patientID': widget.patientid,
                              'Epharmachy_Masterid': Epharmachy_Masterid,
                              'already_added_drugs_to_list': PresscriptionDrugList,
                              'issaveExisting': true,
                            });
                          },
                          label: 'Save Existing',
                          icon: Icons.save,
                        ),
                        MTextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (c) => SaveTemplateDialog(
                                Appointment_id: widget.appointmentid,
                              ),
                            );
                          },
                          label: 'Save New',
                          icon: Icons.save,
                        ),
                        MTextButton(
                          onPressed: () async {
                            print(
                                "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${PresscriptionDrugList.length}");
                            if(PresscriptionDrugList.length == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please add atleast 1 drug to prescription to preview the prescription')));
                            }else {
                             showWaitingDialog(context: context);
                              prescriptionBloc..add(const Load());
                              List<MedicalRecord> medicalRecord = [];
                              var res = await  Injector().timesmedService.get(path: 'GetDetails_By_AppId',query: {
                                'AppId' : widget.appointmentid
                              });
                              List<dynamic> data = res.body?.data;
                              medicalRecord = data.map((e) => MedicalRecord.fromJson(e)).toList();
                              print('The data oforiginal is ${medicalRecord}');

                              if(medicalRecord.isEmpty){
                                showMessage(context: context, message:'Please add atleast 1 drug to prescription to preview the prescription');
                               context.pop();
                                return;
                              }
                            //   List<MedicalRecord> data = await showDialog(context: context, builder: (c) =>  Dialog(
                            //     child: BlocProvider(
                            //     create: (_) => prescriptionBloc..add(const Load()),
                            //     child:ApiBuilder<MedicalRecord>(
                            //       fromJson: MedicalRecord.fromJsonFactory,
                            //       customBuilder: (data, load){
                            //         // print('this is data record ${data.prescription}');
                            //         // medicalRecord = data;
                            //         // log('this is mediconcal record ${medicalRecord.lab}');
                            //         context.pop(data);
                            //         return Container();
                            //       },
                            //     )
                            //     ),
                            //   ));
                            // medicalRecord = data[0];
                            // // log('The data oforiginal is ${data.prescription}');
                              Navigator.push(context,MaterialPageRoute(builder:(context)=> PrescriptionPrint(
                                orgData: medicalRecord[0] ?? const MedicalRecord(),
                                labTest: medicalRecord[0].lab=='' ?[] : medicalRecord[0].lab,
                                data: medicalRecord[0].prescription =='' ? [] : medicalRecord[0].prescription,
                                appId: widget.appointmentid.toString(),
                                docId: widget.doctorid.toString(),
                              )));
                              context.pop();

                            //   context.push(Routes.prescriptionPreview, {
                            //   /// bloc has been called as duplicate because when going context.pop the state and bloc gets closed so used duplicate
                            //   'patientbloc': patientbloc.duplicate(),
                            //   'PresscriptionDrugList': PresscriptionDrugList
                            // })
                            }
                          },
                          label: 'Preview',
                          icon: FontAwesomeIcons.solidFileLines,
                        ),
                      ],
                    ),
                  ),
                  widget.appointmentids_for_when_returing_from_template_screen ==
                      null
                      ? BlocProvider(
                    create: (c) => bloc..add(const Load()),
                    child: ApiBuilder<SavedPrescription>(
                      shrinkWrap: true,
                      empty: Container(),
                      fromJson: SavedPrescription.fromJsonFactory,
                      builder: (SavedPrescription data, int index) {
                        print("data ::::::::::::::::: ${data}");

                        PresscriptionDrugList.add(data);

                        return DrugListItem(
                          data: data,
                          doctorid: widget.doctorid,
                          patientid: widget.patientid,
                          appointmentid: widget.appointmentid,
                          Epharmachy_Masterid: Epharmachy_Masterid,
                          bloc: bloc,
                        );
                      },
                    ),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget
                        .appointmentids_for_when_returing_from_template_screen
                        ?.length,
                    itemBuilder: (c, i) {
                      return BlocProvider(
                        create: (c) => widget
                            .appointmentids_for_when_returing_from_template_screen![i]
                          ..add(const Load()),
                        child: ApiBuilder<SavedPrescription>(
                          direction: Axis.vertical,
                          shrinkWrap: true,
                          fromJson: SavedPrescription.fromJsonFactory,
                          builder: (SavedPrescription data, int index) {
                            print(
                                "data :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${data}");

                            PresscriptionDrugList.add(data);
                            return DrugListItem(
                              data: data,
                              doctorid: widget.doctorid,
                              patientid: widget.patientid,
                              appointmentid: widget.appointmentid,
                              Epharmachy_Masterid: Epharmachy_Masterid,
                              bloc: widget
                                  .appointmentids_for_when_returing_from_template_screen![i],
                            );
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                  // const MTextField(
                  //   label: 'Doctor Notes',
                  //   maxLines: 5,
                  //   minLines: 3,
                  // ),
                  Container(
                      width: double.maxFinite,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: OutlinedButton(
                        onPressed: () {
                          print(
                              "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${PresscriptionDrugList.length}");
                          PresscriptionDrugList.length == 0
                              ? {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please add atleast 1 drug to prescription to send the prescription')))
                          }
                              : context.pop();
                        },
                        child: const Text('Send Prescription'),
                      ))
                ],
              ): Container(),
              LocalStorage.isDoctor? const Divider(
                indent: 0,
                endIndent: 0,
                height: 32,
              ): Container(),
              Text(
                '  Add Prescription',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              MSearchDown<Map<String, dynamic>>(
                label: 'Drug Name',
                hint: 'Search by Drug Name',
                labelKey: 'Drug_Name',
                suffixIcon: const Icon(CupertinoIcons.search),
                onSearched: (String d) async {
                  print(d);
                  final res = await Injector()
                      .apiService
                      .rawGet(path: 'GetTablet', query: {
                    'Doctor_id': widget.doctorid,
                    //'178936',
                    'term': d
                  });
                  List<Map<String, dynamic>> list = [];
                  print(
                      "RES :::::::::::::::::::::::::::::::  ${res.bodyString}");
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
                    child: BlocProvider(
                      create: (_) => frequencybloc..add(const Load()),
                      child: ApiBuilder(
                        loading: const DropDownShimmer(
                          label: 'Frequency',
                        ),
                        jsonBuilder: (data, load) {
                          print("data:  $data");
                          //return DropDownShimmer(label: 'Select Patient',);
                          return MDialogDown<Map<String, dynamic>>(
                              items: data,
                              label: 'Frequency',
                              onChanged: (d) {
                                setState(() {
                                  print(
                                      "::::::::::::::::::::::::::::::::::::::::::::::::::::::$d");
                                  freq = d;
                                });
                              },
                              value: freq,
                              labelKey: 'Frequency_Name');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: MCounterField(
                    key: ValueKey('days::$days'),
                    value: days,
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
                    value: qty,
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
                      value: foodRel,
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
                controller: addNoteController,
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
                      onPressed: () {
                        setState(() {
                          foodRel = null;
                          freq = null;
                          drugName = {"Drug_Name": ""};
                          days = qty = null;
                          addNoteController.clear();
                        });
                      },
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                          Theme.of(context).outlinedButtonTheme.style?.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        print(
                            "FFFFFFFFFFFFREEEEEEEEQQQ${freq!["Frequency_Name"].toString().split('-')[0]}");
                        print(
                            "DDDDDDDDDDDDDDDDDDDDDDDDDDDD${drugName!['Drug_Name'].toString() + drugName!['Drug_id'].toString()}");

                        if (foodRel == null ||
                            freq == null ||
                            drugName == null ||
                            days == null ||
                            qty == null ||
                            addNoteController.text == null) {
                          showAlertDialog(context);
                        } else {
                          if (widget.counter == 0) {
                            Future<Response<ApiResponse>> call =
                                GetmasterPrescription();
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            if (res?.body.R != null) {
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res?.body.R}");
                              Epharmachy_Masterid = res?.body.R;
                              print(
                                  "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE$Epharmachy_Masterid");

                              final call1 = Injector().apiService.rawGet(
                                path: 'SavePrescription',
                                query: {
                                  'Doctor_id': widget.doctorid,
                                  'Dos_Morning': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[0] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Afternoon': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[1] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Night': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[3] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Evening': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[2] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Prescription_id': '0',
                                  'Dosage': qty,
                                  'Drug_id': drugName!['Drug_id'].toString(),
                                  'DrugName': drugName!['Drug_Name'].toString(),
                                  'Type_id': "0",
                                  'Frequency':
                                      freq!["Frequency_Name"].toString(),
                                  'Duration': days,
                                  'Instruction': foodRel,
                                  'InstructionFood': addNoteController.text,
                                  'Paitent_id': widget.patientid,
                                  'Appointment_id': widget.appointmentid,
                                  'Epharmachy_Masterid': Epharmachy_Masterid,
                                  'Morning': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[0],
                                  'Evening': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[2],
                                  'Afternoon': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[1],
                                  'Night': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[3],
                                  'MorningTime': "08:00:00",
                                  'AfternoonTime': "13:00:00",
                                  'EveningTime': "18:00:00",
                                  'NightTime': "20:00:00",
                                  'Doctor_Notes': addNoteController.text,
                                },
                              );
                              final res1 = await showWaitingDialog(
                                  context: context, call: call1);
                              if (res1 != null) {
                                print(
                                    ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res1}");
                                setState(() {
                                  foodRel = null;
                                  freq = null;
                                  drugName = {"Drug_Name": ""};
                                  days = qty = null;
                                  addNoteController.clear();
                                  var appoiID = widget.appointmentid;
                                  bloc.add(UpdateQuery(
                                    {'Appointment_id': appoiID},
                                  ));
                                });
                              } else {
                                print("Unable to save prescription");
                              }
                            }
                            setState(() {
                              count = (count! + 1);
                            });
                          } else {
                            print("API called in without calling epharma id");
                            if (foodRel == null ||
                                freq == null ||
                                drugName == null ||
                                days == null ||
                                qty == null ||
                                addNoteController.text == null) {
                              showAlertDialog(context);
                            } else {
                              final call1 = Injector().apiService.get(
                                path: 'SavePrescription',
                                query: {
                                  'Doctor_id': widget.doctorid,
                                  'Dos_Morning': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[0] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Afternoon': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[1] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Night': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[3] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Dos_Evening': freq!["Frequency_Name"]
                                              .toString()
                                              .split('-')[2] ==
                                          "1"
                                      ? "Full"
                                      : null,
                                  'Prescription_id': '0',
                                  'Dosage': qty,
                                  'Drug_id': drugName!['Drug_id'].toString(),
                                  'DrugName': drugName!['Drug_Name'].toString(),
                                  'Type_id': "0",
                                  'Frequency':
                                      freq!["Frequency_Name"].toString(),
                                  'Duration': days,
                                  'Instruction': foodRel,
                                  'InstructionFood': addNoteController.text,
                                  'Paitent_id': widget.patientid,
                                  'Appointment_id': widget.appointmentid,
                                  'Epharmachy_Masterid': Epharmachy_Masterid,
                                  'Morning': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[0],
                                  'Evening': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[2],
                                  'Afternoon': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[1],
                                  'Night': freq!["Frequency_Name"]
                                      .toString()
                                      .split('-')[3],
                                  'MorningTime': "08:00:00",
                                  'AfternoonTime': "13:00:00",
                                  'EveningTime': "18:00:00",
                                  'NightTime': "20:00:00",
                                  'Doctor_Notes': addNoteController.text,
                                },
                              );
                              final res1 = await showWaitingDialog(
                                  context: context, call: call1);
                              if (res1 != null) {
                                print(
                                    ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res1}");
                                setState(() {
                                  foodRel = null;
                                  freq = null;
                                  drugName = {"Drug_Name": ""};
                                  days = qty = null;
                                  addNoteController.clear();
                                  var appoiID = widget.appointmentid;
                                  bloc.add(UpdateQuery(
                                    {'Appointment_id': appoiID},
                                  ));
                                });
                              } else {
                                print("Unable to save prescription");
                              }
                            }
                          }
                        }
                      },
                      child: const Text('Add Drug'),
                    )),
                  ],
                ),
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                height: 32,
              ),
            !LocalStorage.isDoctor?  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '  ${Consts.PRESCRIPTION}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  templateListbloc.data == []
                      ? BlocProvider(
                    create: (_) => templateListbloc..add(const Load()),
                    child: ApiBuilder(
                      loading: const DropDownShimmer(
                        label: 'Template',
                      ),
                      jsonBuilder: (data, load) {
                        print("data:  $data");
                        //return DropDownShimmer(label: 'Select Patient',);
                        return MDialogDown<Map<String, dynamic>>(
                            items: data,
                            label: 'Template',
                            onChanged: (d) {
                              setState(() {
                                print(
                                    "::::::::::::::::::::::::::::::::::::::::::::::::::::::data${d!['Appointment_id']}");
                                template_list = d;
                                bloc.add(UpdateQuery(
                                  {'Appointment_id': d['Appointment_id']},
                                ));
                                count = count! + 1;
                                // Navigator.pushReplacement(context,
                                //   MaterialPageRoute(builder: (context)=>PrescriptionEditor(counter: 1,Epharmachy_Masterid: widget.Epharmachy_Masterid,appointmentid:'157196', )),);
                              });
                            },
                            value: template_list,
                            labelKey: 'Template_Name');
                      },
                    ),
                  )
                      : Container(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MTextButton(
                          onPressed: () async {
                            Future<Response<ApiResponse>> call =
                            GetmasterPrescription();
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            if (res?.body.R != null) {
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res?.body.R}");
                              Epharmachy_Masterid = res?.body.R;
                              context.push(Routes.templateList, {
                                'patientID': widget.patientid,
                                'Epharmachy_Masterid': Epharmachy_Masterid,
                                'already_added_drugs_to_list':
                                PresscriptionDrugList,
                                'issaveExisting': false,
                              });
                            }
                          },
                          label: 'Template List',
                          icon: Icons.list_alt,
                        ),
                        MTextButton(
                          onPressed: () async {
                            print(
                                "PresscriptionDrugList:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$PresscriptionDrugList");
                            context.push(Routes.templateList, {
                              'patientID': widget.patientid,
                              'Epharmachy_Masterid': Epharmachy_Masterid,
                              'already_added_drugs_to_list': PresscriptionDrugList,
                              'issaveExisting': true,
                            });
                          },
                          label: 'Save Existing',
                          icon: Icons.save,
                        ),
                        MTextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (c) => SaveTemplateDialog(
                                Appointment_id: widget.appointmentid,
                              ),
                            );
                          },
                          label: 'Save New',
                          icon: Icons.save,
                        ),
                        MTextButton(
                          onPressed: () {
                            print(
                                "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${PresscriptionDrugList.length}");
                            PresscriptionDrugList.length == 0
                                ? {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please add atleast 1 drug to prescription to preview the prescription')))
                            }
                                : context.push(Routes.prescriptionPreview, {
                              /// bloc has been called as duplicate because when going context.pop the state and bloc gets closed so used duplicate
                              'patientbloc': patientbloc.duplicate(),
                              'PresscriptionDrugList': PresscriptionDrugList
                            });
                          },
                          label: 'Preview',
                          icon: FontAwesomeIcons.solidFileLines,
                        ),
                      ],
                    ),
                  ),
                  widget.appointmentids_for_when_returing_from_template_screen ==
                      null
                      ? BlocProvider(
                    create: (c) => bloc..add(const Load()),
                    child: ApiBuilder<SavedPrescription>(
                      shrinkWrap: true,
                      empty: Container(),
                      fromJson: SavedPrescription.fromJsonFactory,
                      builder: (SavedPrescription data, int index) {
                        print("data ::::::::::::::::: ${data}");

                        PresscriptionDrugList.add(data);

                        return DrugListItem(
                          data: data,
                          doctorid: widget.doctorid,
                          patientid: widget.patientid,
                          appointmentid: widget.appointmentid,
                          Epharmachy_Masterid: Epharmachy_Masterid,
                          bloc: bloc,
                        );
                      },
                    ),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget
                        .appointmentids_for_when_returing_from_template_screen
                        ?.length,
                    itemBuilder: (c, i) {
                      return BlocProvider(
                        create: (c) => widget
                            .appointmentids_for_when_returing_from_template_screen![i]
                          ..add(const Load()),
                        child: ApiBuilder<SavedPrescription>(
                          direction: Axis.vertical,
                          shrinkWrap: true,
                          fromJson: SavedPrescription.fromJsonFactory,
                          builder: (SavedPrescription data, int index) {
                            print(
                                "data :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${data}");

                            PresscriptionDrugList.add(data);
                            return DrugListItem(
                              data: data,
                              doctorid: widget.doctorid,
                              patientid: widget.patientid,
                              appointmentid: widget.appointmentid,
                              Epharmachy_Masterid: Epharmachy_Masterid,
                              bloc: widget
                                  .appointmentids_for_when_returing_from_template_screen![i],
                            );
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                  // const MTextField(
                  //   label: 'Doctor Notes',
                  //   maxLines: 5,
                  //   minLines: 3,
                  // ),
                  Container(
                      width: double.maxFinite,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: OutlinedButton(
                        onPressed: () {
                          print(
                              "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${PresscriptionDrugList.length}");
                          PresscriptionDrugList.length == 0
                              ? {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please add atleast 1 drug to prescription to send the prescription')))
                          }
                              : context.pop();
                        },
                        child: const Text('Send Prescription'),
                      ))
                ],
              ): Container(),
            ],
          ),
        ),
      ),
      //   },
      // ),

      // )
    );
  }

  Future<Response<ApiResponse>> GetmasterPrescription() {
    final call =
        Injector().apiService.get(path: 'SavePrescriptionMaster', query: {
      'Paitent_id': widget.patientid,
      'Doctor_id': widget.doctorid,
      'Type_id': "1",
      'Disease_id': "0",
      'Appointment_id': widget.appointmentid,
      'Template_Flag': 'N',
      'Admission_id': "0",
      'Doctor_Notes': addNoteController.text,
      'Prescription_Request_Type': 'Normal',
    });
    return call;
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = Container(
      margin: const EdgeInsets.only(
          top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 0.0, color: Colors.amber),
          borderRadius: BorderRadius.circular(12.0)),
      child: TextButton(
        child: const Text("OK"),
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
        "Please add a value to ${foodRel == null ? 'Food Relation,' : ''} ${freq == null ? 'Frequency,' : ''} ${drugName == null ? 'Drug Name,' : ''} ${days == null ? 'Days,' : ''} ${qty == null ? 'Quantity,' : ''} ${addNoteController.text == '' ? 'Add Notes' : ''} ",
        style: const TextStyle(fontWeight: FontWeight.bold),
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
