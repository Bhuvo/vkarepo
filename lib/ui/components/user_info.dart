import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class UserInfo extends StatelessWidget {
  final Info type;
  final IconData? icon;
  final Color? textColor;
  final String? lable;
  final double iconSize, textSize;

  const UserInfo(this.type,
      {Key? key,
      this.icon,
      this.lable,
      this.textColor,
      this.iconSize = 18,
      this.textSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context);
    final patient = PatientProvider.of(context);

    late final Widget icon, text;

    switch (type) {
      case Info.email:
        icon = Icon(
          Icons.mail,
          color: MTheme.ICON_COLOR,
          size: iconSize,
        );
        text = Text(
          '${user?.email ?? user?.emailId ?? patient?.email}',
        );
        break;
      case Info.phone:
        // print('hhs ${patient?.toJson()}');
        icon = Icon(Icons.phone, color: MTheme.ICON_COLOR, size: iconSize);
        text = Text(
          '${ patient?.phone??patient?.whatsapp ??user?.phone ?? user?.phoneNumber }',
        );
        break;
      case Info.whatsapp:
        icon = Icon(FontAwesomeIcons.whatsapp,
            color: Colors.green, size: iconSize);
        text = Text(
          '${user?.whatsapp ?? patient?.whatsapp}',
        );
        break;
      case Info.id:
        icon = Icon(FontAwesomeIcons.userCheck,
            color: MTheme.ICON_COLOR, size: iconSize * 0.8);
        text = Text('${user?.id ?? patient?.regNo}',
            style: const TextStyle(
                color: MTheme.THEME_COLOR, fontWeight: FontWeight.w600));
        break;
      case Info.key:
        icon = Icon(FontAwesomeIcons.key,
            color: MTheme.ICON_COLOR, size: iconSize * 0.8);
        text = Text(
          '${user?.id ?? user?.password ?? patient?.password}',
        );
        break;
      case Info.custom:
        icon = Icon(this.icon, color: MTheme.ICON_COLOR, size: iconSize);
        text = Text(
          '$lable',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.016,
          ),
        );
        break;
      case Info.address:
        icon = Icon(
          Icons.location_on,
          color: MTheme.ICON_COLOR,
          size: iconSize,
        );
        text = Text(
          '${user?.email ?? patient?.email}',
        );
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const SizedBox(child: VerticalDivider(color: Colors.black, width: 1, thickness: 1,), height: 24, width: 1,),
        icon,
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: DefaultTextStyle(
              style: TextStyle(
                  color: textColor ?? Colors.grey,
                  fontSize: textSize,
                  fontWeight: FontWeight.w500),
              child: text),
        ),
        if (type != Info.id)
          const SizedBox(
            width: 10,
          ),
      ],
    );
  }
}

enum Info { email, phone, whatsapp, id, key, custom, address }
