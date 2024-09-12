import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import '../../../model/patient.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/nothing_widget.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../providers/patient_provider.dart';
import '../home/home_bottom_navigation.dart';
import '../patient_registration/patient_register_list_item.dart';
import 'schedule_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_search_list_view.dart';

class ScheduleListPage extends StatelessWidget {
  final bool isPendingList;
  final title;

  ScheduleListPage({Key? key, this.isPendingList = false, this.title = ''})
      : super(key: key);
  final bloc_isNull = ApiBuilderBloc(
      path: 'TodayINRList_ISNull',
      query: {
        'Doctor_id': LocalStorage.getUID(),
      },
      raw: true);
  final bloc_isNotNull = ApiBuilderBloc(
      path: 'TodayINRList_ISNOTEQUALNull',
      query: {
        'Doctor_id':
            //'178936'
            LocalStorage.getUID(),
      },
      raw: true);
  final Pendingbloc = ApiBuilderBloc(
      path: 'Total_Pending_Cases',
      query: {
        'Doctor_id':
            //'178936'
            LocalStorage.getUID(),
      },
      raw: true);

  @override
  Widget build(BuildContext context) {
    return HomeBottomNavigation(
      title: title == ''
          ? isPendingList
              ? Consts.TOTAL_PENDING_CASES
              : Consts.TODAY_INR_SCHEDULE_LIST
          : title,
      body:
          // MSearchListView(
          //  MSearchListView
          //     return  ScheduleListItem();
          //   },
          // ),
          BlocProvider(
        create: (_) => isPendingList ? Pendingbloc : bloc_isNull
          ..add(const Load()),
        // create: (_) => bloc..add(const Load()),
        child: isPendingList
            ? ApiBuilder(
                empty: NothingWidget(
                  title: "No Pending Case",
                  icon: Icons.timer,
                  //message: "No call log for the selected date.",
                  onRefresh: () {
                    Pendingbloc.add(const Refresh());
                  },
                ),
                shrinkWrap: true,
                jsonBuilder: (data, load) {
                  print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX${data}");
                  return ListView.builder(
                      itemCount: data.first['Data'].length,
                      itemBuilder: (c, i) {
                        return PatientProvider(
                            child: ScheduleListItem(
                              data: Patient.fromJson(data.first['Data'][i]),
                              bloc: Pendingbloc,
                            ),
                            data: Patient.fromJson(data.first['Data'][i]));
                      });
                },
              )
            : SingleChildScrollView(
                //physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text.rich(
                      TextSpan(children: [
                        TextSpan(text: '      Pending Scheduled Case '),
                        TextSpan(
                            text: '●',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                      ]),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    BlocProvider(
                      create: (_) => bloc_isNull..add(const Load()),
                      child: ApiBuilder(
                        empty: NothingWidget(
                          title: "No Pending Scheduled Case",
                          icon: Icons.perm_contact_calendar_outlined,
                          message: "",
                          onRefresh: () {
                            bloc_isNull.add(const Refresh());
                          },
                        ),
                        shrinkWrap: true,
                        jsonBuilder: (data, load) {
                          print(
                              "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX${data}");
                          return ListView.builder(
                            shrinkWrap: true,
                              itemCount: data.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (c, i) {
                                return PatientProvider(
                                    child: ScheduleListItem(
                                      data: Patient.fromJson(data[i]),
                                      bloc: bloc_isNull,
                                    ),
                                    data: Patient.fromJson(data[i]));
                              });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text.rich(
                      TextSpan(children: [
                        TextSpan(text: '      Completed Scheduled Case '),
                        TextSpan(
                            text: '●',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600)),
                      ]),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    BlocProvider(
                      create: (_) => bloc_isNotNull..add(const Load()),
                      child: ApiBuilder(
                        empty: NothingWidget(
                          title: "No Completed Scheduled Case",
                          icon: Icons.perm_contact_calendar_outlined,
                          message: "",
                          onRefresh: () {
                            bloc_isNotNull.add(const Refresh());
                          },
                        ),
                        shrinkWrap: true,
                        jsonBuilder: (data, load) {
                          print(
                              "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX${data}");
                          return ListView.builder(
                            shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (c, i) {
                                return PatientProvider(
                                    child: ScheduleListItem(
                                      data: Patient.fromJson(data[i]),
                                      bloc:bloc_isNotNull ,
                                    ),
                                    data: Patient.fromJson(data[i]));
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
