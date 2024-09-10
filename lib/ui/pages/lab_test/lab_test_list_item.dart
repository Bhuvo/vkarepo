import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../di/dependency_injection.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class LabTestListItem extends StatefulWidget {
  final departmentName,
      testname,
      labTestId,
      instructions,
      appointmentId,
      userId;

  const LabTestListItem({
    Key? key,
    this.departmentName,
    this.testname,
    this.labTestId,
    this.instructions,
    this.appointmentId,
    this.userId,
  }) : super(key: key);

  @override
  State<LabTestListItem> createState() => _LabTestListItemState();
}

class _LabTestListItemState extends State<LabTestListItem> {
  late ApiBuilderBloc getLabTestList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLabTestList = ApiBuilderBloc(
      path: 'get_laboratoryNew_SRMC',
      query: {
        'user_id': widget.userId.toString(),
        'Appointment_id': widget.appointmentId.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => getLabTestList..add(const Load()),
      child: MListTile(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.departmentName,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('Test Name: ${widget.testname}'),
                    Row(
                      children: [
                        const Text('Instructions: '),
                        Text(
                          widget.instructions.toString(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              MIconButton(
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                onTap: () async {
                  final call =
                      Injector().apiService.get(path: 'DeleteSpecTest', query: {
                    'LabTestMaster_id': widget.labTestId.toString(),
                  });
                  print(widget.labTestId.toString());
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  if (res?.body.message == "Deleted SuccessFully") {
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      setState(() async {
                        getLabTestList.add(const Refresh());
                        getLabTestList.add(const UpdateQuery({}));
                        await Future.delayed(const Duration(milliseconds: 300));
                      });
                    });
                    await Fluttertoast.showToast(
                        msg: "Deleted Successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          )),
    );
  }
}
