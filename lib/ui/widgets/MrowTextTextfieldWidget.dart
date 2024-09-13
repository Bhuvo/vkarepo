import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timesmedlite/ui/widgets/space.dart';

class MrowTextTextFieldWidget extends StatefulWidget {
  final bool? isneedDivider;
  final TextInputType? type;
  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  const MrowTextTextFieldWidget(
      {super.key,
      this.title,
      this.onChanged,
      this.initialValue,
      this.type,
      this.isneedDivider = true,
      this.enabled,
      this.validator,
      this.maxLength,
      this.maxLines});

  @override
  State<MrowTextTextFieldWidget> createState() =>
      _MrowTextTextFieldWidgetState();
}

class _MrowTextTextFieldWidgetState extends State<MrowTextTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(),
                  Text(
                    widget.title ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Space(),
                  TextFormField(
                    onChanged: widget.onChanged,
                    keyboardType: widget.type,
                    maxLines: widget.maxLines,
                    initialValue: widget.initialValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.green.shade50,
                    ),
                    validator: widget.validator,
                  )
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        Space(),
        (widget.isneedDivider ?? true)
            ? Divider(
                thickness: 1,
                height: 3,
              )
            : Container(),
      ],
    );
  }
}
