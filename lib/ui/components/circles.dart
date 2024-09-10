import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class Circles extends StatelessWidget {
  final Color color;
  final Widget child;
  final int count;
  final double gap;
  const Circles({Key? key, this.color = MTheme.THEME_COLOR, this.count = 4, this.gap = 5, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = circle(child: child, opacity: 1);
    for(int i = count; i > 1 ; i --){
      body = circle(child: body);
    }
    return body;
  }

  Widget circle({required Widget child, double opacity = 0.2}){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(opacity),
      ),
      margin: EdgeInsets.all(gap),
      child: child,
    );
  }
}
