import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/pages/auth/logout.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import '../../../const/consts.dart';
import '../../widgets/widgets.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = LocalStorage.getUser();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          //UserAvatar(radius: 26,),
          Container(
            width: 26 * 2,
            height: 26 * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Theme.of(context).dividerColor,
                border: Border.all(color: Colors.white)
                //boxShadow: MTheme.SHADOW_LIGHT
                ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_alt,
                    size: 26 * 1.5,
                    color: Colors.white70,
                  ),
                  if (user != null && user.image != null)
                    CachedNetworkImage(
                      imageUrl:
                          '${Consts.IMAGE_DOCTOR_BASE_URL}${user.image ?? ''}',
                      fit: BoxFit.cover,
                      width: 26 * 2,
                      height: 26 * 2,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppConfig.of(context)?.config == Config.patient ? '${LocalStorage.getCursorPatient().patientName}':LocalStorage.isNurse ? '${user.fullName ?? 'Vicky'}':'${user.fullName ?? 'Vicky'}',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Spacer(),
          // MIconButton(child: const Icon(Icons.manage_accounts), onTap: (){
          //
          // },),
          const SizedBox(
            width: 16,
          ),
          MIconButton(
            child: const Icon(
              FontAwesomeIcons.rightFromBracket,
              size: 20,
            ),
            onTap: () {
              logOut(context);
            },
          ),
        ],
      ),
    );
  }
}
