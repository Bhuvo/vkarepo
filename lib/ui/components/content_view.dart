import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class ContentView extends StatelessWidget {
  final String label, content;
  final IconData? icon;
  final bool isExpanded;

  const ContentView(
      {Key? key,
      required this.content,
      required this.label,
      this.icon,
      this.isExpanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            content,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.018),
          ),
        ),
      ],
    );

    final container = Container(
      width: !isExpanded ? double.maxFinite : null,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(MTheme.RADIUS),
          color: Theme.of(context).cardColor),
      child: icon == null
          ? body
          : Row(
              children: [
                FaIcon(
                  icon!,
                  color: MTheme.ICON_COLOR,
                  size: MediaQuery.of(context).size.height * 0.022,
                ),
                const SizedBox(
                  width: 8,
                ),
                body
              ],
            ),
    );

    if (!isExpanded) return container;
    return Expanded(child: container);
  }
}

class ContentView2 extends StatelessWidget {
  final String label, content;
  final IconData? icon;
  final bool isExpanded;

  const ContentView2(
      {Key? key,
      required this.content,
      required this.label,
      this.icon,
      this.isExpanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 13, color: MTheme.THEME_COLOR),
        ),
      ],
    );

    final container = Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: icon == null
          ? body
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon!,
                  color: MTheme.ICON_COLOR,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                body
              ],
            ),
    );

    if (!isExpanded) return container;
    return Expanded(child: container);
  }
}

class ContentView3 extends StatelessWidget {
  final String label, content;
  final IconData? icon;

  const ContentView3(
      {Key? key,
      required this.content,
      required this.label,
      this.icon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
        ),
      ],
    );

    final container = Container(
      padding:EdgeInsets.only(bottom: 2),
      child: icon == null
          ? body
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon!,
                  color: MTheme.ICON_COLOR,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                body
              ],
            ),
    );
    return container;
  }
}
