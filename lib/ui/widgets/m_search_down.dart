import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class MSearchDown<T> extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Function(T?)? onChanged;
  final Future<List<T>?> Function(String) onSearched;
  final String? label, hint, labelKey, subTitleKey;
  final T? value;
  final bool required;
  const MSearchDown({this.controller, required this.onSearched, this.label, this.labelKey, this.value, this.hint, Key? key, this.onChanged, this.subTitleKey, this.suffixIcon, this.prefixIcon, this.required = true}) : super(key: key);

  @override
  State<MSearchDown<T>> createState() => _MSearchDownState<T>();
}

class _MSearchDownState<T> extends State<MSearchDown<T>> {
  T? value;
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();

  final List<T> items = [];

  @override
  void initState() {
    value = widget.value;
    super.initState();
    focus.addListener(() {
      if(mounted){
        setState((){
          visible = focus.hasFocus;
        });
      }
    });
  }

  bool visible = false, waiting = false;
  bool? empty;

  @override
  Widget build(BuildContext context) {
    final tiny = items.length < 7;

    return PortalTarget(
      visible: visible,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: visible ? () => setState((){visible = false;}) : null,
        child: Material(
          type: MaterialType.card,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(waiting) const ShimmerList(length: 1, padding: EdgeInsets.all(16), height: 56,),
              if( items.isEmpty && !waiting && controller.text.trim().isNotEmpty) NothingWidget(
                message: 'No ${widget.label?.replaceAll('Search by ', '')} found "${controller.text}"',
                title: 'No Result',
                icon: CupertinoIcons.search,
              ),
              SizedBox(
                height: tiny ? null : context.width,
                child: ListView.separated(
                  shrinkWrap: tiny,
                  itemBuilder: (c, i){
                  final e = items[i];
                  return ListTile(
                    title: Text('${widget.labelKey != null && e is Map ? e[widget.labelKey] : e}'),
                    subtitle: widget.subTitleKey != null ? Text('${e is Map ? e[widget.subTitleKey] : e}') : null,
                    onTap: (){
                    setState((){
                      value = e;
                      widget.onChanged?.call(value);
                      controller.text = '${widget.labelKey != null && e is Map ? e[widget.labelKey] : e}';
                      focus.unfocus();
                      visible = false;
                    });
                  },);
                }, itemCount: items.length, separatorBuilder: (BuildContext context, int index) { return const Divider(height: 0.7,); },),
              ),

            ],
          ),
        ),
      ),
      anchor: const Aligned(
        follower: Alignment.topLeft,
        target: Alignment.bottomLeft,
        widthFactor: 1,
      ),
      child: MTextField(
        controller:widget.controller??controller,
        focusNode: focus,
        onChanged: (d) async {

          setState((){
            waiting = true;
          });
          final res = await widget.onSearched(d);
          if(res != null){
            setState((){
              visible = true;
              items.clear();
              items.addAll(res);
              waiting = false;
              empty = items.isEmpty;
            });
          } else {
            setState((){
              items.clear();
              waiting = false;
            });
          }

        },
        required: widget.required,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hint: widget.hint,
        label: widget.label,
      ),
    );
  }
}