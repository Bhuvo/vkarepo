import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/update_timing_widget.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/time_list_response.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';


class UpdateCallStatusPage extends StatefulWidget {
  final appointmentIDFromCallScreen;
  final currentCallKey;

  const UpdateCallStatusPage(
      {Key? key, this.appointmentIDFromCallScreen, this.currentCallKey})
      : super(key: key);

  @override
  State<UpdateCallStatusPage> createState() => _UpdateCallStatusPageState();
}

class _UpdateCallStatusPageState extends State<UpdateCallStatusPage>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  static const tabs = [
    Consts.FREE_REVIEW,
    Consts.PAID_RE_VISIT,
    Consts.COMPLETE_CONSULTATION,
  ];

  DateTime cur = DateTime.now();
  DateTime? selection;
  int currentIndex = 0;
  var appointmentID;
  var keyID;

  @override
  void initState() {
    tab = TabController(length: tabs.length, vsync: this);
    appointmentID = widget.appointmentIDFromCallScreen;
    keyID = widget.currentCallKey;
    super.initState();
  }

  ApiBuilderBloc bloc = ApiBuilderBloc(
      path: 'BookAppointment_Future',
      query: {
        'F_Date':
            '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}',
        'Doctor_id': '${LocalStorage.getUID()}',
      },
      raw: true);

  @override
  Widget build(BuildContext context) {
    print("KKKKKKKKKKEEEEEEEEEEEEEEEEEEEEEEEEEEEEEasdfEEEEE${appointmentID}");
    print("KKKKKKKKKKEEEEEEEEEEEEEEEEEEEEEEEEEEEEEasdfEEEEE${keyID}");

    return MScaffold(
      title: const Text(Consts.UPDATE_CALL_STATUS),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              MTabBar(
                tab,
                tabs,
                onTap: (p0) => currentIndex = p0,
              ),
              Row(),
              BlocProvider(
                create: (context) => bloc..add(const Load()),
                child: ApiBuilder<TimeListResponse>(
                    fromJson: TimeListResponse.fromJsonFactory,
                    loading: Shimmer.fromColors(
                        child: IgnorePointer(
                            ignoring: true,
                            child: UpdateTimingWidget(
                              date: cur,
                            )),
                        baseColor:
                            Theme.of(context).canvasColor.withOpacity(0.25),
                        highlightColor: Theme.of(context).highlightColor),
                    customBuilder: (data, load) {
                      return UpdateTimingWidget(
                        timeList: data.first.timeList,
                        onSelect: (d) {
                          selection = d;
                          print(
                              'Printttttttttttttttttttttttt${d.hour}/${d.minute}/${d.second}');
                        },
                        date: cur,
                        onChanged: (d) {
                          setState(() {
                            cur = d;
                            print(
                                'Printttttttttttttttttttttttttttttttttttttttttttttttttttttt${d.month}/${d.day}/${d.year}');
                            bloc.add(UpdateQuery({
                              'F_Date': '${d.month}/${d.day}/${d.year}',
                              'Doctor_id': '${LocalStorage.getUID()}',
                            }));
                            bloc.add(Refresh());
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottom: Container(
        constraints: BoxConstraints(maxWidth: 480),
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: OutlinedButton(
          child: const Text('Click to Complete'),
          onPressed: () async {
            print("before switch case");
            switch (currentIndex) {
              case 0:
                {
                  print("before Get_Appointment_Details api");
                  final call = Injector()
                      .apiService
                      .rawGet(path: 'Get_Appointment_Details', query: {
                    'Appointment_id': appointmentID,
                  });
                  print("after Get_Appointment_Details api");
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  print("after Get_Appointment_Details api");
                  print(res?.statusCode);

                  if (res!.isSuccessful) {
                    print("before RevisitBooking api");
                    final call1 = Injector()
                        .apiService
                        .rawGet(path: 'RevisitBooking', query: {
                      'Old_Appointment_id': appointmentID,
                      'User_Name': res.body['User_Name'],
                      //'MobileNumber': ,
                      'User_id': res.body['User_id'],
                      'AppDate':
                          '${selection!.month}/${selection!.day}/${selection!.year}',
                      'AppTime':
                          '${selection!.hour}:${selection!.minute}:${selection!.second}',
                      'Hospital_id': '0',
                      'Status': 'R',
                      'Doctor_id': '${LocalStorage.getUID()}',
                    });
                    final res1 =
                        await showWaitingDialog(context: context, call: call1);
                    print("after RevisitBooking api");
                    if (jsonDecode(res1!.bodyString) == "Booked") {
                      if (jsonDecode(res1!.bodyString) == "Booked") {
                        final call2 = Injector().apiService.get(
                            path: 'StopNew',
                            query: {
                              'Key_id': keyID,
                              'Appointment_id': appointmentID
                            });
                        final res2 = await showWaitingDialog(
                            context: context, call: call2);
                        if (res2!.body.message == "Call Stopped") {
                          context.pop();
                          context.replace(Routes.patientWaitingList);
                        }
                        //context.pop();
                      }
                    }
                  }
                }
                break;

              case 1:
                {
                  final call = Injector()
                      .apiService
                      .rawGet(path: 'Get_Appointment_Details', query: {
                    'Appointment_id': '181596',
                  });
                  final res =
                      await showWaitingDialog(context: context, call: call);

                  if (res!.isSuccessful) {
                    final call1 = Injector()
                        .apiService
                        .rawGet(path: 'RevisitBooking', query: {
                      'Old_Appointment_id': appointmentID,
                      'User_Name': res.body['User_Name'],
                      //'MobileNumber': ,
                      'User_id': res.body['User_id'],
                      'AppDate':
                          '${selection!.month}/${selection!.day}/${selection!.year}',
                      'AppTime':
                          '${selection!.hour}:${selection!.minute}:${selection!.second}',
                      'Hospital_id': '0',
                      'Status': 'M',
                      'Doctor_id': '${LocalStorage.getUID()}',
                    });
                    final res1 =
                        await showWaitingDialog(context: context, call: call1);
                    if (jsonDecode(res1!.bodyString) == "Booked") {
                      final call2 =
                          Injector().apiService.get(path: 'StopNew', query: {
                        'Key_id': keyID,
                        'Appointment_id': appointmentID,
                      });
                      final res2 = await showWaitingDialog(
                          context: context, call: call2);
                      if (res2!.body.message == "Call Stopped") {
                        print('CALL STOPPED${res2!.body.message}');
                        context.pop();
                        context.replace(Routes.patientWaitingList);
                      }
                      //context.pop();
                    }
                  }
                }
                break;

              case 2:
                {
                  final call = Injector()
                      .apiService
                      .rawGet(path: 'UpdateVideoCall_CallLog', query: {
                    'Appointment_id': appointmentID,
                    'Status': 'C',
                    'R_No': '0',
                  });
                  final res =
                      await showWaitingDialog(context: context, call: call);
                  if (jsonDecode(res!.bodyString) == "Updated") {
                    print(
                        'RRRRRRRRRRRRREEEEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSSS${widget.key}');

                    final call1 =
                        Injector().apiService.get(path: 'StopNew', query: {
                      'Key_id': keyID,
                      'Appointment_id': appointmentID,
                    });
                    final res1 =
                        await showWaitingDialog(context: context, call: call1);
                    if (res1!.body.message == "Call Stopped") {
                      print('CALL STOPPED${res1!.body.message}');
                    context.pop();
                     context.replace(Routes.patientWaitingList);
                    } //context.pop();
                  }
                }
                break;

              default:
                {
                  print("Invalid choice");
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
