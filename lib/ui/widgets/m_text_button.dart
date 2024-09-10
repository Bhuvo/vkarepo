import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MTextButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function()? onPressed;
  const MTextButton({Key? key, required this.label, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Row(
      children: [
        if(icon != null)...[Icon(icon, color: MTheme.ICON_COLOR, size: 16,),
        const SizedBox(width: 4,),
        ],
        Text(label)
      ],
    ));
  }
}
