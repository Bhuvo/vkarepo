import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_editor.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../../utils/local_storage.dart';
import '../../../components/api_builder/api_builder.dart';
import '../../../components/api_builder/api_builder_bloc.dart';


class TemplateListItem extends StatefulWidget {
  final Epharmachy_Masterid;
  final doctor_id;

  TemplateListItem({
    Key? key,
    required this.doctor_id,
    required this.Epharmachy_Masterid,
  }) : super(key: key);

  @override
  State<TemplateListItem> createState() => _TemplateListItemState();
}

class _TemplateListItemState extends State<TemplateListItem> {
  late List<bool> selected = List<bool>.generate(50, (i) => false);

  @override
  Widget build(BuildContext context) {
    final ApiBuilderBloc templateListbloc = ApiBuilderBloc(
        path: 'SearchTemplateList',
        query: {
          "Doctor_id":  widget.doctor_id

             // "37941"
        },
        raw: true);
    return BlocProvider(
      create: (_) => templateListbloc..add(const Load()),
      child: ApiBuilder(
        jsonBuilder: (data, load) {
          print("data::::::::::::::::::::::::::::::::::::::::::::  ${data}");
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
                              color: Theme.of(context).dividerColor))),
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
                                  print("SSSSSS::::::::::::: $selected");
                                }),
                          ),
                          Container(
                            height: 56,
                            width: 0.7,
                            color: Theme.of(context).dividerColor,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      data[ind]["Template_Name"].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(fontSize: 14),
                                    )),
                                    Container(
                                      height: 16,
                                      width: 0.7,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    Expanded(
                                        child: UserInfo(
                                      Info.custom,
                                      lable:
                                          data[ind]["Insert_Date"].toString(),
                                      icon: Icons.date_range,
                                      textColor: MTheme.THEME_COLOR,
                                    ))
                                  ],
                                ),
                                Text(
                                  data[ind]["Description"].toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: MIconButton(
                              child: const Icon(
                                Icons.remove_red_eye_sharp,
                                color: MTheme.THEME_COLOR,
                                size: 20,
                              ),
                              color: MTheme.THEME_COLOR,
                              padding: const EdgeInsets.all(4),
                              onTap: () async {
                                print(
                                    "TTTTTTTTTTTTS${selected.where((check) => check == true).length}");
                                List appoontmentids = [];
                                for (int j = 0; j < data.length; j++) {
                                  selected[j] == true
                                      ? appoontmentids
                                          .add(data[j]["Appointment_id"])

                                      //data[j]["Appointment_id"].toString();
                                      : print("");
                                }
                                print("AAAPPPPPP:::::::::::::::$appoontmentids");
                                context.pop();
                                Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context)=>PrescriptionEditor(counter: 1,Epharmachy_Masterid: widget.Epharmachy_Masterid,appointmentid: data[ind]["Appointment_id"]
                                    ,)),);
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
    );
  }
}
