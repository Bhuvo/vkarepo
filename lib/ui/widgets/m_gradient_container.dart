import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MGradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding, margin;

  const MGradientContainer(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      this.margin = const EdgeInsets.all(4)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                MTheme.THEME_COLOR.withOpacity(0.1),
                MTheme.THEME_COLOR.withOpacity(0.1),
                Colors.transparent,
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topLeft,
            )),
        child: child);
  }
}
