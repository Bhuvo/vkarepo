import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MInputType {
  text,
  numeric,
  decimal,
  email,
  phone,
  password,
  visiblePassword
}

extension MInputTypeExtension on MInputType {
  TextInputType keyboardType() {
    switch (this) {
      case MInputType.text:
        return TextInputType.name;
      case MInputType.numeric:
        return TextInputType.number;
      case MInputType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case MInputType.email:
        return TextInputType.emailAddress;
      case MInputType.phone:
        return TextInputType.phone;
      case MInputType.password:
        return TextInputType.visiblePassword;
      case MInputType.visiblePassword:
        return TextInputType.visiblePassword;
    }
  }
}

class MTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon, labelWidget;
  final Function(String)? onChanged;
  final MInputType type;
  final String? label, hint, value;
  final int maxLines, minLines;
  final int? maxLength;
  final bool required;
  final bool enabled;
  final FocusNode? focusNode;

  const MTextField(
      {this.controller,
      this.label,
      this.maxLines = 1,
      this.minLines = 1,
      this.focusNode,
      this.maxLength,
      this.value,
      this.hint,
      this.type = MInputType.text,
      Key? key,
      this.labelWidget,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.required = true,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      initialValue: value,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: type.keyboardType(),
      obscureText: type == MInputType.password,
      validator: (s) {
        if (required && s!.isEmpty) return '$label is required.';
        if (type == MInputType.phone && s!.length != 10)
          return 'Invalid $label';
        if (type == MInputType.email) {
          bool valid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(s!);
          if (!valid) return 'Invalid $label';
        }
        return null;
      },
      maxLength: type == MInputType.phone ? 10 : maxLength,
      inputFormatters: [
        if (type == MInputType.numeric || type == MInputType.phone)
          FilteringTextInputFormatter.digitsOnly,
        if (type == MInputType.decimal)
          FilteringTextInputFormatter.allow(RegExp('[[0-9]|\\.|[0-9]]')),
        if (type == MInputType.email)
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: minLines > 1
              ? const EdgeInsets.symmetric(horizontal: 15, vertical: 24)
              : null,
          label: labelWidget ?? Text(label ?? ''),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14),
          counter: const SizedBox(
            height: 0,
          )),
    );
  }
}
