import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';


class MTabBar extends StatelessWidget {
  final Function(int)? onTap;
  final TabController controller;
  final List<String> tabs;
  final bool pill;
  final double padding, labelPadding, radius;
  final Color? fillColor;
  final Color? contentColor;
  final bool scrollable;
  final TabBarIndicatorSize indicatorSize;

  const MTabBar(this.controller, this.tabs,
      {
        Key? key,
        this.fillColor,
        this.contentColor,
        this.pill = false,
        this.padding = 0.0,
        this.radius = 80,
        this.labelPadding = 16.0,
        this.scrollable = true, this.indicatorSize = TabBarIndicatorSize
          .tab, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: Colors.black.withOpacity(0.5),
      color: fillColor ?? Theme.of(context).cardColor,
      borderRadius: pill ? BorderRadius.circular(radius) : BorderRadius.circular(32),
      clipBehavior: Clip.antiAlias,
      child: TabBar(

        padding: EdgeInsets.symmetric(horizontal: padding),
        controller: controller,
        indicator: pill ? BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: MTheme.ICON_COLOR) : null,
        tabs: List.generate(
            tabs.length,
                (i) =>
                    Tab(
                      text: tabs[i],
                    )),
        labelPadding: EdgeInsets.symmetric(horizontal: labelPadding),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        labelColor: pill ? null : contentColor ?? MTheme.THEME_COLOR,
        unselectedLabelColor: Theme.of(context).textTheme.bodySmall?.color,
        isScrollable: scrollable,
        indicatorColor: contentColor ?? MTheme.ICON_COLOR,
        indicatorSize: indicatorSize,
        indicatorWeight: 3,
        onTap: (value) {
         onTap?.call(value);
;        },
      ),

    );
  }
}
