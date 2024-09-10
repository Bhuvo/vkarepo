import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'user_avatar.dart';
import 'user_info.dart';

class PatientTile extends StatelessWidget {
  const PatientTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8,),
          UserAvatar(radius: 16,),
          const SizedBox(width: 8,),
          Expanded(child: Column(children: [
            Row(
              children: [
                Expanded(child: Text('${UserProvider.of(context)?.fullName ?? ' '}', style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 15),),),
                UserInfo(Info.phone, textColor: MTheme.THEME_COLOR,)
              ],
            ),
            Divider(endIndent: 10, indent: 0, thickness: 0.5,),
            Row(
              children: [
                UserInfo(Info.email, textSize: 13, iconSize: 15,),
                Spacer(),
                MTextContent2(head: 'UHID:',content: '${UserProvider.of(context)?.userId ?? ' '}')
              ],
            )
          ],))
        ],
      ),
    );
  }
}
