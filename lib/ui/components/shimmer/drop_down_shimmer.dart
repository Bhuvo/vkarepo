import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class DropDownShimmer extends StatelessWidget {
  final String label;
  const DropDownShimmer({Key? key, this.label = 'Select'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Theme.of(context).canvasColor,
      baseColor: Theme.of(context).backgroundColor,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(bottom: 8),
        child: DropdownButtonFormField<String>(onChanged: (value) {  }, items: [],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            ),
            labelText: label,
            filled: false
          ),
        ),
      ),
    );
  }
}