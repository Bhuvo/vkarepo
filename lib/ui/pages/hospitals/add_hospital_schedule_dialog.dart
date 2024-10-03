import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/pages/hospitals/follow_up_fee_item.dart';
import 'package:timesmedlite/ui/pages/hospitals/schedule_time_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_phone_field.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/get_all_hospital_by_doctor.dart';
import '../../../model/get_hospital_timing_by_doctor_hospital.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/nothing_widget.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../../widgets/m_date_picker_text_field.dart';

class AddHospitalScheduleDialog extends StatefulWidget {
  const AddHospitalScheduleDialog({Key? key}) : super(key: key);

  @override
  State<AddHospitalScheduleDialog> createState() =>
      _AddHospitalScheduleDialogState();
}

class _AddHospitalScheduleDialogState extends State<AddHospitalScheduleDialog> {
  List<String> selDay = [];
  List<String> selDays = [];
  var Day;
  var Days;

  var hospitalname;
  var setInterval;

  TextEditingController hospitalIDselected = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();

  var DocID;

  @override
  void initState() {
    fromTime.text = "";
    toTime.text = ""; //set the initial value of text field
    //DocID=38371;
    hospitalIDselected.text = '193971';
    DocID = LocalStorage.getUID();
    super.initState();
  }

  final GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('$DocID');
    final ApiBuilderBloc GetHospitalTimingMasterByDoctor_bloc = ApiBuilderBloc(
        path: 'GetAllHospitalByDoctor',
        // query: {'DoctorId': DocID},
        query: {
          'DoctorId': LocalStorage.getUID(),
        },
        api2: true);

