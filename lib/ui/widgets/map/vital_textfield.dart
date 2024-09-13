import 'package:flutter/material.dart';

class VitalTextField extends StatefulWidget {
  TextInputType? keyboardType;
  int? maxLines;
  double? height;
  TextEditingController controller;
  String labelText;
  String? suffixText;
  VitalTextField(
      {super.key,
      this.maxLines,
      this.keyboardType,
      this.height,
      required this.controller,
      required this.labelText,
      this.suffixText});

  @override
  State<VitalTextField> createState() => _VitalTextFieldState();
}

class _VitalTextFieldState extends State<VitalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      minLines: 1,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green.shade50,
          contentPadding: EdgeInsets.symmetric(
              vertical: widget.height ?? 0, horizontal: 10),
          labelText: widget.labelText,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Text(
                widget.suffixText ?? "",
                style: const TextStyle(fontSize: 17, color: Colors.blue),
              ))),
    );
  }
}
