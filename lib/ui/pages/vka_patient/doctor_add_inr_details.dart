import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';

class DoctorAddInrDetails extends StatefulWidget {
  final Map<String, String> weekData;
  final Date, PT_Patient, PT_Control, INR, Diagnosis, Drug,INR_Details_Id,Notes;
  final  blocForTTR,OnlyTTR,vkaDateWiseEntries,PatID,DcoID;

  DoctorAddInrDetails({
    Key? key,
    required this.weekData,
    this.PatID,
    this.DcoID,
    this.blocForTTR,
    this.OnlyTTR,
    this.vkaDateWiseEntries,
    this.Date,
    this.PT_Patient,
    this.PT_Control,
    this.INR,
    this.Diagnosis,
    this.Drug, this.INR_Details_Id, this.Notes,
  }) : super(key: key);

  @override
  State<DoctorAddInrDetails> createState() => _DoctorAddInrDetailsState();
}

class _DoctorAddInrDetailsState extends State<DoctorAddInrDetails> {
  final dummyDrugs = const [
    'Warfarin',
    'Acenocoumarol',
  ];

  Map<String, dynamic>?  drugName;

  List<TextEditingController> _controllerList = [];

  TextEditingController ptPatientController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController drugController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  TextEditingController inrController = TextEditingController();
  TextEditingController ptControlController = TextEditingController();
  TextEditingController nextTestDate = TextEditingController();
  var drugselected = "";
  //String? testDate;
  var dateFromPreviousPage;
 // DateTime NextDate = DateTime.now();
  DateTime? TestDate;
  bool neverEnds = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inrController.text = widget.INR;
    ptControlController.text = widget.PT_Control;
    ptPatientController.text = widget.PT_Patient;
    //nextTestDate.text = widget.Date;
    diagnosisController.text = widget.Diagnosis;
    drugController.text = widget.Drug;
    notesController.text=widget.Notes;

    DateTime DateToday = DateTime.now();
    print("DDDDDD${widget.Date}");
    drugselected=widget.Drug;

    // TestDate = DateFormat("dd/MM/yyyy").parse(widget.Date);
    // print(TestDate);
    // print(DateFormat("dd/MM/yyyy").parse(widget.Date));
    // print("formatted date");

    try{
      TestDate = DateFormat("dd/MM/yyyy").parse(widget.Date);

    }
    catch(e){
      TestDate = DateFormat("yyyy-MM-dd").parse(widget.Date);

    }

