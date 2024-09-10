import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class ShimmerList extends StatelessWidget {
  final int length;
  final double height;
  final EdgeInsets padding;
  const ShimmerList({Key? key, this.length = 10, this.height = 80, this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 32)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Theme.of(context).highlightColor,
      baseColor: Theme.of(context).dividerColor,
      child: ListView(
        padding: padding,
        shrinkWrap: true,
        children: List.generate(length, (i) => ShimmerListItem(height: height,)),
      ),
    );
  }
}

class ShimmerListItem extends StatelessWidget {
  final double height;
  const ShimmerListItem({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8)
      ),
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: height * 0.75,
            height: height * 0.75,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor.withOpacity(0.7),
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(width: 8,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5)
                ),
                width: context.getWPercent(30),
                height: 13,
              ),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)
                ),
                width: context.getWPercent(20),
                height: 13,
              ),
            ],
          )
        ],
      ),
    );
  }
}

