import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/missed_call_log.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/pages/call_logs/call_logs_list_item.dart';
import 'package:timesmedlite/ui/pages/call_logs/missed_call_list_item.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class MissedCallsPage extends StatelessWidget {
  MissedCallsPage({Key? key}) : super(key: key);

  final bloc = ApiBuilderBloc(
      path: 'MissedCall', query: {'Doctor_id': '${LocalStorage.getUID()}'}, raw: true);

  @override
  Widget build(BuildContext context) {
    print("DDDDDDDDDDOOOOOOOOCCCCCTTTTTTTTTTT:${LocalStorage.getUID()}");
    return HomeBottomNavigation(
      title: Consts.MISSED_CALL,
      appBarBottom: const DoctorHeader(),
      paddingTop: 140,
      body: BlocProvider(
        create: (_) => bloc..add(const Load()),
        child: ApiBuilder<MissedCallLog>(
          fromJson: MissedCallLog.fromJsonFactory,
          builder: (data, i) {
            // final child = MissedCallListItem(data: MissedCallLog(User_Name: "Arun",User_id: 12345,Appointment_Date: '12/10/2000',Appointment_id: '1234567',Appointment_Time: '12:34',Doctor_id: 987654,MobileNumber: 1213466789,transaction_status: 'Success'),);
            final child = MissedCallListItem(data: data,);
            if (i == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(text: '      Missed Call Patient List'),
                    ]),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  child,
                ],
              );
            }
            return child;
          },
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: const [
      //       SizedBox(height: 24,),
      //       Text.rich(
      //         TextSpan(children: [
      //           TextSpan(text: '      Missed Patient List'),
      //         ]),
      //         style: TextStyle(
      //             fontSize: 12,
      //             color: Colors.black54,
      //             fontWeight: FontWeight.w600),
      //       ),
      //       MissedCallListItem(data: MissedCallLog(User_Name: "Arun",User_id: '12345',Appointment_Date: '12/10/2000',Appointment_id: '1234567',Appointment_Time: '12:34',Doctor_id: 987654,MobileNumber: "1213466789",transaction_status: 'Success')),
      //       MissedCallListItem(data: MissedCallLog(User_Name: "Arun",User_id: '12345',Appointment_Date: '12/10/2000',Appointment_id: '1234567',Appointment_Time: '12:34',Doctor_id: 987654,MobileNumber: "1213466789",transaction_status: 'Success')),
      //       MissedCallListItem(data: MissedCallLog(User_Name: "Arun",User_id: '12345',Appointment_Date: '12/10/2000',Appointment_id: '1234567',Appointment_Time: '12:34',Doctor_id: 987654,MobileNumber: "1213466789",transaction_status: 'Success')),
      //     ],
      //   ),
      // )
    );
  }
}
