import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/booking_appointment.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/appointment/widgets/scheduled_appointment_list_item.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class ScheduledAppointmentList extends StatefulWidget {
  final dynamic hospitalId;
  final String statusId;
  final String? fromDate;
  final String? toDate;
   ScheduledAppointmentList({Key? key, this.hospitalId, this.fromDate, this.toDate, required this.statusId}) : super(key: key);

  @override
  State<ScheduledAppointmentList> createState() => _ScheduledAppointmentListState();
}

class _ScheduledAppointmentListState extends State<ScheduledAppointmentList> {

  late ApiBuilderBloc  bloc = ApiBuilderBloc(
    // path: 'GetAppointmentList',
    path: 'GetVkaAppointmentList?DoctorId=${LocalStorage.getUID()}&status_id=${widget.statusId ?? 'T'}&From=${widget.fromDate ?? '09/18/2024'}&To=${widget.toDate ?? '01/01/2100'}&hos_id=${widget.hospitalId ?? 0}',
    api2: true,
    // timesmedApi: true,
    // query: {
    //   'DoctorId': LocalStorage.getUID(),
    //   'status_id': statusId ?? 'T',
    //   'From': fromDate ?? '09/18/2024',
    //   'To':  toDate ?? '01/01/2100',
    //   'hos_id': '$hospitalId',
    // }
  );
  @override
  Widget build(BuildContext context) {
    print('${LocalStorage.getUID()} ${widget.hospitalId},${widget.fromDate} ${widget.toDate}');
    ///TODO: uncomment LocalStorage.getUID() and '$hospitalId' in production

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
              onRefresh: () async {
                context.replace(Routes.scheduledAppointmentList, {
                  'hos_id': widget.hospitalId,
                  'statusId': widget.statusId,
                  'fromDate': widget.fromDate,
                  'toDate': widget.toDate
                });
              },
                itemCount: list.length,
                label: 'Search by Name, Email, Mobile, Phone',
                onChanged: (value){
                },
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