    final blocGetHospitalTimingByDoctorHospital = ApiBuilderBloc(
        path: 'GetHospitalTimingByDoctorHospital',
        query: {
          'HospitalId': 0,
          'DoctorId': LocalStorage.getUID().toString(),
        },
        api2: true);
    return MDialog(
      title: Row(
        children: [
          const Text('ADD HOSPITAL SCHEDULE LIST'),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocProvider(
                    create: (_) =>
                        GetHospitalTimingMasterByDoctor_bloc..add(const Load()),
                    child: ApiBuilder<GetHospitalTimingByDoctorHospital>(
                      empty: NothingWidget(
                        title: "No Hospital Schedule List",
                        icon: Icons.local_hospital,
                        message: "",
                      ),
                      loading: const DropDownShimmer(
                        label: 'Hospital',
                      ),
                      jsonBuilder: (hosptiallist, load) {
                        print('Hospital List $hosptiallist');
                        return MDialogDown<Map<String, dynamic>>(
                            required: false,
                            items: hosptiallist,
                            label: 'Hospital',
                            // controller: hospitalCountry,
                            onChanged: (d) {
                              setState(() {
                                hospitalname = d;
                                hospitalIDselected.text =
                                    d!['Hospital_id'].toString();
                                print(
                                    "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::DDDDDDDDDDDDDDDDDDDDDDD${hospitalIDselected.text}");
                                blocGetHospitalTimingByDoctorHospital
                                    .add(UpdateQuery({
                                  'HospitalId': hospitalIDselected.text,
                                  'DoctorId': LocalStorage.getUID().toString(),
                                }));
                              });
                            },
                            value: hospitalname,
                            labelKey: 'Hospital_Name');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MCounterField(
                    key: ValueKey('qty::$setInterval'),
                    value: setInterval,
                    onChanged: (d) {
                      setState(() {
                        setInterval = d;
                      });
                    },
                    label: 'Set Interval in Minutes',
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  MTextField(
                      label: 'Doctor\'s Fee',
                      type: MInputType.decimal,
                      controller: fee,
                      onChanged: (v) {
                        print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV$v');
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  MMultiSelect<String>(
                    itemWidth: context.getWPercent(20),
                    items: Consts.daysOfWeek
                        .map((e) => MMultiSelectItem(value: e, label: e))
                        .toList(),
                    value: selDay,
                    onChanged: (d) {
                      setState(() {
                        selDay = d;
                        print(selDay);
                      });
                    },
                    label: 'Available Days',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: DateTimePickerTextField(
                        controller: fromTime,
                        LabelText: 'From Time',
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: DateTimePickerTextField(
                        controller: toTime,
                        LabelText: 'To Time',
                      )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(24 Hrs Format)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.red, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: OutlinedButton(
                      child: const Text('Add'),
                      onPressed: () async {
                        for (int i = 0; i < selDay.length; i++) {
                          switch (selDay[i]) {
                            case Consts.MON:
                              selDays.add('1');
                              break;
                            case Consts.TUE:
                              selDays.add('2');
                              break;
                            case Consts.WED:
                              selDays.add('3');
                              break;
                            case Consts.THU:
                              selDays.add('4');
                              break;
                            case Consts.FRI:
                              selDays.add('5');
                              break;
                            case Consts.SAT:
                              selDays.add('6');
                              break;
                            case Consts.SUN:
                              selDays.add('7');
                              break;
                          }
                        }

                        for (int i = 0; i < selDay.length; i++) {
                          if (i == 0) {
                            Day = '${selDay[i]},';
                            Days = '${selDays[i]},';
                          } else if (i == (selDay.length - 1)) {
                            Day = '$Day${selDay[i]}';
                            Days = '$Days${selDays[i]}';
                          } else {
                            Day = '$Day${selDay[i]},';
                            Days = '$Days${selDays[i]},';
                          }
                        }

                        print(
                            "0, ${LocalStorage.getUID()}, ${int.tryParse(hospitalIDselected.text)} ${int.tryParse(fee.text)} ${fromTime.text.toString()} ${toTime.text.toString()} ${Day.toString()} ${Days.toString()} ${setInterval.toString()}");
                        if (form.currentState!.validate()) {
                          showWaitingDialog(context: context);
                          final res = await Injector()
                              .apiService
                              .post2(path: 'AddHospitalTiming', query: {
                            "HospitalDetails_id": 0,
                            "Doctor_id": LocalStorage.getUID().toString(),
                            "Hospital_id":
                                int.tryParse(hospitalIDselected.text),
                            "DoctorFee": int.tryParse(fee.text),
                            "FromTime": fromTime.text.toString(),
                            "ToTime": toTime.text.toString(),
                            "Day": Day.toString(),
                            "Days": Days.toString(),
                            "SetInterval": setInterval,
                          });
                          context.pop();

                          if (res.isSuccessful) {
                            print(
                                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::res.isSuccessful");
                            print(
                                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body}");
                            if (res.body?.message.toString() ==
                                "Timing Added Successfully") {
                              context.pop();
                              context.replace(Routes.hospitalsBasedOnDoctor);
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body?.message}");
                            }
                            showMessage(
                                context: context,
                                message: res.body?.message ?? '');
                          } else {
                            showMessage(
                                context: context,
                                message:
                                    'Request failed, Please check your connection.');
                          }
                        }
                      },
                    ),
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // BlocProvider(
                  //     create: (c) => blocGetHospitalTimingByDoctorHospital
                  //       ..add(const Load()),
                  //     child: ApiBuilder<GetHospitalTimingByDoctorHospital>(
                  //         //shrinkWrap: true,
                  //         fromJson:
                  //             GetHospitalTimingByDoctorHospital.fromJsonFactory,
                  //         customBuilder: (data, _) {
                  //           print(
                  //               "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::X${data[0]}");
                  //           return ListView.builder(
                  //               physics: NeverScrollableScrollPhysics(),
                  //               shrinkWrap: true,
                  //               padding:
                  //                   const EdgeInsets.symmetric(vertical: 24),
                  //               itemBuilder: (c, i) => ScheduleTimeListItem(
                  //                     bloc:
                  //                         blocGetHospitalTimingByDoctorHospital,
                  //                     getHospitalTimingByDoctorHospital:
                  //                         data[0].listTiming![i],
                  //                     docID: LocalStorage.getUID().toString(),
                  //                   ),
                  //               itemCount: hospitalname == null
                  //                   ? 0
                  //                   : data.first.listTiming?.length);
                  //         })),
                  //ScheduleTimeListItem(),
                  // Divider(endIndent: 0, indent: 0, height: 32,),
                  // Text('Follow Up Fee', style: Theme.of(context).textTheme.bodySmall,),
                  // const SizedBox(height: 8,),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: MTextField(
                  //         label: 'From Time',
                  //         suffixIcon: Icon(CupertinoIcons.clock_fill),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 16,),
                  //     Expanded(
                  //       child: MTextField(
                  //         label: 'To Time',
                  //         suffixIcon: Icon(CupertinoIcons.clock_fill),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 8,),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       child: MTextField(
                  //         label: 'Fee',
                  //         type: MInputType.decimal,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 16,),
                  //     Expanded(
                  //       child: OutlinedButton(
                  //         child: const Text('Add'),
                  //         onPressed: (){},
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 12,),
                  // FollowUpFeeItem(),
                  // SizedBox(height: 16,),
                  // SizedBox(
                  //   width: double.maxFinite,
                  //   height: 50,
                  //   child: OutlinedButton(onPressed: (){}, child: const Text('Update')),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
