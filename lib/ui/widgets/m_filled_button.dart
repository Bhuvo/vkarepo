import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class MFilledButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final bool? isLoading;
  final MaterialStateProperty<Color?>? backgroundColor;
  const MFilledButton(
      {super.key,
      this.text,
      this.onPressed,
      this.isLoading,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: FilledButton(
            key: ValueKey('value$isLoading'),
            onPressed: (isLoading ?? false) ? null : onPressed,
            style: ButtonStyle(
                backgroundColor:
                    backgroundColor ?? MaterialStateProperty.all(Colors.green)),
            child: (isLoading ?? false) ? LoadingWidget() : Text(text ?? '')));
  }
}
