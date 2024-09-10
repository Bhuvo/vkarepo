import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/waiting_dialog.dart';

class AddComplaintDialog extends StatelessWidget {
  const AddComplaintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Consts.DUMMY_USER;

    TextEditingController complaintController = TextEditingController();

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          Text(Consts.ADD_NEW_COMPLAINT),
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
              controller: complaintController,
              label: 'Complaint',
              hint: 'Enter your complaint here...',
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              height: 50,
              child: OutlinedButton(
                child: const Text('Save'),
                onPressed: () async {
                  final call = Injector()
                      .apiService
                      .get2(path: 'Add_Complaints', query: {
                    ///need to add doc id dynamically
                    'DoctorId': LocalStorage.getUID().toString(),
                    'Complaint_Name': complaintController.text.toString(),
                  });
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  if (res?.body.message == "Added Successfully") {
                    print("RESP::::   ${res?.body.message}");
                    context.pop(); //context.pop();
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
