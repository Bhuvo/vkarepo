import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../utils/local_storage.dart';
import '../call/call_actions.dart';

class HomeBottomNavigation extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? appBarBottom;
  final double paddingTop;
  final List<Widget>? actions;
  final CallActions? floatingActionButton;
   HomeBottomNavigation({Key? key, required this.body, required this.title, this.appBarBottom, this.paddingTop = 56, this.actions, this.floatingActionButton}) : super(key: key);

   var IsType = LocalStorage.getString(LocalStorage.IsType);


  @override
  Widget build(BuildContext context) {
    print('isDoctor $IsType');
    return MScaffold(
      title: Text(title.toUpperCase()),
      paddingTop: paddingTop,
      actions: actions,
      bottom: MBottomNavigation(
        key: ValueKey('bottomnav'),
        items: IsType == Consts.nurse || IsType == Consts.frontOffice ? Consts.NURSE_BOTTOM_NAVIGATION_ITEMS : Consts.BOTTOM_NAVIGATION_ITEMS,
      ),
      body: body,
      appBarBottom: appBarBottom,
      // floatingActionButton:floatingActionButton,
      float:floatingActionButton,
    );
  }
}
