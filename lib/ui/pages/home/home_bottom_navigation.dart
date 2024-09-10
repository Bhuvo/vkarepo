import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class HomeBottomNavigation extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? appBarBottom;
  final double paddingTop;
  final List<Widget>? actions;
  const HomeBottomNavigation({Key? key, required this.body, required this.title, this.appBarBottom, this.paddingTop = 56, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text(title.toUpperCase()),
      paddingTop: paddingTop,
      actions: actions,
      bottom: const MBottomNavigation(
        key: ValueKey('bottomnav'),
        items: Consts.BOTTOM_NAVIGATION_ITEMS,
      ),
      body: body,
      appBarBottom: appBarBottom,
    );
  }
}
