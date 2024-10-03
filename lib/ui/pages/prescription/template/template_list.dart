import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_editor.dart';
import 'package:timesmedlite/ui/pages/prescription/template/single_template_view_page.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../model/saved_presc.dart';
import '../../../../utils/local_storage.dart';
import '../../../components/api_builder/api_builder.dart';
import '../../../components/api_builder/api_builder_bloc.dart';
import '../../../components/shimmer/drop_down_shimmer.dart';
import '../../../components/user_info.dart';
import '../../../components/waiting_dialog.dart';
import '../../../theme/theme.dart';

import 'template_list_item.dart';

class TemplateList extends StatefulWidget {
  final bool issaveExisting;
  final List<SavedPrescription> already_added_drugs_to_list;
  final Epharmachy_Masterid;
  final patientID;

  const TemplateList(
      {Key? key,
      required this.patientID,
      required this.Epharmachy_Masterid,
      required this.already_added_drugs_to_list,
      required this.issaveExisting})
      : super(key: key);

  @override
  State<TemplateList> createState() => _TemplateListState();
}

class _TemplateListState extends State<TemplateList> {
  List<ApiBuilderBloc> template_selected_list_of_blocs = [];
  late List<bool> selected = List<bool>.generate(50, (i) => false);
  List appoontmentids = [];
  var data_from_template_list;
  Map<String, dynamic>? template_list;

