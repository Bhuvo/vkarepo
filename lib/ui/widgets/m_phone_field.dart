import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'm_text_field.dart';

class MPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Function(String)? onChanged, onCodeChanged;
  final String? label, hint, value, code;
  final int maxLines, minLines;
  final bool required;
  const MPhoneField({this.controller,this.label,
    this.maxLines = 1, this.minLines = 1,
    this.value, this.hint, Key? key, this.onChanged, this.code ='+91', this.onCodeChanged, this.suffixIcon, this.required = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MTextField(
      controller: controller,
      value: value,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      required: required,
      suffixIcon: suffixIcon,
      type: MInputType.phone,
      hint: hint,
      label: label,
      prefixIcon: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(MTheme.RADIUS),
              onTap: (){},
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16,),
                  Text('$code', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey.shade700, fontSize: 17),),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 28, color: Theme.of(context).textTheme.headlineSmall?.color,),
                  const SizedBox(width: 8,),
                  Container(
                    height: 50,
                    width: 1.5,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
