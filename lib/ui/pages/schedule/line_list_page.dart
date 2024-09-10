import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/inr_patient.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'line_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_search_list_view.dart';

class LineListPage extends StatelessWidget {
  LineListPage({Key? key,}) : super(key: key);

  final bloc = ApiBuilderBloc(path: 'INRPatientList', query: {'Doctor_id':
  LocalStorage.getUID()
    //'38371'
  });

  @override
  Widget build(BuildContext context) {
    return HomePageBase(
      title: Consts.TOTAL_INR_LINELIST,
      body: BlocProvider(
        create: (c) => bloc..add(const Load()),
        child: ApiBuilder<InrPatient>(
          fromJson: InrPatient.fromJsonFactory,
          ///type: ApiBuilderType.searchList,
          builder: (InrPatient data, int index){
            print("DAAAAAAAAAATTTTTTTTTTTTTTTTTTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA$data");
            return LineListItem(
              data: data,
            );
          },
        ),
      ),
      // body: MSearchListView(
      //   itemBuilder: (c, i) {
      //     return const LineListItem();
      //   },
      // ),
    );
  }
}