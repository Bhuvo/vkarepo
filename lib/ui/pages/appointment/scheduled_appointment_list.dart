import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/booking_appointment.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/scheduled_appointment_list_item.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class ScheduledAppointmentList extends StatelessWidget {
  final dynamic hospitalId;

  const ScheduledAppointmentList({Key? key, this.hospitalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///TODO: uncomment LocalStorage.getUID() and '$hospitalId' in production
    final bloc = ApiBuilderBloc(
        path: 'GetAppointmentList',
        api2: true,
        timesmedApi: true,
        query: {
          'DoctorId': LocalStorage.getUID(),
          'status_id': 'T',
          'From': '01/01/1996',
          'To': '01/01/2100',
          'hos_id': '$hospitalId',
        });

    return MScaffold(
      title: const Text(Consts.SCHEDULED_APPOINTMENT_LIST),
      // title: const Text("hey bro"),

      body: BlocProvider(
        create: (context) => bloc..add(const Load()),
        child: ApiBuilder<BookingAppointment>(
          type: ApiBuilderType.searchList,
          fromJson: BookingAppointment.fromJsonFactory,
          customBuilder: (data, load) {
            final list = data.first.pat_list ?? [];
            return MSearchListView(
                itemCount: list.length,
                label: 'Search by Name, Email, Mobile, Phone',
                itemBuilder: (c, i) {
                  final data = list[i];
                  return ScheduledAppointmentListItem(data: data);
                });
          },
        ),
      ),
    );
  }
}
