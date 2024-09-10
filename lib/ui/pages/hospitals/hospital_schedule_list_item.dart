import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/hospitals/edit_hospital_schedule_dialog.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import '../../../model/get_hospital_timing_by_doctor_hospital.dart';
import 'add_hospital_dialog.dart';
import 'add_hospital_schedule_dialog.dart';

class HospitalScheduleListItem extends StatelessWidget {
  GetHospitalTimingByDoctorHospital getHospitalTimingMasterByDoctor;
  final DocID;
   HospitalScheduleListItem({Key? key,required this.getHospitalTimingMasterByDoctor, this.DocID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      data: Consts.DUMMY_USER.copyWith(fullName: getHospitalTimingMasterByDoctor.doctorName),
      child: MListTile(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getHospitalTimingMasterByDoctor.hospitalName, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 17, color: DefaultTextStyle.of(context).style.color)),
                const SizedBox(height: 6,),
                Wrap(
                  children: [
                    Text('Fee: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey) ,),
                    Text('₹${getHospitalTimingMasterByDoctor.doctorFee}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red) ,),
                  ],
                ),
                const SizedBox(height: 6,),
                Wrap(
                  children: [
                    UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'Interval In Mins', iconSize: 16,),
                    Text('${getHospitalTimingMasterByDoctor.setInterval}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                  ],
                )
              ],
            )),
            MIconButton(child: Icon(Icons.edit, color: MTheme.THEME_COLOR, size: 20,),
              color:MTheme.THEME_COLOR,
              padding: EdgeInsets.all(4),
              onTap: () {
               showDialog(context: context, builder: (c) =>  EditHospitalScheduleDialog(getHospitalTimingMasterByDoctor: getHospitalTimingMasterByDoctor,DocID: DocID), );
              },
            ),
            const SizedBox(width: 16,),
          ],
        ),),
    );
  }
}
