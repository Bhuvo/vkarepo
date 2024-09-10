import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MPinField extends StatelessWidget {

  final Function(String)? onChanged;
  final Function(String)? onComplete;
  final TextEditingController? controller;
  final int length;
  const MPinField({Key? key, this.onChanged, this.controller, this.onComplete, this.length = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      autofocus: true,
      controller: controller,
      onCompleted: onComplete,
      onChanged: onChanged,
      length: length,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],

      defaultPinTheme: PinTheme(
        textStyle: Theme.of(context).textTheme.headlineSmall,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(
          minWidth: 60
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(MTheme.RADIUS)
        ),
      ),
      focusedPinTheme: PinTheme(
          textStyle: Theme.of(context).textTheme.headlineSmall,
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
              minWidth: 60
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(MTheme.RADIUS)
        )
      ),
    );
  }
}
