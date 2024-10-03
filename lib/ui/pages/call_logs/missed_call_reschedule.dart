import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/badge_avatar.dart';
import 'package:timesmedlite/ui/components/flexi_q_button.dart';
import 'package:timesmedlite/ui/components/patient_schedule_header.dart';
import 'package:timesmedlite/ui/components/update_timing_widget.dart';
import 'package:timesmedlite/ui/pages/call_logs/reschedule_appointment_dialog.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../model/time_list_response.dart';
import '../../../model/user.dart';
import '../../../utils/date_utils.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';

class MissedCallReschedule extends StatefulWidget {
  final UserData;

  MissedCallReschedule({Key? key, required this.UserData}) : super(key: key);

  @override
  State<MissedCallReschedule> createState() => _MissedCallRescheduleState();
}

class _MissedCallRescheduleState extends State<MissedCallReschedule> {
  DateTime cur = DateTime.now();

  DateTime? selection;

  ApiBuilderBloc bloc = ApiBuilderBloc(
      path: 'BookAppointment_Tele',
      query: {
        'Doctor_id': '${LocalStorage.getUID()}',
      },
      raw: true);

  @override
  void initState() {
    print("uuuuuuusssssssssssseeeeerrrrrrrrrrrrrrr${widget.UserData}");
    // bloc = ApiBuilderBloc(
    //     path: 'BookAppointment',
    //     query: {
    //       'Doctor_id': '${LocalStorage.getUID()}',
    //       'DateParam': MDateUtils.dateToFormattedDate(
    //           DateTime.now().toIso8601String(), true,
    //           generic: true)
    //     },
    //     raw: true);
  }

  @override
  Widget build(BuildContext context) {
    final user = User(
        fullName: widget.UserData.User_Name,
        userId: widget.UserData.User_id,
        phoneNumber: widget.UserData.MobileNumber);
    return MScaffold(
      title: const Text(Consts.MISSED_CALL),
      bodyPadding: const EdgeInsets.only(bottom: 100, top: 56),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 50,
              child: OutlinedButton(
                child: const Text('Helpdesk Request'),
                onPressed: () {},
              ),
            ),
            UserProvider(
              data: user,
              child: MListTile(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: PatientScheduleHeader(
                  date: widget.UserData.Appointment_Date,
                  time: widget.UserData.Appointment_Time,
                  patientImage: widget.UserData.PatientImage,
                  caption: Row(
                    children: [
                      Text(
                        'Patient ID: ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        widget.UserData.User_id.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: MTheme.THEME_COLOR),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Please choose a slot to reschedule appointment...',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.red, fontStyle: FontStyle.italic),
              ),
            ),
            MListTile(
                child: Column(
              children: [
                // UpdateTimingWidget(
                //   date :DateTime.now(),
                //   onSelect: (date){
                //     showDialog(context: context, builder: (c) => const RescheduleAppointmentDialog());
                //   },
                // ),
                BlocProvider(
                  create: (context) => bloc..add(const Load()),
                  child: ApiBuilder<TimeListResponse>(
                      fromJson: TimeListResponse.fromJsonFactory,
                      loading: Shimmer.fromColors(
                          baseColor:
                              Theme.of(context).canvasColor.withOpacity(0.25),
                          highlightColor: Theme.of(context).highlightColor,
                          child: IgnorePointer(
                              ignoring: true,
                              child: UpdateTimingWidget(
                                date: cur,
                              ))),
                      customBuilder: (data, load) {
                        return UpdateTimingWidget(
                          timeList: data.first.timeList,
                          onSelect: (d) {
                            selection = d;
                            showDialog(
                                context: context,
                                builder: (c) => RescheduleAppointmentDialog(
                                      RescheduleAppointmentDate: selection,
                                      patientdata: widget.UserData,
                                    ));
                          },
                          date: cur,
                          onChanged: (d) {
                            setState(() {
                              cur = d;
                            });
                          },
                        );
                      }),
                ),
                Container(
                  decoration: const BoxDecoration(gradient: MTheme.GRADIENT),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FlexiQButton(),
                      FlexiQButton(),
                      FlexiQButton(),
                      FlexiQButton(),
                    ],
                  ),
                )
              ],
            )),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      bottom: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BadgeAvatar(
            badge: '10 Years',
            caption: 'experience',
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Doctor Name',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                'MBBS, MD\nPulmonology',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
