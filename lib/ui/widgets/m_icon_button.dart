import 'package:flutter/material.dart';

class MIconButton extends StatelessWidget {

  final double radius;
  final Color color;
  final Widget child;
  final EdgeInsets padding;
  final Function()? onTap;
  final Color? solid;
  final bool forceBorder;
  const MIconButton({Key? key, this.forceBorder = false, this.radius = 32,this.padding = const EdgeInsets.all(12), this.solid, this.color = Colors.white, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: solid ?? Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: color,

        borderRadius: BorderRadius.circular(radius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              color: solid != null ? null : color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(radius),
              border: (solid != null && !forceBorder) ? null :  Border.all(color: color)),

          child: child,
        ),
      ),
    );
  }
}