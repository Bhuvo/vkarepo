import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/get_hospital_timing_by_doctor_hospital.dart';
import '../../components/waiting_dialog.dart';

class ScheduleTimeListItem extends StatelessWidget {
  final Function()? onTap;
  ApiBuilderBloc bloc;
  GetHospitalTimingByDoctorHospital getHospitalTimingByDoctorHospital;
  final docID;
  final EdgeInsets margin;
   ScheduleTimeListItem({Key? key, this.margin = const EdgeInsets.all(0),required this.bloc,required this.getHospitalTimingByDoctorHospital, this.docID, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'From Time:', iconSize: 16,),
                  Text(getHospitalTimingByDoctorHospital.fromTime.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                ],
              ),
              const SizedBox(height: 8,),
              Wrap(
                children: [
                  UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'To Time:', iconSize: 16,),
                  Text(getHospitalTimingByDoctorHospital.toTime.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                ],
              ),
              const SizedBox(height: 8,),
              Wrap(
                children: [
                  UserInfo(Info.custom, icon: FontAwesomeIcons.solidCalendarCheck, lable: 'Days:', iconSize: 16,),
                  Text(getHospitalTimingByDoctorHospital.day.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                ],
              ),
            ],
          )),
          onTap!=null?MIconButton(child: Icon(Icons.edit, color: Colors.green, size: 20,),
            color: Colors.green,
            padding: EdgeInsets.all(4),
            onTap: onTap,
          ):Container(),
          const SizedBox(width: 16,),
          MIconButton(child: Icon(Icons.delete_outline, color: Colors.red, size: 20,),
            color: Colors.red,
            padding: EdgeInsets.all(4),
            onTap: () async {
            print("$docID ${getHospitalTimingByDoctorHospital.hospitalDetailsId} , ${getHospitalTimingByDoctorHospital.hospitalId}");
              final call =Injector().apiService.get2(path: 'DeleteTiming', query: {
                'DoctorId': docID,
                'HospitalDetails_id' : getHospitalTimingByDoctorHospital.hospitalDetailsId,
              });
              final res = await showWaitingDialog(context: context, call: call);
              print("RES::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${call}");
              if(res?.body.code.toString() == "1"){
               bloc.add(UpdateQuery({ 'HospitalId': getHospitalTimingByDoctorHospital.hospitalId,
                 'DoctorId': docID,}));
              }
              context.pop();
              bloc..add(Refresh());
            },
          ),
          SizedBox(height: 8,)
        ],
      ),);
  }
}
