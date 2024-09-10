import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class IncomingCallDialog extends StatelessWidget {
  final Map<String, dynamic> data;
  const IncomingCallDialog({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final data = Consts.DUMMY_USER;

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), title: Row(
      children: [
        const Text(Consts.INCOMING_CALL),
        const Spacer(),
        IconButton(onPressed: (){
          context.popDialog();
        }, icon: const Icon(Icons.close_rounded))
      ],
    ),
      child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 32,),
          UserAvatar(
            radius: 40,
          ),
          const SizedBox(height: 8,),
          Text('${data['Doctor_Name']}', style: TextStyle(color: MTheme.THEME_COLOR, fontWeight: FontWeight.w600),),
          Text(Consts.CALLING, style: Theme.of(context).textTheme.caption,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    MIconButton(child: Icon(Icons.phone_disabled, size: 30,), solid: Colors.red, onTap: (){
                      context.popDialog();
                    }, ),
                    Text(Consts.DECLINE, style: Theme.of(context).textTheme.caption,)

                  ],
                ),
                const SizedBox(width: 64,),
                Column(
                  children: [
                    MIconButton(child: Icon(Icons.phone, size: 30,), solid: Colors.green, onTap: (){
                      context.popDialog();
                      context.push(Routes.inAppCallPage, data);
                    },),
                    Text(Consts.ACCEPT, style: Theme.of(context).textTheme.caption,)
                  ],
                ),

              ],
            ),
          )

        ],
      ),
    ),);
  }
}
