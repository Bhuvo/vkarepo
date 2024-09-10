import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class MDialogDown<T> extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Function(T?)? onChanged;
  final String? label, hint, labelKey;
  final List<T> items;
  final T? value;
  final bool required, isExpanded;

  const MDialogDown(
      {this.controller,
      this.label,
      this.labelKey,
      required this.items,
      this.value,
      this.isExpanded = false,
      this.hint,
      Key? key,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.required = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final res = await showDialog(
              context: context,
              builder: (c) => MDialogDownDialog(
                    items: items,
                    value: value,
                    title:
                        '${label.toString().toLowerCase().contains('select') ? '' : 'Select'} $label',
                    labelKey: labelKey,
                  ));
          if (res != null) {
            onChanged?.call(res);
          }
        },
        child: IgnorePointer(
          child: DropdownButtonFormField<T>(
            borderRadius: BorderRadius.circular(MTheme.RADIUS),
            value: value,
            isExpanded: isExpanded,
            onChanged: (d) {
              onChanged?.call(value);
            },
            validator: (s) {
              if (required && s != null) return '${label} is required.';
              return null;
            },
            items: items
                .map((e) => DropdownMenuItem(
                      child: Text(
                          '${labelKey != null && e is Map ? e[labelKey] : e}'),
                      value: e,
                    ))
                .toList(),
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                label: Text(label ?? ''),
                hintText: hint,
                counter: const SizedBox(
                  height: 0,
                )),
          ),
        ),
      ),
    );
  }
}

class MDialogDownDialog<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final String? labelKey;
  T? value;

  MDialogDownDialog(
      {Key? key,
      required this.items,
      this.value,
      this.title = 'Select',
      this.labelKey})
      : super(key: key);

  @override
  State<MDialogDownDialog> createState() => _MDialogDownDialogState();
}

class _MDialogDownDialogState<T> extends State<MDialogDownDialog> {
  @override
  Widget build(BuildContext context) {
    const size = 56;
    final total = size * widget.items.length;
    final scrollable = total > context.getHPercent(70);
    final children = List.generate(widget.items.length, (i) {
      final item = widget.items[i];
      return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).dividerColor, width: 0.5))),
        child: RadioListTile<T>(
          value: item,
          groupValue: widget.value,
          onChanged: (d) {
            setState(() {
              widget.value = d;
            });
          },
          title: Text(
              '${widget.labelKey != null && item is Map ? item[widget.labelKey] : item}'),
        ),
      );
    });

    final body = Column(
      children: [
        if (!scrollable)
          ...children
        else
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          )),
        Container(
          padding: EdgeInsets.all(10),
          width: double.maxFinite,
          child: OutlinedButton(
            onPressed: widget.value != null
                ? () {
                    context.popDialog(widget.value);
                  }
                : null,
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
    return MDialog(
      padding: const EdgeInsets.all(16),
      title: Row(
        children: [
          Text(widget.title.toUpperCase()),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: scrollable ? Expanded(child: body) : body,
    );
  }
}
