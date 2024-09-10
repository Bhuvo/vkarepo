import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class FollowUpFeeItem extends StatelessWidget {
  final EdgeInsets margin;
  const FollowUpFeeItem({Key? key, this.margin = const EdgeInsets.all(0)}) : super(key: key);

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
                  UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'Duration Days:', iconSize: 16,),
                  Text('13:31:00 - 23:31:00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                ],
              ),
              const SizedBox(height: 8,),
              Wrap(
                children: [
                  UserInfo(Info.custom, icon: FontAwesomeIcons.indianRupeeSign, lable: 'Fee:', iconSize: 16,),
                  Text('100', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                ],
              ),
            ],
          )),
          const SizedBox(width: 16,),
          MIconButton(child: Icon(Icons.delete_outline, color: Colors.red, size: 20,),
            color: Colors.red,
            padding: EdgeInsets.all(4),
            onTap: (){},
          ),
        ],
      ),);
  }
}
