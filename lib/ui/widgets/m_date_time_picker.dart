import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/date_utils.dart';

class MDateTimePicker extends StatefulWidget {
  final String? label;

  final DateTime? initial;
  final DateTime start, end;
  final Function(DateTime?)? onChanged;
  final String? hintDateFormat;

  const MDateTimePicker({
    this.label,
    this.onChanged,
    this.initial,
    required this.start,
    required this.end,
    this.hintDateFormat,
    Key? key,
  }) : super(key: key);

  @override
  _MDateTimePickerState createState() => _MDateTimePickerState();
}

class _MDateTimePickerState extends State<MDateTimePicker> {
  DateTime value = DateTime.now();
  DateTime? formattedValue;
  bool neverEnds = true;

  @override
  void initState() {
    super.initState();
    if (widget.initial != null) {
      neverEnds = false;
      value = widget.initial!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;
    final dateFormat = DateFormat('dd/MM/yyyy'); // Format for "dd/MM/yyyy"

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Stack(
        children: [
          AbsorbPointer(
            absorbing: true,
            child: InputDatePickerFormField(
              key: ValueKey(value),
              lastDate: widget.end,
              firstDate: widget.start,
              initialDate: value,
              fieldLabelText: widget.label,
              fieldHintText: dateFormat.format(value),
              onDateSubmitted: (d) {
                setState(() {
                  value = d;
                });
                widget.onChanged?.call(d);
              },
              onDateSaved: (d) {
                setState(() {
                  value = d;
                  widget.onChanged?.call(d);
                });
              },
              selectableDayPredicate: (d) {
                return true;
              },
              keyboardType: TextInputType.datetime,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.calendarDays,
                  color: MTheme.ICON_COLOR,
                ),
                onPressed: () async {
                  DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: value,
                      firstDate: widget.start,
                      lastDate: widget.end);

                  if (selected != null) {
                    setState(() {
                      value = DateTime(
                        selected.year,
                        selected.month,
                        selected.day,
                        value.hour,
                        value.minute,
                        value.second,
                      );

                      // String formattedValue = dateFormat.format(value);
                      final formattedValue =
                          DateFormat('dd/MM/yyyy').format(value);

                      print(formattedValue);
                      print(selected);
                      print("printing value and selected");
                    });

                    widget.onChanged!(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
