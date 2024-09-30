import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/appointment_data.dart';
import 'package:timesmedlite/model/medical_record.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import '../../app/app_config.dart';
import 'medical_record_list_item.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MedicalRecordsList extends StatelessWidget {
  final AppointmentData? appointment;
  final String? docID;
  final String? patID;

  const MedicalRecordsList({
    Key? key,
    this.appointment,
    this.docID,
    this.patID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ApiBuilderBloc bloc;
    print("Medical Record        ${appointment?.id}");
    //   bloc = ApiBuilderBloc(
    //   path: 'getdetails',
    //   query: {
    //     'user_id': LocalStorage.getUser().userId,
    //     //'user_id': 3158,
    //     'Doctor_id': appointment?.doctorId
    //     //'Doctor_id': 38371
    //   },
    //   //raw: true
    // );
    if (AppConfig.of(context)?.config == Config.doctor) {
      print(patID);
      print(docID);
      print("from doc");
      bloc = ApiBuilderBloc(
        path: 'getdetails',
        query: {
          'user_id': patID.toString(),
          //'user_id': 3158,
          'Doctor_id': docID.toString(),
          //'Doctor_id': 38371
        },
        //raw: true
      );
    } else {
      print(LocalStorage.getCursorPatient().userId);
      print(appointment?.doctorId);
      print("from pat");
      bloc = ApiBuilderBloc(
        path: 'getdetails',
        query: {
          'user_id': LocalStorage.getCursorPatient().userId,
          //'user_id': 3158,
          'Doctor_id': appointment?.doctorId
          //'Doctor_id': 38371
        },
        //raw: true
      );
    }

    return MScaffold(
        title: Text(Consts.MEDICAL_RECORDS.toUpperCase()),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (__, _) {
            print(' patient id$patID');
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    Consts.VIEW_HISTORY,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              )
            ];
          },
          body: BlocProvider(
            create: (_) => bloc..add(const Load()),
            child: ApiBuilder<MedicalRecord>(
              fromJson: MedicalRecord.fromJsonFactory,
              loading: const ShimmerList(
                height: 80,
                padding: EdgeInsets.all(16),
                length: 10,
              ),
              customBuilder: (list, load) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (c, i) {
                    print("LISSSSSSSSSS${list[i]}");
                    final item = list[i];
                    return Hero(
                      tag: 'MEDICAl::$i',
                      child: MedicalRecordListItem(
                        data: item,
                        appointment: appointment,
                        onTap: () {
                          context.push(
                            Routes.medicalRecordDetails,
                            {
                              'i': i,
                              'data': item,
                              'appointment': appointment,
                              'appointment_id': item.Appointment_id
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
