import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

enum MRadioChipType { icon, radio }

class MRadioChip<T> extends StatelessWidget {
  final List<MRadioItem<T>> items;
  final Function(T)? onChanged;
  final String? label;
  final MRadioChipType type;
  final Axis direction;
  final TextStyle? labelStyle;
  final T? value;

  const MRadioChip(
      {Key? key,
      this.labelStyle,
      required this.items,
      this.direction = Axis.horizontal,
      this.type = MRadioChipType.icon,
      this.onChanged,
      this.value,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = List.generate(items.length, (i) {
      final item = items[i];
      final isSel = item.value == value;
      final child = Material(
        color: MTheme.TEXTFIELD_COLOR,
        borderRadius: BorderRadius.circular(MTheme.RADIUS),
        child: Padding(
          padding: EdgeInsets.only(right: i != (items.length - 1) ? 16 : 0),
          child: InkWell(
            onTap: onChanged != null
                ? () {
                    onChanged?.call(item.value);
                  }
                : null,
            borderRadius: BorderRadius.circular(MTheme.RADIUS),
            child: type == MRadioChipType.icon
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MTheme.RADIUS),
                      border: Border.all(
                          color: isSel ? MTheme.ICON_COLOR : Colors.grey),
                    ),
                    child: Column(
                      children: [
                        FaIcon(
                          item.icon,
                          color: MTheme.ICON_COLOR,
                          size: 28,
                        ),
                        if (item.label != null) ...[
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            item.label!,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.grey.shade800),
                          )
                        ]
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: direction == Axis.vertical
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Radio<T>(
                          value: item.value,
                          groupValue: value,
                          onChanged: (d) {
                            onChanged?.call(d!);
                          }),
                      if (item.label != null) ...[
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          item.label!,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: Colors.grey.shade800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.016,
                              ),
                        )
                      ]
                    ],
                  ),
          ),
        ),
      );
      if (direction == Axis.vertical) return child;
      return Expanded(
        child: child,
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: labelStyle ??
                Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.grey.shade700, fontSize: 17),
          ),
          const SizedBox(
            height: 8,
          )
        ],
        direction == Axis.horizontal
            ? Row(
                children: children,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
      ],
    );
  }
}

class MRadioItem<T> {
  final IconData? icon;
  final String? label;
  final T value;

  const MRadioItem({this.label, required this.value, this.icon});
}
