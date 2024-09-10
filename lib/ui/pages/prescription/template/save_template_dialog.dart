import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../facade/api_facade.dart';
import '../../../../model/api_response.dart';
import '../../../../utils/local_storage.dart';
import '../../../components/waiting_dialog.dart';
import '../../../theme/theme.dart';

class SaveTemplateDialog extends StatelessWidget {
  final Appointment_id;

  SaveTemplateDialog({Key? key, required this.Appointment_id})
      : super(key: key);

  TextEditingController tempateNameController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          const Text(Consts.SAVE_NEW_TEMPLATE),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            MTextField(
              controller: tempateNameController,
              label: 'Template Name',
            ),
            MTextField(
              controller: descrptionController,
              label: 'Description',
              maxLines: 5,
              minLines: 3,
            ),
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      tempateNameController.clear();
                      descrptionController.clear();
                    },
                    child: Text(
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
                        // final call = Injector().apiService.get(path: 'Update_Doctor_Online', query: {'Status':  'Y' , 'Doctor_id': LocalStorage.getUID()});
                        // final res = await showWaitingDialog(context: context, call: call);
                        if ((tempateNameController.text.isEmpty ||
                                tempateNameController.text == "") ||
                            (descrptionController.text.isEmpty ||
                                descrptionController.text == "")) {
                          await Fluttertoast.showToast(
                            msg: 'Fields cant be empty',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: MTheme.THEME_COLOR,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          final call = Injector()
                              .apiService
                              .get(path: 'SaveTemplate', query: {
                            'Appointment_id': Appointment_id,
                            'Template_Name': tempateNameController.text,
                            'Description': descrptionController.text,
                          });
                          print(Appointment_id);
                          print(tempateNameController.text);
                          print(descrptionController.text);
                          print("prints savetemplate");
                          final res = await showWaitingDialog(
                              context: context, call: call);
                          // print("RES::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${res?.body.R}");

                          if (res?.body.R == "Saved") {
                            tempateNameController.clear();
                            descrptionController.clear();
                            await Fluttertoast.showToast(
                              msg: 'Save successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: MTheme.THEME_COLOR,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            context.pop();
                            //context.popDialog();
                          } else {
                            await Fluttertoast.showToast(
                              msg: 'Not Saved Something Wrong',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: MTheme.THEME_COLOR,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            context.pop();
                          }
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
