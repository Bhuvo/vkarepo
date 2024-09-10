import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: context.getWPercent(60),
        padding: const EdgeInsets.all(40),
        child: Hero(
            tag: 'LOGO',
            child: SvgPicture.asset('assets/svg/tm_logo_w.svg', fit: BoxFit.fitWidth, color: Colors.white, height: 100, width: 100,)));
  }
}
