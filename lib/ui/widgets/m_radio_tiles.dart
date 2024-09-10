import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import 'm_radio_chip.dart';

class MRadioTiles<T> extends StatelessWidget {
  final List<MRadioItem<T>> items;
  final Function(T?)? onChanged;
  final Function(T?)? onDelete;
  final T? value;

  const MRadioTiles({Key? key,
    required this.items,
    this.onChanged,
    this.onDelete,
    this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(items.length, (i) {
          final item = items[i];
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme
                        .of(context)
                        .dividerColor))),
            child: ListTile(
              onTap: (){
                onChanged?.call(item.value);
              },
              leading: Radio<T>(
                value: item.value,
                groupValue: value,
                onChanged: onChanged,
              ),
              title: Text('${item.label ?? item.value}'),
              trailing: onDelete != null ? MIconButton(
                child: Icon(Icons.delete_outline, color: Colors.red,),
                padding: EdgeInsets.all(4),
                onTap: (){
                  onDelete?.call(item.value);
                },
                color: Colors.red,) : null,
            ),
          );
        })
      ],
    );
  }
}
