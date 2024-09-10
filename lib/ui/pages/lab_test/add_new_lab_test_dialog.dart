import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/waiting_dialog.dart';

class AddNewLabTestDialog extends StatelessWidget {
  final departmentId;

  const AddNewLabTestDialog({Key? key, this.departmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Consts.DUMMY_USER;

    TextEditingController labTestController = TextEditingController();

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          const Text(Consts.ADD_NEW_COMPLAINT),
          const Spacer(),
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
          children: [
            MTextField(
              controller: labTestController,
              label: 'add new Lab Test',
              hint: 'Enter your Lab Test...',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: OutlinedButton(
                child: const Text('ADD'),
                onPressed: () async {
                  print("start");
                  if (labTestController.text.isEmpty) {
                    await Fluttertoast.showToast(
                        msg: "Enter new lab test",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  } else {
                    final call = Injector()
                        .apiService
                        .get(path: 'AddNewLabTest', query: {
                      'DeptNo': departmentId.toString(),
                      'T_Name': labTestController.text.toString(),
                    });
                    print("before res");
                    final res =
                        await showWaitingDialog(context: context, call: call);
                    print("inside res");
                    if (res?.body.message == "LabTest Added") {
                      await Fluttertoast.showToast(
                          msg:
                              "New LabTest Added please check from the above list",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                      context.pop();
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
