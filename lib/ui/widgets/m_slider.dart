import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MSlider extends StatelessWidget {
  final double value, min, max;
  final Function(double) onChanged;
  final String? label;
  final Widget Function(double)? valueBuilder;

  const MSlider(
      {Key? key,
      required this.onChanged,
      required this.value,
      this.label,
      this.valueBuilder,
      this.max = 100,
      this.min = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(MTheme.RADIUS),
          color: Theme.of(context).cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: Row(
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 16),
                  ),
                const Spacer(),
                if (valueBuilder != null) valueBuilder!.call(value)
              ],
            ),
          ),
          SizedBox(
            height: 36,
            child: Slider(
              value: value,
              onChanged: onChanged,
              max: max,
              min: min,
              divisions: 1000,
              activeColor: MTheme.THEME_COLOR,
              inactiveColor: Theme.of(context).dividerColor,
              thumbColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
