import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timesmedlite/ui/widgets/radio_button_list.dart';
import 'package:timesmedlite/ui/widgets/space.dart';

class MRowTextRadioWidget extends StatefulWidget {
  final List<String>? options;
  final List<String>? CheckBoxOptions;
  final String? title;
  final String? selectedOption;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? enabled;
  final bool? isneedDivider;
  const MRowTextRadioWidget(
      {super.key,
      this.title,
      this.selectedOption,
      this.options,
      this.onChanged,
      this.isneedDivider = true,
      this.CheckBoxOptions,
      this.initialValue,
      this.enabled});

  @override
  State<MRowTextRadioWidget> createState() => _MRowTextRadioWidgetState();
}

class _MRowTextRadioWidgetState extends State<MRowTextRadioWidget> {
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
                  // SheetDown<String>(
                  //   value: widget.initialvalue,
                  //   //label: 'Category',
                  //   onChanged:widget.onChanged ?? (value){
                  //     setState(() {
                  //       //widget.initialvalue = value;
                  //       // data.category = value;
                  //     });
                  //   },
                  //   itemLabel: (e) => e,
                  //   items: widget.options ?? const [
                  //     'News/media',
                  //     'Sports',
                  //     'Government and politics',
                  //     'Music',
                  //     'Fashion',
                  //     'Entertainment',
                  //     'Digital creator/blogger/influencer',
                  //     'Gamer',
                  //     'Global business/brand/organization',
                  //     'Other'
                  //   ],
                  // ),
                  MRadioButtonList(
                    enabled: widget.enabled ?? true,
                    initialValue: widget.initialValue,
                    onChanged: widget.onChanged,
                    CheckBoxOptions: widget.CheckBoxOptions,
                    options: widget.options,
                    selectedValue: widget.selectedOption,
                  ),
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
        //(widget.isneedDivider ?? true ) ? Space() : Container(),
      ],
    );
  }
}
