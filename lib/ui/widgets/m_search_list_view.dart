import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MSearchListView extends StatelessWidget {
  final ScrollController? controller;
  final TextEditingController? searchController;
  final Function(String?)? onChanged;
  final double paddingTop;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final String label;
  final Future<void> Function()? onRefresh;
  final int? itemCount;
  const MSearchListView({Key? key , this.onRefresh, this.padding, this.onChanged, this.shrinkWrap = false, this.paddingTop = 32, this.label = 'Search', this.controller, this.searchController, required this.itemBuilder, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(

        controller: controller,
        headerSliverBuilder: (_, __){
      return [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 56 + paddingTop,
          title: Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: MTextField(
              controller: searchController,
              onChanged: onChanged,
              label: label,
              suffixIcon: Icon(CupertinoIcons.search),
            ),
          ),
        )
      ];
    }, body: RefreshIndicator(
        onRefresh: onRefresh ?? () async {
          return;
        },
        child: ListView.builder(itemBuilder: itemBuilder, itemCount: itemCount, shrinkWrap: shrinkWrap, padding: padding,)));
  }
}
