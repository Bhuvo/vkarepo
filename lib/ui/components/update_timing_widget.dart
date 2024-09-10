import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/time_list.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/date_utils.dart';

class UpdateTimingWidget extends StatefulWidget {
  final Function(DateTime)? onSelect;
  final Function(DateTime)? onChanged;
  final Map<String, MTimePair> timings;
  final List<TimeList>? timeList;
  final DateTime? date;
  final int interval;

  const UpdateTimingWidget(
      {Key? key,
      this.onSelect,
      this.date,
      this.timeList,
      this.onChanged,
      this.timings = const {
        Consts.MORNING: MTimePair(MTime(09, 0), MTime(11, 45)),
        Consts.AFTERNOON: MTimePair(MTime(12, 0), MTime(15, 45)),
        Consts.EVENING: MTimePair(MTime(16, 0), MTime(19, 45)),
        Consts.NIGHT: MTimePair(MTime(20, 0), MTime(21, 45)),
      },
      this.interval = 15})
      : super(key: key);

  @override
  State<UpdateTimingWidget> createState() => _UpdateTimingWidgetState();
}

class _UpdateTimingWidgetState extends State<UpdateTimingWidget> {
  DateTime cursor = DateTime.now();
  DateTime targetDate = DateTime.now();

  final Map<String, List<DateTime>> timings = {};
  int maxItems = 0;

  @override
  void initState() {
    addToAvailList();
    if (widget.date != null) {
      cursor = widget.date!;
    }
    for (var i in widget.timings.keys) {
      timings[i] = getTimings(i);
    }
    super.initState();
  }

  final List<String> available = [];

  addToAvailList() {
    widget.timeList?.forEach((e) {
      if (e.Class == 'slot-active') {
        available.add('${e.startSplit}:${e.EndSplit}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final keys = timings.keys.toList();

    DateTime currentDate = DateTime.now();
    bool isToday = currentDate.isAtSameMomentAs(targetDate);

    print(currentDate);
    print(targetDate);
    print(currentDate.isBefore(targetDate));

    return Column(
      children: [
        Row(
          children: [
            currentDate.isBefore(cursor)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        cursor =
                            DateTime(cursor.year, cursor.month, cursor.day - 1);
                        widget.onChanged?.call(cursor);
                      });
                    },
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      color: MTheme.THEME_COLOR,
                    ))
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: MTheme.THEME_COLOR.withOpacity(0.4),
                    )),
            Expanded(
                child: Center(
              child: Text(
                MDateUtils.dateToFormattedDate(cursor.toIso8601String(), true),
                // MDateUtils.dateToFormattedDate1(cursor, true),

                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 16),
              ),
            )),
            IconButton(
                onPressed: () {
                  setState(() {
                    cursor =
                        DateTime(cursor.year, cursor.month, cursor.day + 1);
                    targetDate = targetDate.add(Duration(days: 1));
                    print(targetDate);
                    print("target date");
                    widget.onChanged?.call(cursor);
                  });
                },
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: MTheme.THEME_COLOR,
                )),
          ],
        ),
        const Divider(
          height: 0.5,
          endIndent: 0,
          indent: 0,
        ),
        Row(
          children: List.generate(Consts.daysOfWeek.length, (i) {
            final item = Consts.daysOfWeek[i];
            final sel = i == cursor.weekday || (cursor.weekday == 7 && i == 0);
            return Expanded(
              child: InkWell(
                onTap: sel
                    ? null
                    : () {
                        setState(() {
                          final e =
                              i - (cursor.weekday == 7 ? 0 : cursor.weekday);
                          cursor = DateTime(
                              cursor.year, cursor.month, cursor.day + (e));
                          widget.onChanged?.call(cursor);
                        });
                      },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.5),
                      color: sel
                          ? MTheme.THEME_COLOR.withOpacity(0.15)
                          : Colors.transparent),
                  child: Text(
                    item.toUpperCase(),
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: sel ? MTheme.THEME_COLOR : Colors.grey),
                  ),
                ),
              ),
            );
          }),
        ),
        const Divider(
          height: 0.5,
          endIndent: 0,
          indent: 0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(keys.length, (i) {
            final name = keys[i];

            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 0.5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration:
                          const BoxDecoration(gradient: MTheme.GRADIENT),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/ic_${name.toLowerCase()}.png',
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ...List.generate(maxItems, (i) {
                      final color =
                          i % 2 == 0 ? Colors.white : Colors.grey.shade100;
                      const padding = EdgeInsets.symmetric(vertical: 4);
                      final style = TextStyle(
                          color: Colors.lightGreen.shade400,
                          fontSize: 13,
                          fontWeight: FontWeight.w600);
                      if (i > timings[name]!.length - 1) {
                        return Container(
                          padding: padding,
                          color: color,
                          child: Text(
                            '',
                            style: style,
                          ),
                        );
                      }
                      final time = timings[name]![i];

                      final sel = time.difference(cursor).abs().inMinutes == 0;

                      final past = time.isBefore(DateTime.now());
                      final avail = available
                              .contains(DateFormat('HH:mm').format(time)) &&
                          !past;

                      // final past = time.isBefore(DateTime.now());

                      return Material(
                        color: sel ? Colors.green : color,
                        child: InkWell(
                          onTap: sel || !avail || past
                              ? null
                              : () {
                                  setState(() {
                                    cursor = time;
                                  });
                                  widget.onSelect?.call(cursor);
                                },
                          child: Padding(
                              padding: padding,
                              child: Center(
                                  child: Text(
                                MDateUtils.dateToHourMinute(
                                    time.toIso8601String()),
                                style: sel
                                    ? const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)
                                    : avail
                                        ? style
                                        : TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.lineThrough),
                              ))),
                        ),
                      );
                    })
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  List<DateTime> getTimings(String timing) {
    DateTime from = DateTime(cursor.year, cursor.month, cursor.day,
        widget.timings[timing]!.from.hour, widget.timings[timing]!.from.minute);
    DateTime to = DateTime(cursor.year, cursor.month, cursor.day,
        widget.timings[timing]!.to.hour, widget.timings[timing]!.to.minute);
    return generateTimings(from, to, Duration(minutes: widget.interval));
  }

  List<DateTime> generateTimings(
      DateTime from, DateTime to, Duration interval) {
    final List<DateTime> list = [];
    DateTime current = from;
    final diff = from.difference(to).abs();
    Duration added = const Duration();
    list.add(current);

    while (diff.inMinutes != added.inMinutes) {
      current = DateTime(current.year, current.month, current.day, current.hour,
          current.minute + interval.inMinutes);
      added = Duration(minutes: added.inMinutes + interval.inMinutes);
      list.add(current);
    }
    if (list.length > maxItems) {
      maxItems = list.length;
    }
    return list;
  }
}

class MTime {
  final int hour, minute;

  const MTime(this.hour, this.minute);
}

class MTimePair {
  final MTime from, to;

  const MTimePair(this.from, this.to);
}
