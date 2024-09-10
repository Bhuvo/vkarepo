import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/clinical_note_loadsummary.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/clinical_notes_list_item.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../routes/routes.dart';

class ClinicalNotesList extends StatefulWidget {
  // String? doctorID="38371";
  // String? userID="8628";
  // String? appointmentID="150920";

  String doctorID;
  String userID;
  String appointmentID;

  ClinicalNotesList(
      {Key? key,
      required this.doctorID,
      required this.userID,
      required this.appointmentID})
      : super(key: key);

  @override
  State<ClinicalNotesList> createState() => _ClinicalNotesListState();
}

class _ClinicalNotesListState extends State<ClinicalNotesList> {
  late ApiBuilderBloc bloc;

  @override
  void initState() {
    bloc = ApiBuilderBloc(
      path: 'LoadSummary',
      query: {
        'User_id': widget.userID,
        'DoctorId': widget.doctorID,
      },
      api2: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///below three lines needs to be removed in production
    // doctorID="38371";
    // userID="8628";
    // appointmentID="150920";
    print(
        ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${widget.userID}");

    return MScaffold(
      title: const Text(Consts.CLINICAL_NOTES),
      body: BlocProvider(
          create: (c) => bloc..add(const Load()),
          child: ApiBuilder<ClinicalNotesLoadSummary>(
              // shrinkWrap: true,
              fromJson: ClinicalNotesLoadSummary.fromJsonFactory,
              customBuilder: (List<ClinicalNotesLoadSummary> list, _) {
                final data = list.first;
                return data.ClincialList == null
                    ? Center(
                        child: Container(
                          child: Text("No recrods"),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        itemBuilder: (c, i) {
                          final item = data.ClincialList![i];
                          return ClinicalNotesListitem(
                            bloc: bloc,
                            data: item,
                            appointmentID: widget.appointmentID,
                            doctorID: widget.doctorID,
                            userID: widget.userID,
                          );
                        },
                        itemCount: data.ClincialList?.length,
                      );
              })),
      //   ListView.builder(
      //   shrinkWrap: true,
      //   padding: const EdgeInsets.symmetric(vertical: 24),
      //   itemBuilder: (c, i){
      //     return const ClinicalNotesListitem();
      //   }, itemCount: 5,)
      bottom: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.maxFinite,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: OutlinedButton(
          child: Text('Add Clinical Note'),
          onPressed: () async {
            await context.push(Routes.clinicalNotesAddPage, {
              'doctorID': widget.doctorID.toString(),
              'userID': widget.userID.toString(),
              'appointmentID': widget.appointmentID.toString()
            });
            print("called");
            bloc.add(Refresh());
          },
        ),
      ),
    );
  }
}

// class ClinicalNotesList extends StatelessWidget {
//   const ClinicalNotesList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = ApiBuilderBloc(
//
//         path: 'LoadSummary',
//         query: {
//           'User_id': "8628",// need to check how to get UID fo user since this is in doctor view
//           'DoctorId': "38371",
//         });
//         print("BLOC:::::::::::::::::::::::::::::::::::::::::::::${bloc.data}");
//     return MScaffold(
//       title: const Text(Consts.CLINICAL_NOTES),
//       body: BlocProvider   (
//         create: (c) => bloc..add(const Load()),
//         child: ApiBuilder<ClinicalNotesLoadSummary>(
//           fromJson: ClinicalNotesLoadSummary.fromJsonFactory,
//           builder: (ClinicalNotesLoadSummary data, int index){
//             print("DATA:::::::::::::::::::::::::::::::::::::::  ${data}");
//             return  ClinicalNotesListitem();
//
//
//           },
//         ),
//       ),
//
//     );
//   }
// }
