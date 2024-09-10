import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/time_list_response.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/update_timing_widget.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/schedule/doctor_schedule_list_item.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  final InstantDoctor? instantDoctor;
  final String? doctorGender;
  final String? doctorQualification;
  final String? doctorTotalExperience;
  final String? doctorFee;

  const ScheduleAppointmentPage({
    Key? key,
    this.instantDoctor,
    this.doctorGender,
    this.doctorQualification,
    this.doctorTotalExperience,
    this.doctorFee,
  }) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  DateTime cur = DateTime.now();
  DateTime? selection;
  late ApiBuilderBloc bloc;

  @override
  void initState() {
    print("data from previous page doctor get api");
    print(widget.doctorGender);
    print(widget.doctorTotalExperience);
    print(widget.doctorQualification);
    print(widget.doctorFee);
    print("data from previous page doctor get api --- the end");

    bloc = ApiBuilderBloc(
        path: 'BookAppointment',
        query: {
          'Doctor_id': widget.instantDoctor?.Doctor_id,
          'DateParam': MDateUtils.dateToFormattedDate(
              DateTime.now().toIso8601String(), true,
              generic: true)
          // 'DateParam': MDateUtils.getFormattedDate(DateTime.now().toIso8601String())
        },
        raw: true);
    print("printing docsssssss details");
    print(widget.instantDoctor);
    print("printing docsssssss details");
    print(widget.instantDoctor?.Timing);
    print("printing docsssssss details");
    print(widget.instantDoctor?.Doctor_Qualification);
    print("printing docsssssss details");
    print(widget.instantDoctor?.Consultation_Amount);
    print("printing docsssssss details");
    print(widget.instantDoctor?.ClinicFee);
    print("printing docsssssss details");
    print(widget.instantDoctor?.toJson());
    print("printing docsssssss details");
    print(widget.doctorQualification);
    print("printing doc details");
    print(widget.doctorGender);
    print(widget.doctorTotalExperience);
    print(widget.doctorQualification);
    print(widget.doctorFee);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = context.read<PatientBloc>().patient ?? const Patient();
    return MScaffold(
      title: const Text(Consts.SCHEDULE_APPOINTMENT),
      paddingTop: 120,
      appBarBottom: Padding(
        padding: const EdgeInsets.all(8),
        child: PatientProvider(
            data: p,
            child: const UserTile(
              avatarRadius: 16,
            )),
      ),
      body: SingleChildScrollView(
        child: MListTile(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              DoctorScheduleListItem(
                data: widget.instantDoctor,
                onBookTap: () {
                  if (selection != null) {
                    context.pop(selection);
                  }
                },
                doctorFee: widget.doctorFee,
                doctorGender: widget.doctorGender,
                doctorQualification: widget.doctorQualification,
                doctorTotalExperience: widget.doctorTotalExperience,
              ),
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
                        },
                        date: cur,
                        onChanged: (d) {
                          setState(() {
                            cur = d;
                          });
                          bloc.add(UpdateQuery(
                            {
                              'Doctor_id':
                                  widget.instantDoctor?.Doctor_id ?? "178936",
                              // 'DateParam': MDateUtils.dateToFormattedDate(
                              //     d.toIso8601String(), true,
                              //     generic: true)
                              'DateParam': MDateUtils.getFormattedDate(
                                  d.toIso8601String())
                            },
                          ));
                          print(bloc);
                          print("selecting date from schedule");
                          print(d);
                          print(d.toIso8601String());
                          print("printing bloc");
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
