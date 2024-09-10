import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/string_utils.dart';

class DataAddAndSearch extends StatelessWidget {
  final String entity;
  final List<String> items;
  const DataAddAndSearch({Key? key, required this.entity, this.items = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        MTextField(
          label: pluralize(entity),
        ),
        const SizedBox(height: 8,),
        Container(
          height: 50,
          width: double.maxFinite,
          child: OutlinedButton(
            child: Text('Add'),
            onPressed: (){
              print("inside widget");
            },
          ),
        ),
        MListTile(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                const SizedBox(height: 12,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MTextField(
                    suffixIcon: Icon(CupertinoIcons.search),
                    label: 'Enter keyword here...',
                  ),
                ),
                MRadioTiles(
                  items: items.map((e) => MRadioItem(value: e)).toList(),
                  onChanged: (d){},
                  onDelete: (d){},
                ),
                const SizedBox(height: 24,),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: 'please'),
                      TextSpan(text: ' Add New $entity ', style: Theme.of(context).textTheme.caption?.copyWith(color: MTheme.THEME_COLOR)),
                      TextSpan(text: 'here.'),
                    ]
                ), style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                const SizedBox(height: 8,),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: Text('Add New $entity'),
                    onPressed: (){},
                  ),
                ),
              ],
            )

        ),
        const Divider(endIndent: 0, indent: 0, thickness: 0.5, height: 8,),
        const SizedBox(height: 8,)
      ],
    );
  }
}
