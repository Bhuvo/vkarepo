import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_call_list_item.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../model/waiting_patient.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../waiting_list/waiting_list_item.dart';

class DayEndDialog extends StatelessWidget {
  const DayEndDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ApiBuilderBloc bloc = ApiBuilderBloc(
        path: 'Get_Waiting_Patient_List',
        raw: true,
        query: {'Doctor_id': LocalStorage.getUID()});

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          Text(Consts.DAY_END),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: BlocProvider(
          create: (c) => bloc..add(const Load()),
          child: ApiBuilder<WaitingPatient>(
            fromJson: WaitingPatient.fromJsonFactory,
            customBuilder: (data, load) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...data.map((e) => WaitingListItem(
                            data: e,
                          )).toList(),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'Doctor you have ${data.length} more patient to consult today..',
                      style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                    child: Text(
                      'Do you still want to close the day for calls...',
                      style:
                      Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: OutlinedButton(
                      child: Text(Consts.CONFIRM),
                      onPressed: () {
                        context.popDialog();
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
