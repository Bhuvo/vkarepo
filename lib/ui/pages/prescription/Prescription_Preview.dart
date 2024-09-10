import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

import '../../../const/consts.dart';
import '../../../model/saved_presc.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../widgets/m_scaffold.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionPreview extends StatelessWidget {
  final pdf = pw.Document();
  ApiBuilderBloc patientbloc;
  List<SavedPrescription> PresscriptionDrugList;

  PrescriptionPreview(
      {Key? key,
      required this.patientbloc,
      required this.PresscriptionDrugList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("");
    print("");
    print("");
    print(PresscriptionDrugList[0].ListPresc!.length);
    print("");
    print("");
    print("");
    return MScaffold(body: UIbasedOnNumberofDrugs(context));
  }

  Padding TableRowItems(child) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        child,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 8),
      ),
    );
  }

  Widget UIbasedOnNumberofDrugs(context) {
    if (PresscriptionDrugList[0].ListPresc!.length <= 7) {
      print(
          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PresscriptionDrugList.length<=7");
      return Body(PresscriptionDrugList[0].ListPresc!, 0,
          PresscriptionDrugList[0].ListPresc!.length, context);
    } else if (PresscriptionDrugList[0].ListPresc!.length <= 14) {
      print(
          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PresscriptionDrugList.length<=14");
      return CupertinoScrollbar(
        thumbVisibility: true,
        thickness: 5,
        thicknessWhileDragging: 10,
        child: ListView(
          children: [
            Body(PresscriptionDrugList[0].ListPresc!, 0, 7, context),
            Body(PresscriptionDrugList[0].ListPresc!, 7,
                PresscriptionDrugList[0].ListPresc!.length, context)
          ],
        ),
      );
    } else if (PresscriptionDrugList[0].ListPresc!.length <= 21) {
      print(
          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PresscriptionDrugList.length<=21");
      return CupertinoScrollbar(
        thumbVisibility: true,
        thickness: 5,
        thicknessWhileDragging: 10,
        child: ListView(
          children: [
            Body(PresscriptionDrugList[0].ListPresc!, 0, 7, context),
            Body(PresscriptionDrugList[0].ListPresc!, 7, 14, context),
            Body(PresscriptionDrugList[0].ListPresc!, 14,
                PresscriptionDrugList[0].ListPresc!.length, context),
          ],
        ),
      );
    } else if (PresscriptionDrugList[0].ListPresc!.length <= 28) {
      print(
          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PresscriptionDrugList.length<=28");
      return CupertinoScrollbar(
        thumbVisibility: true,
        thickness: 5,
        thicknessWhileDragging: 10,
        child: ListView(
          children: [
            Body(PresscriptionDrugList[0].ListPresc!, 0, 7, context),
            Body(PresscriptionDrugList[0].ListPresc!, 7, 14, context),
            Body(PresscriptionDrugList[0].ListPresc!, 14, 21, context),
            Body(PresscriptionDrugList[0].ListPresc!, 21,
                PresscriptionDrugList[0].ListPresc!.length, context),
          ],
        ),
      );
    } else if (PresscriptionDrugList[0].ListPresc!.length <= 35) {
      print(
          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PresscriptionDrugList.length<=35");
      return CupertinoScrollbar(
        thumbVisibility: true,
        thickness: 5,
        thicknessWhileDragging: 10,
        child: ListView(
          children: [
            Body(PresscriptionDrugList[0].ListPresc!, 0, 7, context),
            Body(PresscriptionDrugList[0].ListPresc!, 7, 14, context),
            Body(PresscriptionDrugList[0].ListPresc!, 14, 21, context),
            Body(PresscriptionDrugList[0].ListPresc!, 21, 28, context),
            Body(PresscriptionDrugList[0].ListPresc!, 28,
                PresscriptionDrugList[0].ListPresc!.length, context),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget Body(PresscriptionDrugList, start, end, context) {
    print(
        "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::($start) ($end)");
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AspectRatio(
        aspectRatio: 1 / 1.414,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/timesmedlogo.png',
                      height: 20,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  Consts.PRESCRIPTION_FORM,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Doctor Name:${LocalStorage.getUser().fullName}",
                      style: TextStyle(fontSize: 10),
                    ),
                    Spacer(),
                    Text(
                      "Date & Time:${DateFormat('MM/dd/yyyy – kk:mm a').format(DateTime.now())}",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                BlocProvider(
                  create: (_) => patientbloc..add(const Load()),
                  child: ApiBuilder(
                      loading: CircularProgressIndicator(),
                      jsonBuilder: (data, load) {
                        print(
                            ":::::::::::::::::::::::::::::::::::::::::::::::::::::car${data[0]}");
                        print("prints data");
                        return Column(
                          children: [
                            Table(
                                border: TableBorder.all(color: Colors.black12),
                                // Allows to add a border decoration around your table
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                        color: MTheme.THEME_COLOR
                                            .withOpacity(0.75),
                                      ),
                                      children: [
                                        TableRowItems('Patient Name'),
                                        TableRowItems('Patient ID'),
                                        TableRowItems('Age'),
                                        TableRowItems('Gender'),
                                      ]),
                                  TableRow(children: [
                                    TableRowItems(
                                        "${data[0]["Data"][0]['First_Name'].toString().toUpperCase()} ${data.first['Last_Name'] ?? ""}"),
                                    TableRowItems(
                                        "${data[0]["Data"][0]['Patient_Id']}"),
                                    TableRowItems(
                                        '${data[0]["Data"][0]['Age']}'),
                                    TableRowItems(
                                        '${data[0]["Data"][0]['Gender']}'),
                                  ]),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Table(
                                defaultColumnWidth: IntrinsicColumnWidth(),
                                border: TableBorder.all(color: Colors.black12),
                                // Allows to add a border decoration around your table
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                        color: MTheme.THEME_COLOR
                                            .withOpacity(0.75),
                                      ),
                                      children: [
                                        TableRowItems('Qty'),
                                        TableRowItems('Drug Name'),
                                        TableRowItems('Frequency'),
                                        TableRowItems('M|A|N'),
                                        TableRowItems('Days'),
                                        TableRowItems('Dosage M|A|N'),
                                        TableRowItems('Instruction'),
                                        TableRowItems('Doctor Instruction'),
                                      ]),
                                  for (int i = start; i < end; i++)
                                    TableRow(children: [
                                      TableRowItems(PresscriptionDrugList[i]
                                          .dosage
                                          .toString()),
                                      TableRowItems(PresscriptionDrugList[i]
                                          .Drug_Name
                                          .toString()),
                                      TableRowItems(PresscriptionDrugList[i]
                                          .Frequency
                                          .toString()),
                                      TableRowItems(
                                          '${PresscriptionDrugList[i].MorningTime.toString()}|\n${PresscriptionDrugList[i].AfternoonTime.toString()}|\n${PresscriptionDrugList[i].NightTime.toString()}'),
                                      TableRowItems(PresscriptionDrugList[i]
                                          .Days
                                          .toString()),
                                      TableRowItems(
                                          '${PresscriptionDrugList[i].Morning.toString()}|${PresscriptionDrugList[i].Afternoon.toString()}|${PresscriptionDrugList[i].Night.toString()}'),
                                      TableRowItems(PresscriptionDrugList[i]
                                          .Instruction
                                          .toString()),
                                      TableRowItems(PresscriptionDrugList[i]
                                          .Doctor_Notes
                                          .toString()),
                                    ]),
                                ]),
                          ],
                        );
                      }),
                ),
                Spacer(),
                Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.green, size: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Timesmed HealthSoft Inc.,",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Suite 21060 Homestead Road, 170, Cupertino,CA 95014, USA",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.phone, color: Colors.green, size: 12),
                    Text(
                      "408 316 7025",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
