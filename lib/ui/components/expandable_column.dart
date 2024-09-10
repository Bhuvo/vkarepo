import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class ExpandableColumn extends StatefulWidget {
  final int min;
  final List<Widget> children;
  const ExpandableColumn({Key? key, this.min = 5, required this.children}) : super(key: key);

  @override
  State<ExpandableColumn> createState() => _ExpandableColumnState();
}

class _ExpandableColumnState extends State<ExpandableColumn> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final len = widget.children.length;
    final can = len > widget.min;
    final vLen = expanded || !can ? len : widget.min;

    return Column(
      children: [
        ...List.generate(vLen, (i){
          return widget.children[i];
        }),
        if(vLen == 0)Container(
          width: double.maxFinite,

          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MTheme.RADIUS),
            color: Colors.white,
          ),
          child: const NothingWidget(
            title: 'Nothing to show',
            message: '',
          ),
        ),
        if(can)Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(onPressed: (){
            setState((){
              expanded = !expanded;
            });
          }, child: Text(expanded ? '  View less  ' : '  View more  '), style: TextButton.styleFrom(
              backgroundColor: MTheme.THEME_COLOR.withOpacity(0.1)
          ),),
        )
      ],
    );
  }
}
