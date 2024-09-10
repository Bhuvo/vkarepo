import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import 'add_complaints_page.dart';

class ComplaintListItem extends StatelessWidget {
  final String complaintName;
  final String complaintNotes;
  final String complaintId;
  final String appointmentId;

  ComplaintListItem({
    super.key,
    required this.complaintName,
    required this.complaintNotes,
    required this.complaintId,
    required this.appointmentId,
  });



  @override
  Widget build(BuildContext context) {

    final bloc = ApiBuilderBloc(
        path: 'Get_Appointment_Complaints',
        query: {
          'Appointment_Id': appointmentId,
          // need to check how to get UID fo user since this is in doctor view
        },
        api2: true);

    return MListTile(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MTextContent2(
                  head: 'Complaint Name:',
                  content: complaintName,
                  headStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 13),
                ),
                Row(),
                MTextContent2(
                  flex: true,
                  head: 'Notes:',
                  content: complaintNotes,
                  contentColor: Colors.red,
                ),
              ],
            ),
          ),
          MIconButton(
            onTap: () async {
              final call = Injector()
                  .apiService
                  .get2(path: 'Delete_Appointment_Complaints', query: {
                'Id': complaintId,
              });

              final res = await showWaitingDialog(context: context, call: call);
              if (res?.body.message == "Deleted Successfully") {
                bloc.add( UpdateQuery(
                  {
                    'Appointment_Id': appointmentId,
                  },
                ));
                await Fluttertoast.showToast(
                    msg: "Deleted Successfully",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0);

                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const AddComplaintsPage(),
                //     ));
                context.pop();
              }
            },
            color: Colors.red,
            padding: const EdgeInsets.all(4),
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
