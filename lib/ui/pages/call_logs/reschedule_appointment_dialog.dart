import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/user.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';

class RescheduleAppointmentDialog extends StatefulWidget {
  final DateTime? RescheduleAppointmentDate;
  final patientdata;
   RescheduleAppointmentDialog({Key? key,required this.RescheduleAppointmentDate,required this.patientdata}) : super(key: key);

  @override
  State<RescheduleAppointmentDialog> createState() => _RescheduleAppointmentDialogState();
}

class _RescheduleAppointmentDialogState extends State<RescheduleAppointmentDialog> {
  String value = Consts.INSTANT;
  DateFormat dateFormatdate = DateFormat("dd-MMMM-yyyy");
  DateFormat dateFormattime = DateFormat("hh:mm a");
  DateFormat dateFormattimeforapi = DateFormat("hh:mm:ss");



  @override
  Widget build(BuildContext context) {
    final user = User(
        fullName: widget.patientdata.User_Name,
        userId:widget.patientdata.User_id,
        phoneNumber: widget.patientdata.MobileNumber);

    return MDialog(
      child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
         MListTile(child: UserProvider(
           data: Consts.DUMMY_USER.copyWith(fullName: 'Dr Koushik Muthu Raja M'),
           child: UserTile(
             caption: Row(
               children:  [
                 SizedBox(height: 20,),
                 UserInfo(Info.custom, icon: Icons.date_range_rounded, lable:  "${dateFormatdate.format(widget.RescheduleAppointmentDate as DateTime)}", textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
                 UserInfo(Info.custom, icon: CupertinoIcons.clock, lable: '${dateFormattime.format(widget.RescheduleAppointmentDate as DateTime)}', textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
               ],
             ),
           ),
         ), margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), color: MTheme.THEME_COLOR.withOpacity(0.05), background: Theme.of(context).cardColor,),
         MListTile(child: Column(
           children: [
             UserTile(
               crossAxisAlignment: CrossAxisAlignment.start,
               avatarRadius: 16,
               caption: Row(
                 children: [
                   SizedBox(height: 20,),
                   Text('Patient ID: ', style: Theme.of(context).textTheme.bodySmall,),
                   Text(widget.patientdata.User_id.toString(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: MTheme.THEME_COLOR, fontWeight: FontWeight.w700),),
                   UserInfo(Info.custom, icon: Icons.date_range_rounded, lable: widget.patientdata.Appointment_Date.toString(), textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
                   UserInfo(Info.custom, icon: CupertinoIcons.clock, lable: widget.patientdata.Appointment_Time.toString(), textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
                 ],
               ),
             ),
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Colors.red
               ),
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
               margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(),
                   Text('Reschedule Date & Time', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                   const SizedBox(height: 8,),
                   Row(
                     children: [
                       UserInfo(Info.custom, icon: Icons.date_range_rounded, lable: '${dateFormatdate.format(widget.RescheduleAppointmentDate as DateTime)}', textColor: Colors.white, textSize: 14, iconSize: 16,),
                       UserInfo(Info.custom, icon: CupertinoIcons.clock, lable: '${dateFormattime.format(widget.RescheduleAppointmentDate as DateTime)}' , textColor: Colors.white, textSize: 14, iconSize: 16,),
                     ],
                   )
                 ],
               ),
             )
           ],
         ), margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),),
          SizedBox(
            width: double.maxFinite,
            height: 50,
            child: OutlinedButton(
              child: const Text('Reschedule Appointment'),
              onPressed: ()async{
                final call = Injector().apiService.get(path: 'Update_Reschedule', query: {
                  'Appointment_Id': "157224",
                  'Date': "${dateFormatdate.format(widget.RescheduleAppointmentDate as DateTime)}",
                  'Time': '${dateFormattimeforapi.format(widget.RescheduleAppointmentDate as DateTime)}'
                });

                final res = await showWaitingDialog(context: context, call: call);
                print("RESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS${res?.body}");
                if(res?.body!=null)
                {
                  context.popDialog();
                }

              },
            ),
          )
        ],
      ),
    ), title: Row(
      children: [
        const Text(Consts.RESCHEDULE_APPOINTMENT),
        const Spacer(),
        IconButton(onPressed: () {
          context.popDialog();
        }, icon: const Icon(Icons.close_rounded))
      ],
    ),);
  }
}
