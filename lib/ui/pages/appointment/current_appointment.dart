import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/generated/assets.dart';
import 'package:timesmedlite/model/booking_hospital.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/schedule_hospital_list_item.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_card.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../home/home_bottom_navigation.dart';

class CurrentAppointmentPage extends StatefulWidget {
  const CurrentAppointmentPage({Key? key}) : super(key: key);

  @override
  State<CurrentAppointmentPage> createState() => _CurrentAppointmentPageState();
}

class _CurrentAppointmentPageState extends State<CurrentAppointmentPage> {
  final Map<String, dynamic> query = {
    'hos_id': 0,
    'DoctorId': LocalStorage.getUID(),
  };
  final bloc = ApiBuilderBloc(
    path: 'get_appcount_chart',
    timesmedApi: true,
    api2: true,
  );

  static DateTime queryDateToDate(String? date) {
    // Check if the input date is null, if so, use a default date as a fallback
    String inputDate = date ?? '2000-11-01';

    // Convert the input date from "yyyy-MM-dd" to "dd/MM/yyyy" format
    String formattedDate = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(inputDate) ?? DateTime(2000, 11, 01));

    // Parse the formatted date using the "dd/MM/yyyy" format
    return DateFormat('dd/MM/yyyy').parse(formattedDate);
  }

  static DateTime queryDateToDate1(String? date) {
    // Convert the input date from "yyyy-MM-dd" to "dd/MM/yyyy" format
    String formattedDate = DateFormat('dd/MM/yyyy').format(
        DateTime.tryParse(date ?? '2000-11-01') ?? DateTime(2000, 11, 01));

    // Parse the formatted date using the "dd/MM/yyyy" format
    return DateFormat('dd/MM/yyyy').parse(formattedDate);
  }

  String formatDateToDateTime(String date) {
    DateTime parsedDate = DateFormat('MM/dd/yyyy').parse(date);
    String formattedDateTime =
        DateFormat('yyyy-MM-dd 00:00:00.000').format(parsedDate);
    return formattedDateTime;
  }

  @override
  void initState() {
    print('dctor id ${LocalStorage.getUID()}'); //184371
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    print("${query['From']} query['From]");
    print("${query['From']} query['To]");
    query['From'] = MDateUtils.dateToQueryDate(yesterday.toIso8601String());
    query['To'] = MDateUtils.dateToQueryDate(now.toIso8601String());
    print(query['From']);
    print(query['To']);
    String date = "07/26/2023";
    print(MDateUtils.queryDateToDate(query['From']));
    print(MDateUtils.queryDateToDate1(query['From']));
    print(MDateUtils.queryDateToDate1(date));
    print("-------------");
    print("-------------From");
    print(formatDateToDateTime(query['From']));
    print(formatDateToDateTime(query['To']));
    print("-------------To");
    print(query['From']);
    print("${query['From']} query['From]");
    print("${query['To']} query['To]");
    print("-------------");
    print(queryDateToDate1(query['From']));
    print(queryDateToDate1(query['To']));
    print("prints date from");
    bloc.add(UpdateQuery(query));
    setState(() {});
    super.initState();
  }

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    print('Doctor id is ${LocalStorage.getUID()}');
    // final f = MDateUtils.queryDateToDate1(query['From']);
    //     // final t = MDateUtils.queryDateToDate1(query['To']);
    final f = MDateUtils.formatDateToDateTime(query['From']);
    final t = MDateUtils.formatDateToDateTime(query['To']);

    return HomeBottomNavigation(
      title: Consts.CURRENT_APPOINTMENT,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            icon: isSearch ? const Icon(Icons.close) : const Icon(Icons.search))
      ],
      body: BlocProvider(
        create: (context) => bloc,
        child: ApiBuilder(
          jsonBuilder: (list, load) {
            final data = list.first;
            final hospitals = (data['hos_list'] ?? [])
                .map((e) => BookingHospital.fromJson(e))
                .toList();
            return SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MDialogDown(
                    //   items: [''],
                    //   label: 'OP Patient',
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    isSearch
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: MDateTimePicker(
                                    start: DateTime(2000),
                                    end: t,
                                    initial: f,
                                    onChanged: (d) {
                                      setState(() {
                                        query['From'] =
                                            MDateUtils.dateToQueryDate(
                                                d?.toIso8601String());
                                      });
                                    },
                                    label: 'From Date',
                                  )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                      child: MDateTimePicker(
                                    start: f,
                                    end: DateTime(2100),
                                    initial: t,
                                    onChanged: (d) {
                                      setState(() {
                                        query['To'] =
                                            MDateUtils.dateToQueryDate(
                                                d?.toIso8601String());
                                      });
                                    },
                                    label: 'To Date',
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: 50,
                                child: OutlinedButton(
                                  child: Text('Go'),
                                  onPressed: () {
                                    bloc.add(UpdateQuery(query));
                                  },
                                ),
                              ),
                              const Divider(
                                height: 24,
                                endIndent: 0,
                                indent: 0,
                              ),
                            ],
                          )
                        : Container(),
                    Row(
                      children: [
                        DashboardCard(
                          title: '${data['total'] ?? '-'}',
                          subTitle: 'Scheduled',
                          color: Color(0xFF2fa6c4),
                          asset: 'assets/images/scheduled.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'T',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                        DashboardCard(
                          title: '${data['waiting'] ?? '-'}',
                          subTitle: 'Waiting',
                          color: Color(0xFFf8457a),
                          asset: 'assets/images/waiting.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'W',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          title: '${data['completed'] ?? '-'}',
                          subTitle: 'Checked Out',
                          color: Colors.green.shade400,
                          asset: 'assets/images/scheduled.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'C',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                        DashboardCard(
                          title: '0',
                          subTitle: 'Cancel',
                          color: Color(0xFFf2bd2e),
                          asset: 'assets/images/cancel.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'R',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // DashboardCard(
                        //   title: '${data['OT_RequestCount'] ?? '-'}',
                        //   subTitle: 'OT Request Count',
                        //   color: Colors.lightBlue,
                        //   asset: 'assets/images/waiting.png',
                        //   onTap: () {
                        //     context.push(
                        //       Routes.scheduledAppointmentList,
                        //       {
                        //         'hos_id': query['hos_id'],
                        //       },
                        //     );
                        //   },
                        // ),
                        DashboardCard(
                          title: '0',
                          subTitle: 'Online Consultation',
                          color: Colors.grey.shade600,
                          asset: 'assets/images/consultation_online.png',
                          // flex: 0,
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                              },
                            );
                          },
                        ),
                        DashboardCard(
                          title: '${data['IP_app_count'] ?? '-'}',
                          subTitle: 'Follow Up Appointment',
                          asset: 'assets/images/scheduled.png',
                          color: Color(0xFF2fa6c4),
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          title: '${data['Missed'] ?? '-'}',
                          subTitle: 'Missed',
                          color: Colors.red,
                          asset: 'assets/images/appointment_missed.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'M',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                        DashboardCard(
                          title: '${data['confirmed'] ?? ''}',
                          subTitle: 'For Confirmation',
                          color: Colors.green.shade400,
                          asset: 'assets/images/confirm.png',
                          onTap: () {
                            context.push(
                              Routes.scheduledAppointmentList,
                              {
                                'hos_id': query['hos_id'],
                                'statusId': 'W',
                                'fromDate': query['From'],
                                'toDate': query['To'] ,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      height: 24,
                      endIndent: 0,
                      indent: 0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Hospital Appointment',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text('${data['total'] ?? '-'}'))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ...hospitals.map((e) => ScheduleHospitalListItem(
                          counter: '${e.app_count ?? '-'}',
                          data: e,
                        )),
                    const Space(300)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
