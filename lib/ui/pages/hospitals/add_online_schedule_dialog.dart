import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/pages/hospitals/follow_up_fee_item.dart';
import 'package:timesmedlite/ui/pages/hospitals/schedule_time_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_phone_field.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../widgets/m_date_picker_text_field.dart';

class AddOnlineScheduleDialog extends StatefulWidget {
  ApiBuilderBloc bloc;
  String DocID;

  AddOnlineScheduleDialog({Key? key, required this.bloc, required this.DocID}) : super(key: key);

  @override
  State<AddOnlineScheduleDialog> createState() =>
      _AddOnlineScheduleDialogState();
}

class _AddOnlineScheduleDialogState extends State<AddOnlineScheduleDialog> {
  List<String> selDay = [];
  List<String> selDays = [];

  var Day;
  var Days;

  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MDialog(
      title: Row(
        children: [
          const Expanded(child: Text('ADD ONLINE CONSULTATION SCHEDULE LIST')),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MMultiSelect<String>(
              itemWidth: context.getWPercent(20),
              items: Consts.daysOfWeek
                  .map((e) => MMultiSelectItem(value: e, label: e))
                  .toList(),
              value: selDay,
              onChanged: (d) {
                setState(() {
                  selDay = d;
                });
              },
              label: 'Available Days',
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: DateTimePickerTextField(
                  controller: fromTime,
                  LabelText: 'From Time',
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: DateTimePickerTextField(
                        controller: toTime, LabelText: 'To Time')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '(24 Hrs Format)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.red, fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: OutlinedButton(
                child: const Text('Add'),
                onPressed: () async {
                  for (int i = 0; i < selDay.length; i++) {
                    switch (selDay[i]) {
                      case Consts.MON:
                        selDays.add('1');
                        break;
                      case Consts.TUE:
                        selDays.add('2');
                        break;
                      case Consts.WED:
                        selDays.add('3');
                        break;
                      case Consts.THU:
                        selDays.add('4');
                        break;
                      case Consts.FRI:
                        selDays.add('5');
                        break;
                      case Consts.SAT:
                        selDays.add('6');
                        break;
                      case Consts.SUN:
                        selDays.add('7');
                        break;
                    }
                  }

                  for (int i = 0; i < selDay.length; i++) {
                    if (i == 0) {
                      Day = '${selDay[i]},';
                      Days = '${selDays[i]},';
                    } else if (i == (selDay.length - 1)) {
                      Day = '$Day${selDay[i]}';
                      Days = '$Days${selDays[i]}';
                    } else {
                      Day = '$Day${selDay[i]},';
                      Days = '$Days${selDays[i]},';
                    }
                  }
                  // print("AAAAAAAA${selDays}");
                      {
                    DateTime tempDate = DateFormat("HH:mm a").parse(fromTime.text.toString());
                    String fromdate = DateFormat("hh:mm").format(tempDate);
                    print("${fromTime.text[0]}${fromTime.text[1]}${fromTime.text[2]}${fromTime.text[3]}${fromTime.text[4]}");
                  }
                  print(
                      "0, ${LocalStorage.getUID()}, ${fromTime} ${toTime.text.toString()} ${Day.toString()} ${Days.toString()} ");
                  if (fromTime.text.toString() == '' ||
                      toTime.text.toString() == '' ||
                      Days.toString() == null ||
                      Day.toString() == null) {
                    alert();
                  } else {


                    showWaitingDialog(context: context);
                    final res = await Injector()
                        .apiService
                        .post2(path: 'AddOnlineTiming', query: {
                      "FromTime": "${fromTime.text[0]}${fromTime.text[1]}${fromTime.text[2]}${fromTime.text[3]}${fromTime.text[4]}",
                      "ToTime": "${toTime.text[0]}${toTime.text[1]}${toTime.text[2]}${toTime.text[3]}${toTime.text[4]}",
                      "Days": Days.toString(),
                      "VideoTiming_id": 0,
                      "Doctor_id": widget.DocID,
                    });
                    context.pop();

                    if (res.isSuccessful) {

                      print(
                          ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.base.request?.url}");
                      print(
                          ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body}");
                      if (res.body?.message.toString() ==
                          "Added Successfully...") {
                        widget.bloc.add(const Refresh());
                        context.pop();
                        print(
                            ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body?.message}");
                      }
                      showMessage(
                          context: context, message: res.body?.message ?? '');
                    } else {
                      showMessage(
                          context: context,
                          message:
                              'Request failed, Please check your connection.');
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  alert() {
    var alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      alignment: Alignment.center,
      content: Text(
          "Please make sure to enter ${fromTime.text.toString() == "" ? "From Time," : ""} ${toTime.text.toString() == "" ? "To Time," : ""} ${Days == null ? "Days." : ""} "),
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
