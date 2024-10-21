import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MListTile extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color, background, borderColor,shadow;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final double? width, height;
  final bool animate;
  final List<CustomSlidableAction>? actions;
  final BoxConstraints? constraints;

  const MListTile(
      {Key? key,
      required this.child,
      this.onTap,
      this.color,
      this.height,
      this.animate = true,
      this.constraints,
      this.background,
      this.borderColor,
      this.actions,
      this.padding,
      this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      this.width, this.shadow})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final body = Container(
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(MTheme.RADIUS)),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(MTheme.RADIUS),
              onTap: onTap,
              child: Padding(
                  padding: padding ?? const EdgeInsets.all(0),
                  child: child))),
    );
    final container = Container(
      constraints: constraints,
      decoration: BoxDecoration(
          border: Border.all(color: (borderColor ?? Theme.of(context).dividerColor).withOpacity(0.01)),
          boxShadow: [
            BoxShadow(
                color: shadow?? Colors.grey.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 4,
                offset: Offset(0, 4)
            )
          ],
          color: background ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(MTheme.RADIUS)),
      margin: margin,
      width: width,
      height: height,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(MTheme.RADIUS),
        child: actions == null ? body : Slidable(
          endActionPane: ActionPane(
            extentRatio: (actions?.length ?? 0) * 0.2,
            motion: const DrawerMotion(),
            children: actions!,
          ),
          child: body,
        ),
      ),
    );
    if(!animate) return container;
    return MDelayedAnimation(
      child: container,
    );
  }
}
