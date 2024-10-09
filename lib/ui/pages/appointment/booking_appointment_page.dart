import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/booking_hospital.dart';
import 'package:timesmedlite/model/time_list_response.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/badge_avatar.dart';
import 'package:timesmedlite/ui/components/confirm_dialog.dart';
import 'package:timesmedlite/ui/components/flexi_q_button.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/update_timing_widget.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/appointment/appointment_select_user_dialog.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/schedule_hospital_list_item.dart';
import 'package:timesmedlite/ui/pages/call/update_call_status_page.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../routes/routes.dart';
import '../home/home_bottom_navigation.dart';

class BookingAppointmentPage extends StatefulWidget {
  final bool? isFromPatient ;
  const BookingAppointmentPage({Key? key, this.isFromPatient}) : super(key: key);

  @override
  State<BookingAppointmentPage> createState() => _BookingAppointmentPageState();
}

class _BookingAppointmentPageState extends State<BookingAppointmentPage> {
   bool isFromPatient = false;
  final ApiBuilderBloc hospitals = ApiBuilderBloc(
      path: 'HospitalList',
      query: {'DoctorId':LocalStorage.getIsFromPatient() ? LocalStorage.getPatientSearchDoctorId(): LocalStorage.getUID()},
      timesmedApi: true,
      api2: true);
  final ApiBuilderBloc profile = ApiBuilderBloc(
      path: 'ProfileList',
      query: {'DoctorId':LocalStorage.getIsFromPatient()  ? LocalStorage.getPatientSearchDoctorId(): LocalStorage.getUID()},
      timesmedApi: true,
      api2: true);
  final ApiBuilderBloc timings = ApiBuilderBloc(
      path: 'GetTimingList',
      query: {},
      timesmedApi: true,
      api2: true,
      raw: true);

  Map<String, dynamic> timingsQuery = {
    'DoctorId':LocalStorage.getIsFromPatient()  ? LocalStorage.getPatientSearchDoctorId(): LocalStorage.getUID(),
    'hospital_id': '',
    'appdate': MDateUtils.dateToQueryDate(DateTime.now().toIso8601String())
    // 'appdate': MDateUtils.changeDateFormat(DateTime.now().toIso8601String())
  };

  String? docAddress;

  getDoctorData() async {
    var queryParameters;
    final uri3 =
        Uri.parse("https://api.timesmed.com/WebAPI2/GetDoctorDetails").replace(
            queryParameters: queryParameters = {
      'DoctorId':LocalStorage.getIsFromPatient()  ? LocalStorage.getPatientSearchDoctorId(): LocalStorage.getUID(),
    });
    final response3 = await http.get(uri3);
    print(response3.body);
    var jsonResponse = jsonDecode(response3.body);
    print(jsonResponse["Data"]["Doctor_Address"].toString());
    setState(() {
      docAddress = jsonResponse["Data"]["Doctor_Address"].toString();
    });
  }

  DateTime cur = DateTime.now();

