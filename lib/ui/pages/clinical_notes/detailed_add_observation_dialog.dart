import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/waiting_dialog.dart';

class DetailedAddObservationDialog extends StatelessWidget {
  const DetailedAddObservationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Consts.DUMMY_USER;

    TextEditingController observationController = TextEditingController();

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
              controller: observationController,
              label: 'Observation',
              hint: 'Enter your observation here...',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: OutlinedButton(
                child: const Text('Save'),
                onPressed: () async {
                  print("start");
                  if (observationController.text.isEmpty) {
                    await Fluttertoast.showToast(
                        msg: "Observation field cant be empty",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  } else {
                    final call = Injector()
                        .apiService
                        .get2(path: 'Add_To_Parent_Table', query: {
                      'Doctor_id': LocalStorage.getUID().toString(),
                      'Complaint_Name': observationController.text.toString(),
                      'Type': "2",
                    });
                    print("before res");
                    print(LocalStorage.getUID().toString());
                    final res =
                    await showWaitingDialog(context: context, call: call);
                    print("inside res");
                    print(res?.body);
                    if (res?.body.message == "Added Successfully") {
                      await Fluttertoast.showToast(
                          msg: "New Observation Added Successfully",
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
