import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/patient_bottom_navigation.dart';
import 'package:timesmedlite/ui/components/user_age_gender.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_header.dart';
import 'package:timesmedlite/ui/pages/schedule/schedule_details_page.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../model/patient.dart';
import '../../../model/vka_doctor_details.dart';
import '../../../model/vka_patient_inr_details.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/user_avatar.dart';

class MyInrDetails extends StatefulWidget {
  final DcoID, PatID;

  const MyInrDetails({
    Key? key,
    this.DcoID,
    this.PatID,
  }) : super(key: key);

  @override
  State<MyInrDetails> createState() => _MyInrDetailsState();
}

class _MyInrDetailsState extends State<MyInrDetails> {


  late ApiBuilderBloc vkaDateWiseEntries;
  late ApiBuilderBloc blocForTTR;
  late ApiBuilderBloc OnlyTTR;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     vkaDateWiseEntries = ApiBuilderBloc(
        path: 'VKADateWiseEntries',
        query: {
          'PatientId': widget.PatID ?? "3158",
        },
        api2: true);


    blocForTTR = ApiBuilderBloc(
        path: 'VKAPatientProfile',
        query: {
          'PatientId': widget.PatID ?? "3158",
        },
        api2: true);

    OnlyTTR = ApiBuilderBloc(
      path: 'TTRPercentage',
      query: {
        'Patient_Id': widget.PatID ?? "3158",
      },raw: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    print(
        "MyInrDetailsMyInrDetailsMyInrDetailsMyInrDetailsMyInrDetailsMyInrDetailsMyInrDetailsMyInrDetails : ${widget.DcoID}   ${widget.PatID}  ");

    final doctor =
        Consts.DUMMY_USER.copyWith(fullName: 'Dr. Koushik Muthu Raj M');

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    final String formattedDate = formatter.format(now);

    String diagnosisData = '';
    String drugData = '';

    // final ApiBuilderBloc inrDetailsBloc = ApiBuilderBloc(
    //   path: 'PatientINRDetails',
    //   query: {
    //     'DoctorId': DcoID ?? "179097",
    //     // need to check how to get UID fo user since this is in doctor view
    //     'PatientId': PatID ?? "3158",
    //   },
    //   api2: true,
    //   raw: true,
    // );
    //
    // final ApiBuilderBloc doctorProfile = ApiBuilderBloc(
    //     path: 'VKADoctorDetails',
    //     query: {
    //       'DoctorId':
    //           //DcoID??
    //           "179097",
    //     },
    //     api2: true);



    print(Patient().doctorId);


    return MScaffold(
      appBarBottom: widget.DcoID == null ? DashboardHeader() : null,
      title: Text(Consts.PATIENT_INR_DETAILS),
      paddingTop: widget.DcoID == null ? 140 : 50,
      body: BlocProvider(
        create: (c) => ApiBuilderBloc(
            path: 'VKAPatientProfile',
            query: {
              'PatientId': widget.PatID ?? "3158",
            },
            api2: true)..add(const Load()),
        child: ApiBuilder(
            shrinkWrap: true,
            jsonBuilder: (d, load) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.13,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MTheme.RADIUS),
                              color: Colors.red),
                          child: BlocProvider(
                              create: (context) => ApiBuilderBloc(
                                path: 'TTRPercentage',
                                query: {
                                  'Patient_Id': widget.PatID ?? "3158",
                                },raw: true,
                              )..add(const Load()),
                              child: ApiBuilder(
                                  shrinkWrap: true,
                                  jsonBuilder: (TTR, load) {
                                    final timeInTherapeuticRatio =
                                    '${TTR[0]['Percentage']}' == "null"
                                        ? '0'
                                        : '${TTR[0]['Percentage']}';
                                    print("TTTTTRRRRRRRRRRRTTTTTTTT${TTR[0]['Percentage']}");
                                    return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: double.infinity,
                                              child: Text(
                                                'Time In Therapeutic Ratio (TTR) is',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "$timeInTherapeuticRatio %",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w600,fontSize: context.width*0.122),
                                          ),
                                        ]);
                                  }))),
                      const SizedBox(
                        height: 10,
                      ),
                      MListTile(
                        margin: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocProvider(
                              create: (c) => ApiBuilderBloc(
                                  path: 'VKADoctorDetails',
                                  query: {
                                    'DoctorId':
                                        //DcoID??
                                        '${d[0]["Doctor_Id"]}',
                                  },
                                  api2: true)
                                ..add(const Load()),
                              child: ApiBuilder(
                                  shrinkWrap: true,
                                  jsonBuilder: (data, load) {
                                    print(
                                        "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX${data[0]["DoctorRegistration_List"]}");
                                    final doctorName = data[0]
                                        ["DoctorRegistration_List"][0]["Name"];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const UserAvatar(
                                            radius: 24,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (doctorName != null)
                                                  Text(
                                                    'Dr. $doctorName',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(fontSize: 16),
                                                  ),
                                              ]),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            BlocProvider(
                              create: (c) => ApiBuilderBloc(
                                  path: 'VKADoctorDetails',
                                  query: {
                                    'DoctorId':
                                        //DcoID??
                                        '${d[0]["Doctor_Id"]}',
                                  },
                                  api2: true)
                                ..add(const Load()),
                              child: ApiBuilder(
                                  shrinkWrap: true,
                                  jsonBuilder: (data, load) {
                                    final phoneNumber = data[0]
                                            ["DoctorRegistration_List"][0]
                                        ["Phone_Number"];
                                    final emailId = data[0]
                                            ["DoctorRegistration_List"][0]
                                        ["EMail_Id"];
                                    final hospitalNumber = data[0]
                                            ["DoctorRegistration_List"][0]
                                        ["Hospital_Number"];
                                    return MGradientContainer(
                                      child: Wrap(
                                        spacing: 20,
                                        runSpacing: 8,
                                        children: [
                                          UserInfo(
                                            Info.custom,
                                            icon: Icons.phone,
                                            lable: phoneNumber,
                                          ),
                                          UserInfo(
                                            Info.custom,
                                            icon: Icons.mail,
                                            lable: emailId,
                                          ),
                                          UserInfo(
                                            Info.custom,
                                            icon:
                                                FontAwesomeIcons.solidHospital,
                                            lable: hospitalNumber,
                                            iconSize: 14,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            BlocProvider(
                              create: (c) =>
                              ApiBuilderBloc(
                                  path: 'VKADateWiseEntries',
                                  query: {
                                    'PatientId': widget.PatID ?? "3158",
                                  },
                                  api2: true)..add(const Load()),
                              child: ApiBuilder(
                                empty: Container(),
                                shrinkWrap: true,
                                jsonBuilder: (data, load) {
                                  final targetInr = data[0]['Target_INR'];
                                  final nextTestDate = data[0]['Next_Test'];
                                  final diagnosis = data[0]["Diagnosis"];
                                  diagnosisData = diagnosis;
                                  final drug = data[0]["Drug"];
                                  drugData = drug;
                                  //final note = data[0]["Notes"];

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                targetInr ?? '',
                                                style: TextStyle(
                                                    color: Colors.red.shade500,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                            'Next Test: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          UserInfo(
                                            Info.custom,
                                            icon: Icons.date_range,
                                            lable: nextTestDate.toString(),
                                            textColor: MTheme.THEME_COLOR,
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      MTextContent(
                                          head: 'Diagnosis:',
                                          content: diagnosis ?? ''),
                                      const Divider(),
                                      MTextContent(
                                          head: 'Drug:', content: drug ?? ''),
                                      // const Divider(),
                                      // MTextContent(
                                      //     head: 'Note:', content: note ?? ''),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocProvider(
                        create: (c) => ApiBuilderBloc(
                          path: 'PatientINRDetails',
                          query: {
                            'DoctorId': '${d[0]["Doctor_Id"]}',
                            // need to check how to get UID fo user since this is in doctor view
                            'PatientId': widget.PatID,
                          },
                          api2: true,
                          raw: true,
                        )..add(const Load()),
                        child: ApiBuilder(
                          shrinkWrap: true,
                          jsonBuilder: (data, load) {
                            // final ptPatient = data[0]["Data"]["PT_Patient"];
                            // final ptControl = data[0]["Data"]["PT_Control"];
                            // print("$ptControl $ptPatient");
                            return ListView.builder(
                                    reverse: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    itemBuilder: (c, i) {
                                      print(
                                          "XXXXXXXXXXXXXXXXXXXXXX${data[0]["Data"][i]["Notes"]}");
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: WeekDosageTable(
                                          // vkaDateWiseEntries:vkaDateWiseEntries,
                                          // blocForTTR: blocForTTR,
                                          // OnlyTTR:OnlyTTR,
                                          DcoID:widget.DcoID, PatID:widget.PatID,

                                          isPatientView: false,
                                          Diagnosis:
                                              "${data[0]["Data"][i]["Diagnosis"]}",
                                          Drug: "${data[0]["Data"][i]["Drug"]}",
                                          PT_Patient:
                                              "${data[0]["Data"][i]["PT_Patient"]}",
                                          PT_Control:
                                              "${data[0]["Data"][i]["PT_Control"]}",
                                          INR: "${data[0]["Data"][i]["INR"]}",
                                          Date: "${data[0]["Data"][i]["Date"]}",
                                          INR_Details_Id: data[0]["Data"][i]
                                              ["INR_Details_Id"],
                                          Notes: data[0]["Data"][i]["Notes"],
                                          weekData: {
                                            'sun':
                                                "${data[0]["Data"][i]["Sun"]} mg",
                                            'mon':
                                                "${data[0]["Data"][i]["Mon"]} mg",
                                            'tue':
                                                "${data[0]["Data"][i]["Tue"]} mg",
                                            'wed':
                                                "${data[0]["Data"][i]["Wed"]} mg",
                                            'thu':
                                                "${data[0]["Data"][i]["Thu"]} mg",
                                            'fri':
                                                "${data[0]["Data"][i]["Fri"]} mg",
                                            'sat':
                                                "${data[0]["Data"][i]["Sat"]} mg",
                                          },
                                        ),
                                      );
                                    },
                                    itemCount: data[0]["Data"].length)
                                //data[0]["Data"].length)
                                ;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      bottom: widget.DcoID == null ? PatientBottomNavigation() : null,
    );
  }
}
