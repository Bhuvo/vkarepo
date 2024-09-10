import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/components/content_view.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/vital_sign.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class VitalSignListItem extends StatelessWidget {
  VitalSign data;
  ApiBuilderBloc bloc;
   VitalSignListItem({Key? key,required this.data,required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
        padding: const EdgeInsets.symmetric( vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 16,),
                UserInfo(
                  Info.custom,
                  icon: FontAwesomeIcons.calendar,
                  lable: data.date.toString(),
                  textColor: MTheme.THEME_COLOR,
                ),
                Expanded(
                    child: UserInfo(
                  Info.custom,
                  icon: FontAwesomeIcons.clock,
                  lable: data.time.toString(),
                  textColor: MTheme.THEME_COLOR,
                )),
                // MIconButton(
                //   child: Icon(
                //     Icons.edit,
                //     color: MTheme.THEME_COLOR,
                //   ),
                //   color: MTheme.THEME_COLOR,
                //   padding: EdgeInsets.all(4),
                // ),
                // const SizedBox(
                //   width: 8,
                // ),
                MIconButton(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.all(4),
                  onTap: ()async{
                    final call = Injector().apiService.get(
                        path: 'delete_Vital_Sign',
                        query: {
                          'id':data.id ,
                        });
                    final res = await showWaitingDialog(
                        context: context, call: call);
                    if (res?.body.message == "Deleted") {
                      print(
                          "Deleted:::::::::::::::::::::::::::::::: $res");
                      bloc.add(const Refresh());
                      //Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            Divider(
              endIndent: 0,
              indent: 0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Wrap(
                children: [
                  ContentView2(label: 'Pulse', content: data.pulseRate.toString(), icon: FontAwesomeIcons.heartPulse, ),
                  ContentView2(label: 'Temperature', content: data.temperature.toString(), icon: FontAwesomeIcons.temperatureHigh, ),
                  ContentView2(label: 'Height', content: data.height.toString(), icon: FontAwesomeIcons.personArrowUpFromLine, ),
                  ContentView2(label: 'Respiration', content: data.respiration.toString(), icon: FontAwesomeIcons.heartPulse, ),
                  ContentView2(label: 'Weight', content:data.weight.toString(), icon: FontAwesomeIcons.weightScale, ),
                ],
              ),
            ),
            Divider(
              endIndent: 0,
              indent: 0,
            ),
            MTextContent2(head: 'Prepared by:', content: data.preparedName.toString())
          ],
        ));
  }
}
