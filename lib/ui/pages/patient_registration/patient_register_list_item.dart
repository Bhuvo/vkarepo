import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/user_age_gender.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class PatientRegisterListItem extends StatelessWidget {
  const PatientRegisterListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = PatientProvider.of(context);
    return MListTile(
      onTap: (){},
      actions: [
        CustomSlidableAction(
          padding: const EdgeInsets.all(0),
          onPressed: (_) async {
            final res = await context.push(Routes.patientRegistration, data);
            if(res != null) {
              context.read<ApiBuilderBloc>().add(const Refresh());
            }
          },
          backgroundColor: Colors.transparent,
          child: const MIconButton(
            color: MTheme.THEME_COLOR,
            child: Icon(Icons.edit, color: MTheme.THEME_COLOR,),
          ),
        )
      ],
      child: Column(
        children: [
          const UserTile(
            caption: UserAgeGender(),
            trailing: UserInfo(Info.id),
          ),
          MGradientContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 8,
                  children: const [
                    UserInfo(Info.email),
                    UserInfo(Info.key),
                    UserInfo(Info.phone),
                    UserInfo(Info.whatsapp),
                  ],
                ),
                const Divider(indent: 0, endIndent: 0,),
                Wrap(
                  children: [
                    const Text('Target INR to:', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),),
                    const SizedBox(width: 8,),
                    Text('${data?.inrFrom} - ${data?.inrTo}', style: TextStyle(color: Colors.red.shade500, fontSize: 14, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
