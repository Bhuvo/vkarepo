import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class PatientDetailsSelectPage extends StatelessWidget {
  const PatientDetailsSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Consts.DUMMY_USER;
    return MScaffold(
      title: Text(Consts.PATIENT_DETAILS),
      body: Column(
        children: [
          const SizedBox(height: 24,),
          UserProvider(
            data: data,
            child: MListTile(child: Column(
              children: [
                UserTile(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  caption: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age: ${data.age}'),
                      const SizedBox(height: 24,),
                      const UserInfo(Info.custom, textColor: MTheme.THEME_COLOR, icon: FontAwesomeIcons.userGroup, lable: ' Brother', iconSize: 15,),
                      const SizedBox(height: 4,),
                      const UserInfo(Info.email, textColor: MTheme.THEME_COLOR,),
                      const SizedBox(height: 4,),
                      const UserInfo(Info.phone, textColor: MTheme.THEME_COLOR,),
                      const SizedBox(height: 4,),
                      const UserInfo(Info.address, textColor: MTheme.THEME_COLOR,),
                      const SizedBox(height: 16,),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Spacer(),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: OutlinedButton(onPressed: (){}, child: Text('Select')),
          )

        ],
      ),
    );
  }
}
