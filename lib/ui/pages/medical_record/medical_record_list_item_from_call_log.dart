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
import 'medical_record_list_item.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class MedicalRecordsListItemFromCallLog extends StatelessWidget {
  final docID;
  final patID;

  const MedicalRecordsListItemFromCallLog({Key? key, this.docID, this.patID,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiBuilderBloc bloc = ApiBuilderBloc(
      path: 'getdetails',
      query: {
        'user_id':patID,
        //'user_id': 3158,
        'Doctor_id': docID
        //'Doctor_id': 38371
      },
      //raw: true
    );
    return MScaffold(
        title: Text(Consts.MEDICAL_RECORDS.toUpperCase()),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (__, _){
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
                  loading: const ShimmerList( height: 80, padding: EdgeInsets.all(16), length: 10,),
                  customBuilder: (list, load) {
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (c, i) {
                        final item = list[i];
                        return Hero(
                            tag: 'MEDICAl::$i',
                            child: MedicalRecordListItem(
                              data: item,
                              onTap: () {
                                context.push(Routes.medicalRecordDetails, {'i': i, 'data': item});
                              },
                            ));
                      },
                    );
                  })),
        )
    );
  }
}