  @override
  Widget build(BuildContext context) {
    print(
        "widget.already_added_drugs_to_list:::::::::::::::::::::::::::::::::::::::::${widget.already_added_drugs_to_list.length}");
    final ApiBuilderBloc templateListbloc = ApiBuilderBloc(
        path: 'SearchTemplateList',
        query: {
          "Doctor_id": LocalStorage.getUID()
          // "Doctor_id": "37941",
        },
        raw: true);

    //print("Doctor_id::::::::::::::::::::::::::::::::::::::::::::::::${LocalStorage.getUser().id}");
    return MScaffold(
      title: Text(Consts.TEMPLATE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            // MTextField(
            //   label: 'Search by Template Name',
            //   suffixIcon: Icon(CupertinoIcons.search),
            // ),
            Container(
              child: Expanded(
                child: BlocProvider(
                  create: (_) => templateListbloc..add(const Load()),
                  child: ApiBuilder(
                    jsonBuilder: (data, load) {
                      data_from_template_list = data;
                      print(
                          "data::::::::::::::::::::::::::::::::::::::::::::  ${data}");
                      return MListTile(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (c, ind) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Theme.of(context).dividerColor))),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Checkbox(
                                            value: selected[ind],
                                            onChanged: (d) {
                                              setState(() {
                                                selected[ind] = d!;

                                                ///code below can be used if only one template selection is allowed
                                                // if(selected[ind]==true)
                                                // {
                                                //   for(int i=0;i<data.length;i++)
                                                //   {
                                                //     if(i!=ind){
                                                //       selected[i]=false;
                                                //     }
                                                //   }
                                                //  }
                                              });
                                              print(
                                                  "SSSSSS::::::::::::: $selected");
                                            }),
                                      ),
                                      Container(
                                        height: 56,
                                        width: 0.7,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  data[ind]["Template_Name"]
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(fontSize: 14),
                                                )),
                                                Container(
                                                  height: 16,
                                                  width: 0.7,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                ),
                                                Expanded(
                                                    child: UserInfo(
                                                  Info.custom,
                                                  lable: data[ind]
                                                          ["Insert_Date"]
                                                      .toString(),
                                                  icon: Icons.date_range,
                                                  textColor: MTheme.THEME_COLOR,
                                                ))
                                              ],
                                            ),
                                            Text(
                                              data[ind]["Description"]
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )),
                                      Container(
                                        height: 56,
                                        width: 0.7,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: MIconButton(
                                          child: const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: MTheme.THEME_COLOR,
                                            size: 20,
                                          ),
                                          color: MTheme.THEME_COLOR,
                                          padding: const EdgeInsets.all(4),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (c) =>
                                                    SingleTempalteViewDialog(
                                                      appointment_id_for_this_template:
                                                          data[ind][
                                                              "Appointment_id"],
                                                      //'157196',
                                                      Template_Name: data[ind]
                                                              ["Template_Name"]
                                                          .toString(),
                                                      Description: data[ind]
                                                              ["Description"]
                                                          .toString(),
                                                    ));
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
            // TemplateListItem(doctor_id: "37941",Epharmachy_Masterid: Epharmachy_Masterid,)
            // BlocProvider(
            //     create: (_)=>templateListbloc..add(const Load()),
            //   child: ApiBuilder(
            //     jsonBuilder: (data, load) {
            //       print("data::::::::::::::::::::::::::::::::::::::::::::  ${data}");
            //       return TemplateListItem(Template_Name: data[index]["Template_Name"],Description: data[index]["Description"],Insert_Date: data[index]["Insert_Date"],list_item_index: index,total_number_templates: data.length,);
            //     },
            //   ),
            //
            //   ) ,
          ],
        ),
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            !widget.issaveExisting
                ? Expanded(
                    child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        Theme.of(context).outlinedButtonTheme.style?.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                  ))
                : Container(),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: OutlinedButton(
              onPressed: () async {
                print(
                    "TTTTTTTTTTTTS${selected.where((check) => check == true).length}");

                for (int j = 0; j < data_from_template_list.length; j++) {
                  selected[j] == true
                      ? appoontmentids
                          .add(data_from_template_list[j]["Appointment_id"])

                      //data[j]["Appointment_id"].toString();
                      : print("");
                }

                ///for testing if this feature is working in prescription editor page
                appoontmentids = ['157196', '157194'];
                for (int k = 0; k < appoontmentids.length; k++) {
                  final bloc = ApiBuilderBloc(path: 'SavedPresc', query: {
                    'Appointment_id': appoontmentids[k],
                  });

                  template_selected_list_of_blocs.add(bloc);
                }

                if (widget.issaveExisting) {
                  var counter = 0;
                  for (int j = 0;
                      j < widget.already_added_drugs_to_list.length;
                      j++) {
                    for (int k = 0;
                        k <
                            widget.already_added_drugs_to_list[j].ListPresc!
                                .length;
                        k++) {
                      print(
                          "widget.already_added_drugs_to_list:::::::::::::::::::::::::::::::::::::::::${widget.already_added_drugs_to_list[j].ListPresc![k].Drug_Name}");
                      // print("Number_of_time_this_looped::::::::::::::::::::::::::::::::::::::::${++counter}");
                      for (int p = 0; p < appoontmentids.length; p++) {
                        print(
                            "Number_of_time_this_looped::::::::::::::::::::::::::::::::::::::::${++counter}");
                        print(
                            "Number_of_time_this_looped::::::::::::::::::::::::::::::::::::::::");
                        final call1 = Injector().apiService.rawGet(
                          path: 'SavePrescription',
                          query: {
                            //'Doctor_id': "178936",
                            'Doctor_id': '${LocalStorage.getUID()}',
                            'Dos_Morning': widget.already_added_drugs_to_list[j]
                                        .ListPresc![k].Frequency
                                        .toString()
                                        .split('-')[0] ==
                                    "1"
                                ? "Full"
                                : null,
                            'Dos_Afternoon': widget
                                        .already_added_drugs_to_list[j]
                                        .ListPresc![k]
                                        .Frequency
                                        .toString()
                                        .split('-')[1] ==
                                    "1"
                                ? "Full"
                                : null,
                            'Dos_Night': widget.already_added_drugs_to_list[j]
                                        .ListPresc![k].Frequency
                                        .toString()
                                        .split('-')[3] ==
                                    "1"
                                ? "Full"
                                : null,
                            'Dos_Evening': widget.already_added_drugs_to_list[j]
                                        .ListPresc![k].Frequency
                                        .toString()
                                        .split('-')[2] ==
                                    "1"
                                ? "Full"
                                : null,
                            'Prescription_id': '0',
                            'Dosage': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].dosage
                                .toString(),
                            'Drug_id': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Drug_id
                                .toString(),
                            'DrugName': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Drug_Name
                                .toString(),
                            'Type_id': "0",
                            'Frequency': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Frequency,
                            'Duration': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Days,
                            'Instruction': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Instruction,
                            'InstructionFood': '',
                            'Paitent_id': widget.patientID,
                            'Appointment_id': appoontmentids[p],
                            'Epharmachy_Masterid': widget.Epharmachy_Masterid,
                            'Morning': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Frequency
                                .toString()
                                .split('-')[0],
                            'Evening': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Frequency
                                .toString()
                                .split('-')[2],
                            'Afternoon': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Frequency
                                .toString()
                                .split('-')[1],
                            'Night': widget.already_added_drugs_to_list[j]
                                .ListPresc![k].Frequency
                                .toString()
                                .split('-')[3],
                            'MorningTime': "08:00:00",
                            'AfternoonTime': "13:00:00",
                            'EveningTime': "18:00:00",
                            'NightTime': "20:00:00",
                            'Doctor_Notes': '',
                          },
                        );
                        final res1 = await showWaitingDialog(
                            context: context, call: call1);
                        if (res1 != null) {
                          print(
                              ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res1}");
                        }
                      }
                    }
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Drugs have been added to the Saved Templates'),
                  ));
                }
                print("AAAPPPPPP:::::::::::::::$appoontmentids");
                print("AAAPPPPPP:::::::::::::::${widget.issaveExisting}");
                print(
                    ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${widget.Epharmachy_Masterid}");
                print(
                    ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${widget.already_added_drugs_to_list}");
                print(
                    "AAAPPPPPPadfasdfasdf:::::::::::::::$template_selected_list_of_blocs");

                context.pop();
                widget.issaveExisting != true
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrescriptionEditor(
                                  counter: 1,
                                  Epharmachy_Masterid:
                                      widget.Epharmachy_Masterid,
                                  appointmentids_for_when_returing_from_template_screen:
                                      template_selected_list_of_blocs,
                                )),
                      )
                    : null;
              },
              child: Text(widget.issaveExisting ? 'Save Existing' : 'Select'),
            )),
          ],
        ),
      ),
    );
  }
}
