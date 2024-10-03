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
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../../widgets/m_date_picker_text_field.dart';

class EditHospitalScheduleDialog extends StatefulWidget {
  final   GetHospitalTimingByDoctorHospital getHospitalTimingMasterByDoctor;
  final DocID;
  const EditHospitalScheduleDialog({Key? key, required this.getHospitalTimingMasterByDoctor, this.DocID}) : super(key: key);

  @override
  State<EditHospitalScheduleDialog> createState() =>
      _EditHospitalScheduleDialogState(getHospitalTimingMasterByDoctor);
}

class _EditHospitalScheduleDialogState extends State<EditHospitalScheduleDialog> {
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

  final ApiBuilderBloc GetHospitalTimingMasterByDoctor_bloc = ApiBuilderBloc(
      path: 'GetHospitalTimingMasterByDoctor',
      query: {'DoctorId': LocalStorage.getUID()},
      api2: true);


  @override
  void initState() {
    fromTime.text = "";
    toTime.text = ""; //set the initial value of text field

    // selDay=data.day!.split(',')!;
    super.initState();
  }

  final GlobalKey<FormState> form = GlobalKey();

  GetHospitalTimingByDoctorHospital data;
  _EditHospitalScheduleDialogState(this.data);




  @override
  Widget build(BuildContext context) {
    var blocGetHospitalTimingByDoctorHospital = ApiBuilderBloc(
        path: 'GetHospitalTimingByDoctorHospital',
        query: {
          'HospitalId': data.hospitalId,
          'DoctorId': widget.DocID,
        },
        api2: true);

    print("${data.hospitalId} ${widget.DocID}");
    print(data.setInterval?.toInt());


    print(data.days);
    return MDialog(
      title: Row(
        children: [
          const Text('EDIT HOSPITAL SCHEDULE LIST'),
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
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(data.hospitalName),
                   ],
                 ),
                  SizedBox(
                    height: 12,
                  ),
                  MCounterField(
                   key: ValueKey('setInterval::$setInterval'),
                    value:setInterval??data.setInterval,
                    onChanged: (d) {
                      setState(() {
                        data=data.copyWith(setInterval:d);
                        setInterval=data.setInterval?.toInt();
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
                     value: data.doctorFee.toString(),
                      onChanged: (v) {
                        data=data.copyWith(daysGet: v);
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
                            LabelText: 'To Time'
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
                      child:  Text((data.fromTime==null||data.fromTime=="")?'Add':'Update'),
                      onPressed: () async {
                        selDays=[];
                        for (int i = 0; i < selDay.length; i++) {
                          print(selDay[i]);
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
                          print(selDays[i]);
                        }

                        for (int i = 0; i < selDay.length; i++) {
                          if (i == 0) {
                            Day = '${selDay[i]},';
                            Days = '${selDays[i]},';
                          } else if(i==(selDay.length-1)){
                            Day = '$Day${selDay[i]}';
                            Days = '$Days${selDays[i]}';
                          }
                          else{
                            Day = '$Day${selDay[i]},';
                            Days = '$Days${selDays[i]},';
                          }
                        }
                        if(fromTime.text.endsWith('M')&&toTime.text.endsWith('M')){
                          data=data.copyWith(fromTime: fromTime.text);
                          data=data.copyWith(toTime: toTime.text);
                        }
                        else if(fromTime.text.endsWith('M')){
                          data=data.copyWith(fromTime: fromTime.text);
                          var TTIME=DateFormat('HH:mm a').format(DateFormat('HH:mm:ss').parse(toTime.text )).toString();
                          data=data.copyWith(toTime: TTIME);
                        }
                        else if(toTime.text.endsWith('M')){
                          data=data.copyWith(toTime: toTime.text);
                          var FTIME=DateFormat('HH:mm a').format(DateFormat('HH:mm:ss').parse(fromTime.text )).toString();
                          data=data.copyWith(fromTime: FTIME);
                        }
                        else{
                          var FTIME=DateFormat('HH:mm a').format(DateFormat('HH:mm:ss').parse(fromTime.text )).toString();
                          data=data.copyWith(fromTime: FTIME);
                          var TTIME=DateFormat('HH:mm a').format(DateFormat('HH:mm:ss').parse(toTime.text )).toString();
                          data=data.copyWith(toTime: TTIME);
                          print(FTIME);
                          print(TTIME);
                        }

                        print(
                            "0, ${data.hospitalId}, ${ data.hospitalDetailsId} ${widget.DocID}${data.doctorFee} ${data.fromTime.toString()} ${data.toTime.toString()} ${Day.toString()} ${Days.toString()} ${data.setInterval}");

                        if (form.currentState!.validate()) {
                          showWaitingDialog(context: context);
                          final res = await Injector()
                              .apiService
                              .post2(path: 'AddHospitalTiming', query: {
                            "HospitalDetails_id": data.hospitalDetailsId,
                            "Doctor_id": widget.DocID,
                            "Hospital_id": data.hospitalId,
                            "DoctorFee": data.doctorFee,
                            "FromTime":data.fromTime,
                            "ToTime": data.toTime,
                            "Day":Day.toString(),
                            "Days": Days.toString(),
                            "SetInterval": data.setInterval,

                          });
                          context.pop();

                          if (res.isSuccessful) {
                            print(
                                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::res.isSuccessful");
                            print(
                                ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body}");
                            if (res.body?.message.toString() =="Timing Added Successfully") {
                              setState(() {
                                fromTime.text='';
                                toTime.text='';
                                selDays=[];
                                selDay=[];
                                var hospitalid= data.hospitalId;
                                data=data.copyWith(hospitalId: 0);
                                data=data.copyWith(hospitalId: hospitalid);
                                blocGetHospitalTimingByDoctorHospital.add(Refresh());
                                context.popDialog();
                              });

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
                  const SizedBox(
                    height: 16,
                  ),

                  BlocProvider(
                      create: (c) => blocGetHospitalTimingByDoctorHospital
                        ..add(const Load()),
                      child: ApiBuilder<GetHospitalTimingByDoctorHospital>(
                        //shrinkWrap: true,
                          fromJson:
                          GetHospitalTimingByDoctorHospital.fromJsonFactory,
                          customBuilder: (da, _) {

                            print(
                                "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::X${da.first.listTiming?.length}");
                            return  ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding:
                                const EdgeInsets.symmetric(vertical: 24),
                                itemBuilder: (c, i) => ScheduleTimeListItem(
                                  onTap: (){
                                    setState(() {
                                      data=data.copyWith(day:  da[0].listTiming![i].day);
                                      data=data.copyWith(fromTime:  da[0].listTiming![i].fromTime);
                                      data=data.copyWith(toTime:  da[0].listTiming![i].toTime);
                                      data=data.copyWith(day:  da[0].listTiming![i].day);
                                      data=data.copyWith(days:  da[0].listTiming![i].days);
                                      data=data.copyWith(hospitalDetailsId:da[0].listTiming![i].hospitalDetailsId );
                                      fromTime.text=data.fromTime!;
                                      toTime.text=data.toTime!;
                                      selDay=data.day!.split(',');
                                      selDays=data.days!.split(',');
                                      print("XXXXXXXXXXXXXXXXX${selDay}");
                                    });
                                  },
                                  bloc:blocGetHospitalTimingByDoctorHospital ,
                                  getHospitalTimingByDoctorHospital:
                                  da[0].listTiming![i],
                                  docID:widget.DocID ,
                                ),
                                itemCount: da.first.listTiming?.length);
                          })),
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
