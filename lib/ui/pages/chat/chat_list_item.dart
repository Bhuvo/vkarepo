import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/thread.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/date_utils.dart';

class ChatListItem extends StatelessWidget {
  final Thread data;
  const ChatListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const patient = Consts.DUMMY_USER;
    final doctor = Consts.DUMMY_USER.copyWith(fullName: 'Dr. Koushik Muthu Raja M');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(!data.mine) const SizedBox(width: 8,) else const SizedBox(width: 100,),
        if(!data.mine) buildAvatar(),
        Flexible(
          child: Column(
            crossAxisAlignment: data.mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text('${data.mine ? patient.fullName : doctor.fullName}', style: TextStyle(color: MTheme.THEME_COLOR, fontSize: 12,  fontWeight: FontWeight.w600 ),),
              Text('${MDateUtils.dateToHourMinute(data.date.toIso8601String())}', style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 10,  fontWeight: FontWeight.w600 ),),
              const SizedBox(height: 4,),
              buildContent(),
              const SizedBox(height: 16,),
            ],
          ),
        ),
        if(data.mine) buildAvatar(),
        if(data.mine) const SizedBox(width: 8,) else const SizedBox(width: 100,),
      ],
    );
  }
  Widget buildAvatar(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: UserAvatar(
        radius: 16,
      ),
    );
  }
  Widget buildContent(){
    const radius = Radius.circular(5);
    const zero = Radius.circular(0);

    final borderRadius = BorderRadius.only(
      topLeft: data.mine ? radius : zero,
      topRight: data.mine ? zero : radius,
      bottomLeft: radius,
      bottomRight: radius,
    );

    return Material(
      borderRadius: borderRadius,
        color: data.mine ? MTheme.THEME_COLOR : Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shadowColor: Colors.grey.shade50,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(data.content, style: TextStyle(color: data.mine ? Colors.white : Colors.black87, fontSize: 12),)),
    );
  }

}
