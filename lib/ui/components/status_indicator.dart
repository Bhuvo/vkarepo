import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String label;
  final Color color, textColor;
  final bool bold;
  final bool allCaps;
  final EdgeInsets padding;
  final double radius;
  const StatusIndicator({Key? key,this.allCaps = true, this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 2) , required this.label, this.color = Colors.amber, this.radius = 2.0, this.textColor = Colors.black87, this.bold = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)
      ),
      child: Text(allCaps ? label.toUpperCase() : label, style: TextStyle(fontSize: 11, fontWeight: bold ? FontWeight.w700 : FontWeight.w600, color: textColor), maxLines: 1,),
    );
  }
}
