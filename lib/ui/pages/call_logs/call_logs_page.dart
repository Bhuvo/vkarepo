import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/call_log.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/pages/call_logs/call_logs_list_item.dart';
import 'package:timesmedlite/ui/pages/home/home_bottom_navigation.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

import '../../widgets/m_apibuilder_empty_widget.dart';

class CallLogsPage extends StatelessWidget {
  CallLogsPage({Key? key}) : super(key: key);
  final bloc = ApiBuilderBloc(path: 'CallLog', query: {
    'From': DateFormat('MM/dd/yyyy').format(DateTime.now()),
    'To': DateFormat('MM/dd/yyyy').format(DateTime.now()),
    'Doctor_id': LocalStorage.getUID()
  });

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
        appBarBottom: const DoctorHeader(),
        paddingTop: 140,
        body: Column(
          children: [
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MDateTimePicker(
                onChanged: (v) {
                  bloc.add(UpdateQuery({
                    'From': DateFormat('MM/dd/yyyy').format(v!),
                    'To': DateFormat('MM/dd/yyyy').format(v),
                    'Doctor_id': LocalStorage.getUID()
                  }));
                },
                start: DateTime(2000),
                end: DateTime.now(),
                initial: DateTime.now(),
                label: "Enter Date in mm/dd/yyyy",
              ),
            ),
            Flexible(
              child: BlocProvider(
                create: (_) => bloc..add(const Load()),
                child: ApiBuilder<CallLog>(
                  empty: NothingWidget(
                    title: "No Call Log",
                    icon: Icons.list,
                    message: "No call log for the selected date.",
                    onRefresh: () {
                      bloc.add(const Refresh());
                    },
                  ),
                  shrinkWrap: true,
                  fromJson: CallLog.fromJsonFactory,
                  builder: (data, i) {
                    print(i);
                    return CallLogsListItem(
                      data: data,
                      i:i,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: const [
        //       SizedBox(height: 24,),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16),
        //         child: MTextField(
        //           label: 'Search by Name, Email, Mobile or ID',
        //           suffixIcon: Icon(CupertinoIcons.search),
        //         ),
        //       ),
        //       SizedBox(height: 8,),
        //       Text.rich(
        //         TextSpan(children: [
        //           TextSpan(text: '      Patient List'),
        //         ]),
        //         style: TextStyle(
        //             fontSize: 12,
        //             color: Colors.black54,
        //             fontWeight: FontWeight.w600),
        //       ),
        //       CallLogsListItem(),
        //       CallLogsListItem(),
        //       CallLogsListItem(),
        //     ],
        //   ),
        // ),
        title: Consts.CALL_LOG);
  }
}