  @override
  void initState() {
    isFromPatient = widget.isFromPatient ?? true;
    print(' the doctor id  ${LocalStorage.getUID()}');
    print(' the doctor id  ${LocalStorage.getUID()}');
    // TODO: implement initState
    super.initState();
    print(DateFormat('MM/dd/yyyy').format(DateTime.now()));
    print("prints today date");
    print(MDateUtils.dateToQueryDate(DateTime.now().toIso8601String()));
    print(DateTime.now().toIso8601String());
    print(MDateUtils.changeDateFormat(DateTime.now().toIso8601String()));
    print("prints date in initstate");
    // getDoctorData();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageBase(
      title: Consts.BOOKING_APPOINTMENT,
      body: RefreshIndicator(
        onRefresh: () async {
          hospitals.add(const Refresh());
          profile.add(const Refresh());
          return timings.add(const Refresh());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital List',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                BlocProvider(
                  create: (context) => hospitals..add(const Load()),
                  child: ApiBuilder<BookingHospital>(
                    fromJson: BookingHospital.fromJsonFactory,
                    shrinkWrap: true,
                    loading: const ShimmerList(
                      length: 2,
                      height: 48,
                      padding: EdgeInsets.only(top: 16),
                    ),
                    builder: (data, index) {
                      if (index == 0) {
                        timingsQuery['hospital_id'] = data.hospital_id;
                        final now = DateTime.now();
                        timingsQuery['appdate'] =
                            // MDateUtils.changeDateFormat(now.toIso8601String());
                            MDateUtils.dateToQueryDate(now.toIso8601String());
                        print(timingsQuery['appdate']);
                        print("timingQuery");
                        print(
                            MDateUtils.dateToQueryDate(now.toIso8601String()));
                        timings.add(UpdateQuery(timingsQuery));
                      }
                      return ScheduleHospitalListItem(
                        data: data,
                      );
                    },
                  ),
                ),
                BlocProvider(
                  create: (context) => profile..add(const Load()),
                  child: ApiBuilder(
                    shrinkWrap: true,
                    loading: const ShimmerList(
                      length: 1,
                      height: 110,
                      padding: EdgeInsets.all(0),
                    ),
                    jsonBuilder: (list, load) {
                      final data = list.first;
                      return MListTile(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BadgeAvatar(
                                badge:
                                    '${data['DoctorExperience_Years']} Years',
                                caption: 'experience',
                                captionColor: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                                imageUrl: data['Doctor_Image'],
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    '${data['Doctor_Name'] ?? ''}',
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  Text(
                                    '${data['Doctor_Qualification'] ?? ''}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.hospital,
                                        color: MTheme.ICON_COLOR,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${data['Hospital_Name'] ?? ''}',
                                        style:
                                            Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        Icons.location_on,
                                        color: MTheme.ICON_COLOR,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${data['Address'] ?? 'Address not available'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ))
                            ],
                          ));
                    },
                  ),
                ),
                BlocProvider(
                  create: (context) => timings,
                  child: ApiBuilder<TimeListResponse>(
                    fromJson: TimeListResponse.fromJsonFactory,
                    loading: Shimmer.fromColors(
                      baseColor:
                          Theme.of(context).canvasColor.withOpacity(0.25),
                      highlightColor: Theme.of(context).highlightColor,
                      child: IgnorePointer(
                        ignoring: true,
                        child: UpdateTimingWidget(
                          date:
                              // MDateUtils.queryDateToDate(
                              //     timingsQuery['appdate']),
                              MDateUtils.formatDateToDateTime(
                                  timingsQuery['appdate']),
                        ),
                      ),
                    ),
                    customBuilder: (list, load) {
                      print(timingsQuery['appdate']);
                      print("prints timing query${list.first.timeList}");
                      final data = list.first;
                      return MListTile(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          child: Column(
                            children: [
                              UpdateTimingWidget(
                                timeList: data.timeList,
                                onSelect: (date) async {
                                  if(LocalStorage.getIsFromPatient()){
                                    final response = await showConfirmDialog(context: context,title: 'Confirm Appointment',message: 'Are you sure you want to book an appointment?',
                                    actions:{
                                      'Yes': () async {
                                        print('coming inside Yes${timingsQuery['hospital_id']} , ${LocalStorage.getPatientSearchDoctorId()}, ${MDateUtils.dateToHourMinuteQuery(date.toIso8601String())} ,${MDateUtils.dateToQueryDate(date.toIso8601String())}');
                                        final call = Injector()
                                            .timesmedService
                                            .get2(
                                            path: 'VkaDoctorBookAppointment',
                                            query: {
                                              // .get2(path: 'DoctorBookAppointment', query: {
                                              'UserId': LocalStorage
                                                  .getCursorPatient()
                                                  .userId,
                                              //  user?.userId,
                                              'Type_Flag': 'H',
                                              'Hospital_id': timingsQuery['hospital_id'],
                                              // 'DoctorId': LocalStorage.getUID(),
                                              'DoctorId': LocalStorage
                                                  .getPatientSearchDoctorId(),
                                              'desc': 'complaints',
                                              'Time': MDateUtils
                                                  .dateToHourMinuteQuery(
                                                  date.toIso8601String()),
                                              'Date': MDateUtils
                                                  .dateToQueryDate(
                                                  date.toIso8601String()),
                                            });
                                        final res = await ApiFacade.callApi(
                                            context: context, call: call);
                                        print(res);
                                        print(res?.error);
                                        print(res?.body);
                                        print(res?.statusCode);
                                        if (res != null) {
                                          showMessage(context: context,
                                              message: 'Appointment booked successfully');
                                          context.popDialog(true);
                                          context.pushAndRemoveUntil(
                                              Routes.bookAppointment, (
                                              p0) => false);
                                        }
                                        // final bookTime = Injector()
                                        //     .apiService
                                        //     .rawGet(path: 'BookThisTime', query: {
                                        //   // 'User_id': LocalStorage.getUser().userId.toString(),
                                        //   'User_id': LocalStorage.getCursorPatient().userId,
                                        //   'Doctor_id':LocalStorage.getPatientSearchDoctorId(),
                                        //   // 'DateParam': MDateUtils.dateToFormattedDate(
                                        //   //     reqRes1.toIso8601String(), true,
                                        //   //     generic: true),
                                        //   'DateParam':MDateUtils.dateToQueryDate(date.toIso8601String()),
                                        //   'TimeParam': MDateUtils.dateToHourMinuteQuery(date.toIso8601String())
                                        // });
                                        // final reqRes2 =
                                        // await ApiFacade.callApi(context: context, call: bookTime);
                                        // if(reqRes2 != null) {
                                        //   final call = Injector()
                                        //       .timesmedService
                                        //       .get2(
                                        //       path: 'VkaDoctorBookAppointment',
                                        //       query: {
                                        //         // .get2(path: 'DoctorBookAppointment', query: {
                                        //         'UserId': LocalStorage
                                        //             .getCursorPatient()
                                        //             .userId,
                                        //         //  user?.userId,
                                        //         'Type_Flag': 'H',
                                        //         'Hospital_id': timingsQuery['hospital_id'],
                                        //         // 'DoctorId': LocalStorage.getUID(),
                                        //         'DoctorId': LocalStorage
                                        //             .getPatientSearchDoctorId(),
                                        //         'desc': 'complaints',
                                        //         'Time': MDateUtils
                                        //             .dateToHourMinuteQuery(
                                        //             date.toIso8601String()),
                                        //         'Date': MDateUtils
                                        //             .dateToQueryDate(
                                        //             date.toIso8601String()),
                                        //       });
                                        //   final res = await ApiFacade.callApi(
                                        //       context: context, call: call);
                                        //   print(res);
                                        //   print(res?.error);
                                        //   print(res?.body);
                                        //   print(res?.statusCode);
                                        //   if (res != null) {
                                        //     showMessage(context: context,
                                        //         message: 'Appointment booked successfully');
                                        //     context.popDialog(true);
                                        //     context.pushAndRemoveUntil(
                                        //         Routes.bookAppointment, (
                                        //         p0) => false);
                                        //   }
                                        // }
                                    },
                                    }
                                    );
                                    if (response == true) {
                                      print('response is true');
                                    }else{
                                      print('response is false');
                                    }

                                    return;
                                  }
                                  final res = await showDialog(
                                      context: context,
                                      builder: (c) =>
                                          AppointmentSelectUserDialog(
                                              date: date,
                                              hospitalId:
                                                  timingsQuery['hospital_id']));
                                  if (res == true) {
                                    timings.add(const Refresh());
                                  }
                                },
                                date: MDateUtils.formatDateToDateTime(
                                    timingsQuery['appdate']),
                                // MDateUtils.queryDateToDate(
                                //     timingsQuery['appdate']),
                                onChanged: (date) {
                                  // setState(() {
                                  //   cur = date;
                                  // });
                                  timingsQuery['appdate'] =
                                      // MDateUtils.changeDateFormat(
                                      //     date.toIso8601String());
                                      MDateUtils.dateToQueryDate(
                                          date.toIso8601String());
                                  timings.add(UpdateQuery(timingsQuery));
                                },
                              ),
                              // Container(
                              //   decoration: const BoxDecoration(
                              //       gradient: MTheme.GRADIENT),
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 8),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: const [
                              //       Spacer(
                              //         flex: 3,
                              //       ),
                              //       FlexiQButton(),
                              //     ],
                              //   ),
                              // )
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
