import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MCounterField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Function(int?)? onChanged;
  final String? label, hint;
  int? value;
  final bool required;
  MCounterField({this.controller,this.label, this.value, this.hint, Key? key, this.onChanged, this.prefixIcon, this.required = true}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MTextField(

      //controller: TextEditingController(text: '${value ?? ''}'),
      value: '${value ?? ''}',
      onChanged: (d){
        value = int.tryParse(d) ?? 0;
        onChanged?.call(value);
      },
      hint: hint,
      label: label,
      required: required,
      prefixIcon: prefixIcon,
      type: MInputType.numeric,
      suffixIcon: Column(
        children: [
          InkWell(onTap: (){
            value = (value ?? 0) + 1;
            onChanged?.call(value);
          }, child: Icon(Icons.arrow_drop_up, color: Colors.grey.shade800,)),
          InkWell(onTap: (){
            if((value ?? 0) > 0){
              value = (value ?? 0) - 1;
              onChanged?.call(value);
            }
          }, child: Icon(Icons.arrow_drop_down,  color: Colors.grey.shade800)),
        ],
      ),
    );
  }
}
