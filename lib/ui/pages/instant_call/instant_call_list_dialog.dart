import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_call_list_item.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/nothing_widget.dart';

class InstantCallListDialog extends StatefulWidget {
  const InstantCallListDialog({Key? key}) : super(key: key);

  @override
  State<InstantCallListDialog> createState() => _InstantCallListDialogState();
}

class _InstantCallListDialogState extends State<InstantCallListDialog> {
  DateTime now = DateTime.now();

  DateTime datetime = DateTime.now();
  late String datetime1 = DateFormat("MM/dd/yyyy").format(datetime);

  // dateController.text = datetime1;

  // @override
  // void initState() {
  //   super.initState();
  //   // dateController = DateFormat('MM/dd/yyyy').DateTime.now();
  //   DateTime datetime = DateTime.now();
  //   String datetime1 = DateFormat("MM/dd/yyyy").format(datetime);
  //   currentTime = DateTime(now.month, now.day, now.year);
  //   print(datetime1);
  //   dateController.text = datetime1;
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //
  // }

  late final ApiBuilderBloc instantApprovalRequest = ApiBuilderBloc(
    path: 'PatientApprovalList',
    query: {
      "From": datetime1,
      "To": datetime1,
      "Doctor_id": LocalStorage.getUID().toString(),
      // need to check how to get UID fo user since this is in doctor view
    },
    raw: true,
  );

  @override
  Widget build(BuildContext context) {
    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          const Text(Consts.INSTANT_CALL_STATUS),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: MDateTimePicker(
                start: DateTime(1990),
                end: DateTime.now(),
                label: 'Select Date',
                onChanged: (d) {
                  final DateFormat formatter = DateFormat('MM/dd/yyyy');
                  final String formatted = formatter.format(d!);
                  // dateController.text = formatted;
                  instantApprovalRequest.add(
                    UpdateQuery(
                      {
                        "From": formatted,
                        "To": formatted,
                        "Doctor_id": LocalStorage.getUID().toString(),
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (c) => instantApprovalRequest..add(const Load()),
                child: ApiBuilder(
                  empty: NothingWidget(
                      icon:Icons.calendar_month_rounded,
                      title: "No Calls",
                      message: "No calls on the selected date",
                      // onRefresh: (){
                      //   instantApprovalRequest.add(const Refresh());
                      // }

                    // Icons.calendar_month_rounded,
                    // "No upcoming appointments to show"
                  ),
                    shrinkWrap: true,
                    jsonBuilder: (data, load) {
                      return ListView.builder(
                        itemBuilder: (c, i) => InstantCallListItem(
                          userName: data[i]['User_Name'],
                          transactionStatus: data[i]['transaction_status'],
                          mobileNumber: data[i]['MobileNumber'],
                          date: data[i]['Req_Date']?.split(" ")[0],
                          time: data[i]['Req_Date']?.split(" ")[1],
                          meridiem: data[i]['Req_Date']?.split(" ")[2],
                          doctorApprovalDateTime: (data[i]['DoctorApproval'] == ("Y")||data[i]['DoctorApproval']==("R"))?data[i]['DoctorApprovalDateTime']:'',
                          doctorApprovalDate: (data[i]['DoctorApproval'] == ("Y")||data[i]['DoctorApproval']==("R"))?data[i]['DoctorApprovalDateTime']?.split(" ")[0].toString():'',
                          doctorApprovalTime: (data[i]['DoctorApproval'] == ("Y")||data[i]['DoctorApproval']==("R"))?data[i]['DoctorApprovalDateTime']?.split(" ")[1].toString():'',
                          doctorApprovalMeridiem: (data[i]['DoctorApproval'] == ("Y")||data[i]['DoctorApproval']==("R"))?data[i]['DoctorApprovalDateTime']?.split(" ")[2].toString():'',
                          doctorApproval: data[i]['DoctorApproval'],
                          orderDate: data[i]['order_date']?.split(" ")[0],
                          // orderTime: data[i]['order_date']?.split(" ")[1],
                          // orderDateMeridiem:
                          //     data[i]['order_date']?.split(" ")[2],
                        ),
                        itemCount: data.length,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}