import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/user_age_gender.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../model/user.dart';
import '../../../model/vka_patient_inr_details.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';

class ScheduleDetailsPage extends StatelessWidget {
  final patientID, TTR, patientage, gender, phoneNumber, TTRfrom, TTRto;

  ScheduleDetailsPage(
      {Key? key,
      this.patientID,
      this.TTR,
      this.patientage,
      this.gender,
      this.phoneNumber,
      this.TTRfrom,
      this.TTRto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DATT$patientID");
    return
          //return DropDownShimmer(label: 'Select Patient',);
          MScaffold(
            title: const Text(Consts.PATIENT_INR_DETAILS),
            body: BlocProvider(
              create: (context) => ApiBuilderBloc(
                  path: 'LastDateList',
                  query: {
                    'Patient_Id':'$patientID'?? '3158'
                    //'$patientID'
                    // needs to change once we receive the patient id from previous screen
                  },
                  raw: true)
                ..add(const Load()),
              child: ApiBuilder(
                shrinkWrap: true,
                jsonBuilder: (ldl, load) {
                  print("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaatata:  ${ldl}");
                  return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MTheme.RADIUS),
                          color: Colors.red),
                      child: Column(
                        children: [
                          Text(
                            'Time In Therapeutic Ratio (TTR) is',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            TTR.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MListTile(
                        margin: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserTile(
                              caption: Text(
                                'Age: ${patientage}, ${gender}',
                              ),
                              trailing: UserInfo(
                                Info.custom,
                                icon: FontAwesomeIcons.userCheck,
                                lable: "${patientID.toString()}",
                                textColor: MTheme.THEME_COLOR,
                                textSize: 12,
                                iconSize: 14,
                              ),
                            ),
                            MGradientContainer(
                                child: Row(
                              children: [
                                UserInfo(
                                  Info.custom,
                                  icon: Icons.phone,
                                  lable: "${phoneNumber.toString()}",
                                  textColor: MTheme.THEME_COLOR,
                                  textSize: 12,
                                  iconSize: 14,
                                ),
                                const Spacer(),
                                Wrap(
                                  children: [
                                    const Text(
                                      'Target INR:',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${TTRfrom.toString()} - ${TTRto.toString()}',
                                      style: TextStyle(
                                          color: Colors.red.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Wrap(
                                  children: [
                                    const Text(
                                      'Target INR:',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      ldl[0]["Target_INR"],
                                      style: TextStyle(
                                          color: Colors.red.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  'Next Test: ',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                UserInfo(
                                  Info.custom,
                                  icon: Icons.date_range,
                                  lable: ldl[0]['Next_Test'].toString(),
                                  textColor: MTheme.THEME_COLOR,
                                ),
                              ],
                            ),
                            const Divider(),
                            MTextContent(
                                head: 'Diagnosis:',
                                content: ldl[0]['Diagnosis'].toString()),
                            const Divider(),
                            MTextContent(
                                head: 'Drug:',
                                content: ldl[0]['Drug'].toString()),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        itemCount: ldl.length,
                        itemBuilder: (c, i) {
                          return Column(
                            children: [
                              WeekDosageTable(
                                Date: ldl[i]['Date'].toString(),
                                PT_Patient: ldl[i]['PT_Patient'].toString(),
                                PT_Control: ldl[i]['PT_Control'].toString(),
                                INR: ldl[i]['INR'].toString(),
                                weekData: {
                                  'sun': ldl[i]['Sun'].toString(),
                                  'mon': ldl[i]['Mon'].toString(),
                                  'tue': ldl[i]['Tue'].toString(),
                                  'wed': ldl[i]['Wed'].toString(),
                                  'thu': ldl[i]['Thu'].toString(),
                                  'fri': ldl[i]['Fri'].toString(),
                                  'sat': ldl[i]['Sat'].toString(),
                                },
                              ),
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    // const WeekDosageTable(
                    //   weekData: {
                    //     'sun': '',
                    //     'mon': '',
                    //     'tue': '',
                    //     'wed': '',
                    //     'thu': '',
                    //     'fri': '',
                    //     'sat': '',
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          },
      ),
    ),
          );

  }
}

class WeekDosageTable extends StatelessWidget {
  final Map<String, String> weekData;
  final Date, PT_Patient, PT_Control, INR, Diagnosis, Drug,isPatientView,INR_Details_Id,Notes;

  final vkaDateWiseEntries,OnlyTTR,blocForTTR,PatID,DcoID;

  const WeekDosageTable({
    Key? key,
    this.vkaDateWiseEntries,
    this.DcoID,
    this.PatID,
    this.OnlyTTR,
    required this.weekData,
    this.Date,
    this.INR,
    this.PT_Patient,
    this.PT_Control,
    this.Diagnosis,
    this.Drug,
    this.isPatientView=false, this.INR_Details_Id, this.Notes, this.blocForTTR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(isPatientView);
    return MListTile(
        onTap: () {
          // context.push(Routes.doctorAddInrDetails);
        },
        margin: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  UserInfo(
                    Info.custom,
                    icon: Icons.date_range,
                    lable: Date.toString(),
                    textColor: MTheme.THEME_COLOR,
                  ),
                  const Spacer(),
                  !isPatientView?Material(
                    color: Colors.transparent,
                    child: MIconButton(
                      onTap: ()async {
                        await context.push(Routes.doctorAddInrDetails, {
                          'DcoID':DcoID,
                          'PatID':PatID,
                          'weekData': weekData,
                          'Date': Date,
                          'PT_Patient': PT_Patient,
                          'PT_Control': PT_Control,
                          'INR': INR,
                          'Diagnosis': Diagnosis,
                          'INR_Details_Id': INR_Details_Id,
                          'Drug': Drug,
                          'Notes': Notes,
                          'blocForTTR':blocForTTR,
                          'OnlyTTR':OnlyTTR,
                          'vkaDateWiseEntries':vkaDateWiseEntries,

                        });



                      },
                      color: MTheme.THEME_COLOR,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.edit,
                        color: MTheme.THEME_COLOR,
                        size: 16,
                      ),
                    ),
                  ): Container(),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MTextContent2(
                          head: 'P.T(Patient)', content: PT_Patient.toString()),
                      MTextContent2(
                          head: 'P.T(Control)', content: PT_Control.toString()),
                      MTextContent2(head: 'INR:', content: INR.toString()),
                    ],
                  ),
                  const Divider(),
                  MTextContent(
                      head: 'Diagnosis:', content: Diagnosis??''),
                  const Divider(),
                  MTextContent(
                      head: 'Drug:', content: Drug??''),
                  const Divider(),
                  MTextContent(
                      head: 'Note:', content: Notes??''),
                ],
              ),
            ),
            const Divider(
              height: 1,
              indent: 0,
              endIndent: 0,
            ),
            Row(
              children: List.generate(
                  weekData.length,
                  (i) => TableItem(
                      child: Text(weekData.keys.toList()[i].toUpperCase()))),
            ),
            Row(
              children: List.generate(
                  weekData.length,
                  (i) => TableItem(
                        child: Text(
                            weekData[weekData.keys.toList()[i]]!.toUpperCase()),
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
            ),
          ],
        ));
  }
}

class TableItem extends StatelessWidget {
  final Widget child;
  final TextStyle? textStyle;

  const TableItem({Key? key, this.textStyle, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).dividerColor, width: 0.5)),
        child: DefaultTextStyle(
          style:
              textStyle ?? const TextStyle(color: Colors.black54, fontSize: 12),
          child: child,
        ),
      ),
    );
  }
}
