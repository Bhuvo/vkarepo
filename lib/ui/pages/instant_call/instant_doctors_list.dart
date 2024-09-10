import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/instant_doctors_response.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/schedule_doctors_response.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/schedule/doctor_schedule_list_item.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class InstantDoctorsList extends StatefulWidget {
  final String? speciality, lang;
  final bool schedule;

  const InstantDoctorsList(
      {Key? key, this.speciality, this.lang, this.schedule = false})
      : super(key: key);

  @override
  State<InstantDoctorsList> createState() => _InstantDoctorsListState();
}

class _InstantDoctorsListState extends State<InstantDoctorsList> {
  late ApiBuilderBloc bloc;

  @override
  void initState() {
    /// Below code is to show list of Instant doctor list Api bloc
    bloc = widget.schedule
        ? ApiBuilderBloc(
            path: 'SpecLocation',
            query: {
              'city': 'Chennai',
              'specialization': widget.speciality?.replaceAll(' ', '-'),
              'User_id': LocalStorage.getUser().userId,
            },
          )
        : ApiBuilderBloc(
            path: 'PostMode',
            query: {
              'User_id': LocalStorage.getUser().userId,
              'Sp': widget.speciality ?? 1635,
              'Mo': 'Instant',
              'La': widget.lang ?? 1
            },
            raw: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = context.read<PatientBloc>().patient ?? const Patient();
    return MScaffold(
      title:
          Text(widget.schedule ? 'SCHEDULE DOCTORS' : Consts.INSTANT_DOCTORS),
      paddingTop: 120,
      appBarBottom: Padding(
        padding: const EdgeInsets.all(8),
        child: PatientProvider(
            data: p,
            child: const UserTile(
              avatarRadius: 16,
            )),
      ),
      body: BlocProvider(
        create: (context) => bloc..add(const Load()),
        child: widget.schedule
            ? ApiBuilder<ScheduleDoctorsResponse>(
                fromJson: ScheduleDoctorsResponse.fromJsonFactory,
                loading: const ShimmerList(
                  height: 60,
                ),
                customBuilder: (data, load) {
                  final list = data.first.doctors ?? [];
                  if (list.isEmpty) {
                    return NothingWidget(
                      icon: FontAwesomeIcons.userDoctor,
                      title: 'No Schedule Doctors',
                      message:
                          'There is no Schedule doctors at the moment\nPlease try again after sometimes',
                      onRefresh: () {
                        bloc.add(const Refresh());
                      },
                    );
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      itemCount: list.length,
                      itemBuilder: (c, i) {
                        return MListTile(
                            child: DoctorScheduleListItem(
                          data: list[i],
                        ));
                      });
                })
            : ApiBuilder<InstantDoctorsResponse>(
                fromJson: InstantDoctorsResponse.fromJsonFactory,
                loading: const ShimmerList(
                  height: 60,
                ),
                customBuilder: (data, load) {
                  final list = data.first.doctors ?? [];
                  if (list.isEmpty) {
                    return NothingWidget(
                      icon: FontAwesomeIcons.userDoctor,
                      title: 'No Instant Doctors',
                      message:
                          'There is no Instant doctors at the moment\nPlease try again after sometimes',
                      onRefresh: () {
                        bloc.add(const Refresh());
                      },
                    );
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      itemCount: list.length,
                      itemBuilder: (c, i) {
                        return MListTile(
                            child: DoctorScheduleListItem(
                          data: list[i],
                        ));
                      });
                }),
      ),
    );
  }
}
