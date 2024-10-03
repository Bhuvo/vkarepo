import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/doctor_event.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';

import '../../components/nothing_widget.dart';
import '../../widgets/m_apibuilder_empty_widget.dart';
import '../../widgets/widgets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime cursor = DateTime.now();

  final bloc = ApiBuilderBloc(
      path: 'GetEvents',
      query: {'Doctor_id': '${LocalStorage.getUID()}'},
      raw: true);

  void _showAppointmentsDialog(
      DateTime selectedDay, List<String> appointmentNames) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Appointments for ${DateFormat('MMM d, y').format(selectedDay)}', // Format the date as desired
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: appointmentNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${index + 1} - ${appointmentNames[index]}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay,
      Map<String, List<DoctorEvent>> map) {
    setState(() {
      cursor = selectedDay;
    });

    // Check if there are appointments for the selected day
    final appointments = map[
        MDateUtils.dateToFormattedDate(selectedDay.toIso8601String(), true)];
    if (appointments != null && appointments.isNotEmpty) {
      // Extract the names from the DoctorEvent objects and convert to List<String>
      final appointmentNames = appointments
          .map((appointment) => appointment.title.toString())
          .toList();

      // Call the _showAppointmentsDialog function with selectedDay and appointmentNames
      _showAppointmentsDialog(selectedDay, appointmentNames);
    } else {
      // Show a snackbar or some other feedback when there are no appointments
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No appointments for this day.'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
        actions: [
          UserProvider(
            data: LocalStorage.getUser(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                UserAvatar(
                  radius: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
        body: BlocProvider(
          create: (context) => bloc..add(const Load()),
          child: ApiBuilder<DoctorEvent>(
            empty: NothingWidget(
                icon: Icons.calendar_month_rounded,
                title: "No appointments",
                message: "No upcoming appointments to show",
                onRefresh: () {
                  bloc.add(const Refresh());
                }

                // Icons.calendar_month_rounded,
                // "No upcoming appointments to show"
                ),
            fromJson: DoctorEvent.fromJsonFactory,
            customBuilder: (data, load) {
              final Map<String, List<DoctorEvent>> map = {};

              for (final e in data) {
                final y = int.tryParse('${e.y ?? ''}') ?? 0;
                final m = (int.tryParse('${e.m ?? ''}') ?? 0) + 1;
                final d = int.tryParse('${e.d ?? ''}') ?? 0;
                final key = MDateUtils.dateToFormattedDate(
                    DateTime(y, m, d).toIso8601String(), true);
                if (map[key] != null) {
                  map[key]?.add(e);
                } else {
                  map[key] = [e];
                }
              }

              return Center(
                child: MListTile(
                  margin:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  padding: const EdgeInsets.only(bottom: 16),
                  constraints:
                      const BoxConstraints(maxWidth: 500, maxHeight: 600),
                  child: TableCalendar(
                    shouldFillViewport: true,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month'
                    },
                    // firstDay: DateTime(1900),
                    // lastDay: DateTime(2100),
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    weekendDays: [],
                    focusedDay: cursor,
                    currentDay: cursor,
                    eventLoader: (DateTime? d) {
                      if (d?.month != cursor.month) return [];
                      final list = map[MDateUtils.dateToFormattedDate(
                              d?.toIso8601String(), true)] ??
                          [];
                      return list;
                    },
                    calendarBuilders:
                        CalendarBuilders(markerBuilder: (c, d, l) {
                      //if(loading) return CupertinoActivityIndicator();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 0,
                          children: l.map((e) {
                            final len = l.length;
                            final i = l.indexOf(e) + 1;

                            if (len > 3) {
                              if (i == 3) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    '+${len - 2}',
                                    style: TextStyle(
                                        color: cursor.day == d.day
                                            ? Colors.white
                                            : null,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              } else if (i > 3) {
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            }

                            if (e is DoctorEvent) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: StatusIndicator(
                                  label: '${e.title}',
                                  allCaps: false,
                                  textColor: cursor.day == d.day
                                      ? MTheme.ICON_COLOR
                                      : Colors.white,
                                  color: cursor.day != d.day
                                      ? MTheme.THEME_COLOR
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  radius: 5,
                                  // color: Theme.of(context).dividerColor,
                                ),
                              );
                            }
                            return const SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                        ),
                      );
                    }),
                    calendarStyle: CalendarStyle(
                        markersAutoAligned: false,
                        outsideDaysVisible: true,
                        cellAlignment: Alignment.topCenter,
                        cellMargin: const EdgeInsets.all(0),
                        cellPadding: const EdgeInsets.all(8),
                        tableBorder: TableBorder(
                            verticalInside: BorderSide(
                                color: Theme.of(context).dividerColor)),
                        rowDecoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Theme.of(context).dividerColor)),
                        ),
                        todayDecoration: BoxDecoration(
                            color: MTheme.ICON_COLOR,
                            borderRadius: BorderRadius.circular(0)),
                        selectedDecoration: BoxDecoration(
                            color: MTheme.ICON_COLOR,
                            borderRadius: BorderRadius.circular(0)),
                        defaultDecoration: BoxDecoration(
                            color: Colors.transparent,
                            //border: Border.all(color: Theme.of(context).dividerColor),
                            borderRadius: BorderRadius.circular(0)),
                        todayTextStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16, color: Colors.white),
                        defaultTextStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16)),
                    headerStyle: HeaderStyle(
                        headerPadding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        titleTextStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        titleCentered: true,
                        leftChevronIcon: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Colors.black,
                          size: 32,
                        ),
                        rightChevronIcon: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.black,
                            size: 32),
                        headerMargin: const EdgeInsets.symmetric(vertical: 0)),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Theme.of(context).dividerColor),
                          top:
                              BorderSide(color: Theme.of(context).dividerColor),
                        ),
                      ),
                    ),
                    daysOfWeekHeight: 32,
                    sixWeekMonthsEnforced: false,
                    onDaySelected: (e, d) {
                      // setState(() {
                      //   cursor = d;
                      // });
                      _onDaySelected(d, d, map);
                    },
                    onPageChanged: (d) {},
                  ),
                ),
              );
            },
          ),
        ),
        title: Consts.CALENDAR);
  }
}
