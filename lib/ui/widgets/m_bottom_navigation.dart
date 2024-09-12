import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import 'm_bottom_navigation.dart';

ScrollController scrollController = ScrollController(keepScrollOffset: true);

class MBottomNavigation extends StatelessWidget {
  final List<MDrawerItem> items;
  final Widget? header;

  const MBottomNavigation({Key? key, required this.items, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.getWPercent(22);

    int index = -1;
    for (var item in items) {
      final isSelected = item.route == ModalRoute.of(context)?.settings.name;
      if (isSelected) {
        index = items.indexOf(item);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            width * index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          );
        });
      };
    }
    if (index < 0) {
      return dummyBuilder(context);
    }
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width * items.length,
            child: BottomNavigationBar(
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
              type: BottomNavigationBarType.fixed,
              items: List.generate(items.length, (i) {
                final item = items[i];
                return BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      item.icon,
                    ),
                  ),
                  label: item.label.toUpperCase(),
                );
              }),
              onTap: (i) {
                final item = items[i];
                if (ModalRoute.of(context)?.settings.name != item.route) {
                  context.managedPush(item.route);
                }
              },
              currentIndex: index,
            ),
          )
        ],
      ),
    );
  }

  Widget dummyBuilder(BuildContext context) {
    final width = context.getWPercent(22);
    return SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              width: width * items.length,
              child: BottomNavigationBar(
                selectedItemColor: Colors.white54,
                selectedLabelStyle: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedLabelStyle,
                items: List.generate(items.length, (i) {
                  final item = items[i];
                  return BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        item.icon,
                      ),
                    ),
                    label: item.label.toUpperCase(),
                  );
                }),
              ))
        ]));
  }
}
