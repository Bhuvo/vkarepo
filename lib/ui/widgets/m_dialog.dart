import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MDialog extends StatelessWidget {
  final Widget? title, action;
  final Widget child;
  final double radius;
  final EdgeInsets padding;

  const MDialog(
      {Key? key,
      this.title,
      this.action,
      required this.child,
      this.radius = MTheme.RADIUS,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius * 1.25)),
      insetPadding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Hero(
              tag: 'TOP_SECTION',
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: MTheme.GRADIENT,
                    borderRadius: BorderRadius.circular(radius)),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(radius),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      child: Row(
                        children: [
                          if (title != null) Expanded(child: title!),
                          //const Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          child,
          if (action != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: action,
            )
        ],
      ),
    );
  }
}
