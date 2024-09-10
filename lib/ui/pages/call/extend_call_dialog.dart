import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/call_extend.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class ExtendCallDialog extends StatelessWidget {
  // final CallExtendModel? data;
  final String appointmentID;
  const ExtendCallDialog({Key? key,required this.appointmentID,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = Consts.DUMMY_USER;

    TextEditingController _endTime = TextEditingController();

    // return Expanded(
    //   child: BlocProvider(
    //     create: (c) => bloc..add(const Load()),
    //
    //     child: ApiBuilder<CallExtendModel>(
    //       fromJson: CallExtendModel.fromJsonFactory,
    //         customBuilder: (List<CallExtendModel> list, _){
    //         final callData = list.first;

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), title: Row(
      children: [
        Text('EXTEND CALL'),
        const Spacer(),
        IconButton(onPressed: () {
          context.popDialog();
        }, icon: const Icon(Icons.close_rounded))
      ],
    ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MTextField(
              label: 'Extend Minutes',
              hint: 'Enter the minutes you want to extend',
              controller: _endTime,
              type: MInputType.numeric,
            ),
            const SizedBox(height: 8,),
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.popDialog();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red)),
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          if(_endTime.text.isNotEmpty) {
                            final now = DateTime.now().add(Duration(
                                minutes: int.tryParse(_endTime.text) ?? 0));
                            showWaitingDialog(context: context);
                            final call = Injector().apiService.get(
                                path: 'CallExtendTime', query: {
                              'Appointment_id': appointmentID,
                              'EndTime': '${now.hour}:${now.minute}',
                            });
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            context.popDialog();
                            if (res?.body.message == "Call Extend") {
                              context.popDialog(
                                  '${now.hour}:${now.minute}'); //context.pop();
                            }
                          }
                        },
                        child: const Text(
                          'Confirm',
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),);
  }
// child:
//     ),
//   ),
// );


}