    /// The below code is for placing the controller values to respective week keys..
    var list = widget.weekData.entries.map((e) => e.value).toList();
    var count = widget.weekData.length;
    _controllerList = List.generate(
        count == 0 ? 1 : count, (index) => TextEditingController());
    var index = 0;
    for (var item in _controllerList) {
      item.text = list[index];
      index++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;
    print("XXXXXXXXXXXXXXXXXX${widget.INR_Details_Id}");
    return MScaffold(
      title: const Text(Consts.INR_DETAILS),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ListView(
          padding: EdgeInsets.only(top: 5),
          children: [
            BlocProvider(
              create: (c) => ApiBuilderBloc(
                  path: 'PopupAlert',
                  query: {
                    'INR_Details_Id':
                    //DcoID??
                    '${widget.INR_Details_Id}',
                  },
                  raw: true)
                ..add(const Load()),
              child: ApiBuilder(
                empty: Container(),
                  shrinkWrap: true,
                  jsonBuilder: (data, load) {
                    var text=data[0]['Dose_Change'];
                    print("XXXXXXXXXXXXXXXXXX${data[0]['Dose_Change']}");
                    return Padding(
                      padding: const EdgeInsets.all(8 ),
                      child: Text(text,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    );
                  }),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                runSpacing: 5,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(Consts.daysOfWeekFull.length, (i) {
                  final name = Consts.daysOfWeekFull[i];

                  return SizedBox(
                    width: context.getWPercent(30),
                    child: MTextField(
                      controller: _controllerList[i],
                      type: MInputType.decimal,
                      labelWidget: Text(
                        name,
                        style: const TextStyle(fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                      suffixIcon: Container(
                        width: 24,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'mg',
                          style: TextStyle(
                              fontSize: 12,
                              color: MTheme.ICON_COLOR.withOpacity(0.75),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            MTextField(
              controller: inrController,
              label: 'INR',
              type: MInputType.decimal,

            ),

            const SizedBox(
              height: 12,
            ),
            // MDateTimePicker(
            //   start: DateTime(2000), end: DateTime(2100), label: 'Next Test',
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Stack(
                children: [
                  InputDatePickerFormField(
                    key: ValueKey(TestDate),
                    lastDate: DateTime(2100),
                    firstDate: DateTime(2000),
                    initialDate: TestDate,
                    fieldLabelText: 'Next Test',
                    onDateSubmitted: (d) {
                      setState(() {
                        TestDate = d;
                      });
                    },
                    onDateSaved: (d) {
                      setState(() {
                        TestDate = d;
                        print(TestDate);
                      });
                    },
                    selectableDayPredicate: (d) {
                      return true;
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.calendarDays,
                            color: MTheme.ICON_COLOR,
                          ),
                          onPressed: () async {
                            final selected = await showDatePicker(
                                context: context,
                                initialDate: TestDate!,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));

                            if (selected != null) {
                              setState(() {
                                TestDate = DateTime(
                                    selected.year,
                                    selected.month,
                                    selected.day,
                                    selected.hour,
                                    selected.minute,
                                    selected.second);
                              });
                            }
                          },
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MTextField(
              controller: diagnosisController,
              label: 'Diagnosis',
              minLines: 3,
              maxLines: 5,
            ),
            const SizedBox(
              height: 12,
            ),
            MDialogDown(
              onChanged: (d) {
                setState(() {
                  drugselected='$d' ;
                  print("OOOOOOOOOOONNNNNNNNNN$d");
                });
              },
              value: (drugselected=='')||((drugselected !=('Warfarin'))&&(drugselected !='Acenocoumarol'))?null:drugselected,

              label: 'Drug',
              items: dummyDrugs,
            ),



            // MSearchDown<Map<String, dynamic>>(
            //   label: 'Drug Name',
            //   hint: 'Search by Drug Name',
            //   labelKey: 'Drug_Name',
            //   suffixIcon: const Icon(CupertinoIcons.search),
            //   onSearched: (String d) async {
            //     print(d);
            //     final res = await Injector()
            //         .apiService
            //         .rawGet(path: 'GetTablet', query: {
            //       'Doctor_id': LocalStorage.getUID(),
            //       //'178936',
            //       'term': d
            //     });
            //     List<Map<String, dynamic>> list = [];
            //     print(
            //         "RES :::::::::::::::::::::::::::::::  ${res.bodyString}");
            //     if (res.isSuccessful) {
            //       print("SUCCESS");
            //
            //       if (json.decode(res.bodyString) is List) {
            //         print("res.bodyString is List");
            //         for (var e in json.decode(res.bodyString) as List) {
            //           list.add(e as Map<String, dynamic>);
            //         }
            //       }
            //     }
            //     return list;
            //   },
            //   onChanged: (d) {
            //     setState(() {
            //       drugName = d;
            //       drugselected=d!['Drug_Name'];
            //       print("DDDDDDDDDDDDRRRRRR$drugName");
            //     });
            //   },
            //  // value:drugName,
            //   controller: drugController..text=drugselected,
            // ),
            const SizedBox(
              height: 16,
            ),
            MTextField(
              controller: notesController,
              label: 'Notes',
              minLines: 3,
              maxLines: 5,
            ),

           // const Spacer(),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inrController.clear();
                        diagnosisController.clear();
                        drugController.clear();
                        notesController.clear();
                        drugselected = '';
                        _controllerList.clear();
                      });
                      context.pop();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () async {
                            print("NextDates of date ${TestDate}");
                            print("${drugController.text}            ${widget.INR_Details_Id}         ${_controllerList[6].text.replaceAll('mg', '').trim()}    ${inrController.text}     ${DateFormat("dd/MM/yyyy").format(TestDate!)}      ${notesController.text}        ${drugController.text}");

                            final call = Injector().apiService.post(
                                path: 'INRPatientDetails_recieve_insert',
                                body: {
                                  "Sun": _controllerList[0].text.replaceAll('mg', '').trim(),
                                  "Mon": _controllerList[1].text.replaceAll('mg', '').trim(),
                                  "Tue": _controllerList[2].text.replaceAll('mg', '').trim(),
                                  "Wed": _controllerList[3].text.replaceAll('mg', '').trim(),
                                  "Thu": _controllerList[4].text.replaceAll('mg', '').trim(),
                                  "Fri": _controllerList[5].text.replaceAll('mg', '').trim(),
                                  "Sat": _controllerList[6].text.replaceAll('mg', '').trim(),
                                  "Target_INR": inrController.text,
                                  "Next_Test": DateFormat("dd/MM/yyyy").format(TestDate!).toString(),
                                  "Diagnosis": diagnosisController.text,
                                  "Drug": drugselected,
                                  "INR_Details_Id":widget.INR_Details_Id,
                                  "Notes":notesController.text,
                                });

                            final res = await showWaitingDialog(
                                context: context, call: call);
                            print(
                                "RES::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ${res?.body}");

                            if (res?.body.message == "Inserted SuccessFully"||res?.body.message == "Updated SuccessFully") {
                              inrController.clear();
                              diagnosisController.clear();
                              drugController.clear();
                              drugselected = '';
                              _controllerList.clear();

                              context.pop();
                              context.pop();
                              context.push(Routes.myInrDetails, {'DcoID': widget.DcoID,'PatID':widget.PatID});
                              print("BBBBBBBBBBBBBBBBBBBBBBBB${widget.DcoID} ${widget.PatID}");
                              //widget.blocForTTR.add(Refresh());
                              // widget.OnlyTTR.add(Refresh());
                              // widget.vkaDateWiseEntries.add(Refresh());


                              //context.popDialog();
                            }
                          },
                          child: const Text('Save'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
