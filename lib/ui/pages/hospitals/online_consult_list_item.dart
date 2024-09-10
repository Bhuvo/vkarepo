import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/get_hospital_timing_by_doctor_hospital.dart';
import '../../../utils/local_storage.dart';
import '../../components/waiting_dialog.dart';
import 'edit_online_schedule_dialog.dart';

class OnlineConsultListItem extends StatelessWidget {
  ApiBuilderBloc bloc;
  GetHospitalTimingByDoctorHospital getDoctorTime;
  final DocID;
   OnlineConsultListItem({Key? key,required this.getDoctorTime, this.DocID, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      data: Consts.DUMMY_USER.copyWith(fullName: 'Kumaresan Clinic'),
      child: MListTile(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'From Time:', iconSize: 16,),
                    Text('${getDoctorTime.fromTime}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                  ],
                ),
                SizedBox(height: 8,),
                Wrap(
                  children: [
                    UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'To Time:', iconSize: 16,),
                    Text('${getDoctorTime.toTime}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                  ],
                ),
                SizedBox(height: 8,),
                Wrap(
                  children: [
                    UserInfo(Info.custom, icon: FontAwesomeIcons.solidCalendarCheck, lable: 'Days:', iconSize: 16,),
                    Text('${getDoctorTime.day}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                  ],
                ),
              ],
            )),
            MIconButton(child: Icon(Icons.edit, color: MTheme.THEME_COLOR, size: 20,),
              color:MTheme.THEME_COLOR,
              padding: EdgeInsets.all(4),
              onTap: (){
                showDialog(context: context, builder: (c) =>  EditOnlineScheduleDialog(bloc: bloc,getDoctorTime: getDoctorTime,DocID: DocID,));

              },
            ),
            const SizedBox(width: 16,),
            MIconButton(child: Icon(Icons.delete_outline, color: Colors.red, size: 20,),
              color: Colors.red,
              padding: EdgeInsets.all(4),
              onTap: ()async{

                final call = Injector().apiService.get2(
                    path: 'DeleteOnlineRecord',
                    query: {
                      'VideoTiming_id':'${getDoctorTime.videoTimingId}',
                      'DoctorId': DocID});
                final res = await showWaitingDialog(
                    context: context, call: call);
                if (res?.body.message == "Deleted") {
                  bloc.add(const Refresh());
                }

              },
            ),
          ],
        ),),
    );
  }
}
