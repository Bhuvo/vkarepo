import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMap extends StatelessWidget {
  ShimmerMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (0.7) * (op.nextInt(5) / 2.5),
      child: Transform.scale(
        scale: 1.5,
        child: Shimmer.fromColors(
          highlightColor: Theme.of(context).highlightColor,
          baseColor: Theme.of(context).dividerColor,
          child: Column(
            children: getChilds(context, 0),
          ),
        ),
      ),
    );
  }


  List<Widget> getChilds(BuildContext context, int level){
    final c = level == 0 ? 3 :op.nextInt(5);
    List<Widget> list = [];

    for(int i = 0; i <= c; i ++){
      if(level > 5) return list;
      if(isChild()){
        list.add(expand(container(context)));
      } else if(isRow()){
        list.add(expand(Row(children: getChilds(context, level + 1),)));
      } else {
        list.add(expand(Column(children: getChilds(context, level + 1),)));
      }
    }

    return list;
  }

  final Random op = Random();

  bool isRow() => op.nextBool();
  bool isChild() => op.nextBool();

  Widget container(BuildContext context){
    final o = op.nextInt(10) / 13;
    return Container(
      //margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Theme.of(context).canvasColor.withOpacity(o),
          //borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget expand(Widget child){
    final e = op.nextInt(3);
    return Expanded(flex: e == 0? 1 : e,child: child,);
  }
}
