import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MMultiSelect<T> extends StatelessWidget {
  final List<T>? value;
  final Function(List<T>)? onChanged;
  final String? label;
  final double? itemWidth;
  final List<MMultiSelectItem<T>> items;

  const MMultiSelect({Key? key, required this.items, this.value, this.onChanged, this.label, this.itemWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        margin: const EdgeInsets.all(0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)...[Text('    ${label!}', style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey.shade700, fontSize: 17),),
        const SizedBox(height: 8,)
        ],
        Row(),
        Wrap(
          children: List.generate(items.length, (i){
            final item = items[i];
            final contains = value?.contains(item.value) ?? false;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  if(contains){
                    value?.remove(item.value);
                    onChanged?.call(value!);
                  } else {
                    value?.add(item.value);
                    onChanged?.call(value!);
                  }
                  print(contains);
                  print(value);
                },
                child: Container(
                  width: itemWidth,
                  // decoration: BoxDecoration(
                  //   border: Border(left: BorderSide(color: Theme.of(context).dividerColor))
                  // ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IgnorePointer(child: Transform.scale(
                          scale: 0.7,
                          child: Checkbox(value: contains, onChanged: (d){}, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,))),

                      Text('${item.label}'),
                      if(itemWidth!= null)const Expanded(child:  SizedBox(width: 8,),) else const SizedBox(width: 8,),

                      if(i < items.length - 1)Container(
                        height: 16,
                        width: 0.7,
                        color: Theme.of(context).dividerColor,
                      ),
                      const SizedBox(width: 8,),
                    ],
                  ),
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}

class MMultiSelectItem<T> {
  final IconData? icon;
  final T value;
  final String? label;
  const MMultiSelectItem({required this.value, this.label, this. icon});
}