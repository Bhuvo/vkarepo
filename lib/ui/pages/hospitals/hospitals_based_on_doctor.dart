import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/hospitals/add_hospital_schedule_dialog.dart';
import 'package:timesmedlite/ui/pages/hospitals/add_online_consult_fee_dialog.dart';
import 'package:timesmedlite/ui/pages/hospitals/add_online_schedule_dialog.dart';
import 'package:timesmedlite/ui/pages/hospitals/hospital_list_item.dart';
import 'package:timesmedlite/ui/pages/hospitals/hospital_schedule_list_item.dart';
import 'package:timesmedlite/ui/pages/hospitals/online_consult_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../model/get_all_hospital_by_doctor.dart';
import '../../../model/get_hospital_timing_by_doctor_hospital.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/nothing_widget.dart';
import 'add_hospital_dialog.dart';
import 'edit_hospital_dialog.dart';

class HospitalsBasedOnDoctor extends StatelessWidget {
  HospitalsBasedOnDoctor({Key? key}) : super(key: key);

  final blocGetAllHospitalByDoctor = ApiBuilderBloc(
      path: 'GetAllHospitalByDoctor',
      query: {
        //'DoctorId':38371,
        'DoctorId': LocalStorage.getUID(),
      },
      api2: true);

  final blocGetHospitalTimingMasterByDoctor = ApiBuilderBloc(
      path: 'GetHospitalTimingMasterByDoctor',
      query: {
        //'DoctorId':38371,
        'DoctorId': LocalStorage.getUID(),
      },
      api2: true);

  final blocGetDoctorOnlineTiming = ApiBuilderBloc(
      path: 'DoctorOnlineTiming',
      query: {
        //'DoctorId':38371,
        'DoctorId': LocalStorage.getUID().toString(),
      },
      api2: true);

  final blocgetOnlineFeeData = ApiBuilderBloc(
      path: 'getOnlineFeeData',
      query: {
        //'DoctorId':38371,
        'DoctorId': LocalStorage.getUID(),
      },
      api2: true,
      raw: true);

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.HOSPITAL_LIST_BASED_ON_DOCTOR),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              '      Hospital List',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            BlocProvider(
                create: (c) => blocGetAllHospitalByDoctor..add(const Load()),
                child: ApiBuilder<GetAllHospitalByDoctor>(
                  empty:  NothingWidget(
                  title: "No Hospital List",
                  icon: Icons.local_hospital,
                  message: "",
                ),
                    //shrinkWrap: true,
                    fromJson: GetAllHospitalByDoctor.fromJsonFactory,
                    customBuilder: (data, _) {
                      print(
                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${data}");
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        itemBuilder: (c, i) =>
                            HospitalListItem(getAllHospitalByDoctor: data[i]),
                        itemCount: data.length,
                      );
                    })),
            // ...const [
            //   HospitalListItem(),
            //   HospitalListItem(),
            // ],
            Container(
              width: double.maxFinite,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (c) => AddHospitalDialog(blocGetAllHospitalByDoctor: blocGetAllHospitalByDoctor,),
                    );
                  },
                  child: const Text('Add')),
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '      Hospital Schedule List',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            BlocProvider(
                create: (c) =>
                    blocGetHospitalTimingMasterByDoctor..add(const Load()),
                child: ApiBuilder<GetHospitalTimingByDoctorHospital>(
                    empty:  NothingWidget(
                      title: "No Hospital Schedule List",
                      icon: Icons.local_hospital,
                      message: "",
                    ),
                    //shrinkWrap: true,
                    fromJson: GetHospitalTimingByDoctorHospital.fromJsonFactory,
                    customBuilder: (data, _) {
                      print(
                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::DDDDDDDDDDDDD${data}");
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          itemBuilder: (c, i) => HospitalScheduleListItem(
                              getHospitalTimingMasterByDoctor: data[i],
                              // DocID: '38371'
                              DocID: LocalStorage.getUID()),
                          itemCount: data.length);
                    })),
            // ...const [
            //   HospitalScheduleListItem(),
            //   HospitalScheduleListItem(),
            // ],
            Container(
              width: double.maxFinite,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (c) => const AddHospitalScheduleDialog(),
                    );
                  },
                  child: const Text('Add')),
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '      Online Consultation Schedule List',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            // ...const [
            // OnlineConsultListItem(),
            //   OnlineConsultListItem(),
            // ],
            BlocProvider(
                create: (c) => blocGetDoctorOnlineTiming..add(const Load()),
                child: ApiBuilder<GetHospitalTimingByDoctorHospital>(
                    empty:  NothingWidget(
                      title: "No Online Timing Added Yet",
                      icon: Icons.more_time,
                      message: "",
                    ),
                    //shrinkWrap: true,
                    fromJson: GetHospitalTimingByDoctorHospital.fromJsonFactory,
                    customBuilder: (data, _) {
                      print(
                          "      Online Consultation Schedule List${data[0].listTiming?.length}");
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          itemBuilder: (c, i) => OnlineConsultListItem(
                                getDoctorTime: data[0].listTiming![i],
                                 //DocID: '38371',
                                DocID: LocalStorage.getUID().toString(),
                                bloc: blocGetDoctorOnlineTiming,
                              ),
                          itemCount: data[0].listTiming?.length ?? 0);
                    })),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (c) => AddOnlineScheduleDialog(
                              bloc: blocGetDoctorOnlineTiming,
                              //;DocID: '38371',
                              DocID: LocalStorage.getUID(),
                            ),
                          );
                        },
                        child: const Text('Add')),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (c) => BlocProvider(
                                create: (c) =>
                                    blocgetOnlineFeeData..add(const Load()),
                                child: ApiBuilder(jsonBuilder: (data, load) {
                                  print(
                                      "Mode Name:::::::::::::::::::::::::::::${data[0]}");
                                  //CallMode=data[0]['Mode_Name'];
                                  return AddOnlineConsultFeeDialog(data: data[0],bloc: blocgetOnlineFeeData,);
                                })));
                      },
                      child: const Text(
                        'Add Consultation Fee',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: MTheme.ICON_COLOR),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
