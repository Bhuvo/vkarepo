import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/lab_test/lab_test_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/waiting_dialog.dart';
import '../clinical_notes/detailed_add_complaint_dialog.dart';
import 'add_new_lab_test_dialog.dart';

class LabTestRequest extends StatefulWidget {
  final patientid, doctorid, appointmentid;

  const LabTestRequest({
    Key? key,
    this.patientid,
    this.doctorid,
    this.appointmentid,
  }) : super(key: key);

  @override
  State<LabTestRequest> createState() => _LabTestRequestState();
}

class _LabTestRequestState extends State<LabTestRequest> {
  Map<String, dynamic>? Depts, LabTestName;
  String? dept;
  int? DeptsID = 0;
  var appointmentId;
  var doctorId;
  var patientId;

  late ApiBuilderBloc getLabTestList;

  final dummyTests = [
    'Antinuclear antibody',
    'Blood chemistry study',
    'Blood lipid profile',
    'BNP testing',
    'Complete blood count (CBC)'
  ];
  final dummyDepts = [
    'Clinical microbiology',
    'Clinical chemistry',
    'Hematology',
    'Blood bank',
    'Molecular diagnostics',
    'Reproductive biology',
  ];

  TextEditingController instructionController = TextEditingController();

  String currentDate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  String currentTime = DateFormat("hh:mm:ss a").format(DateTime.now());

  late ApiBuilderBloc getlabtesttbloc =
      ApiBuilderBloc(path: 'get_labtest', query: {"dept_id": "26"});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(DeptsID);
    print(LabTestName);
    setState(() {
      appointmentId = widget.appointmentid;
      patientId = widget.patientid;
      doctorId = widget.doctorid;
      print(appointmentId);
      print(patientId);
    });
    getLabTestList = ApiBuilderBloc(
      path: 'get_laboratoryNew_SRMC',
      query: {
        'user_id': patientId.toString(),
        'Appointment_id': appointmentId.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(
        "LABBBB:::::::::::::::::::::::::::::::::::::::::::::::::::${LabTestName}");
    final ApiBuilderBloc departmentListbloc =
        ApiBuilderBloc(path: 'WebGetDepart', raw: true);

    return MScaffold(
      title: const Text(Consts.LAB_TEST_REQUEST),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  Add Lab Test',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocProvider(
                create: (_) => departmentListbloc..add(const Load()),
                child: ApiBuilder(
                  shrinkWrap: true,
                  loading: const DropDownShimmer(
                    label: 'Department',
                  ),
                  jsonBuilder: (data, load) {
                    print("data:  ${data[0]["DepartmentList"]}");
                    //return DropDownShimmer(label: 'Select Patient',);
                    return MDialogDown<dynamic>(
                        items: data[0]["DepartmentList"],
                        label: 'Department',
                        onChanged: (d) {
                          setState(() {
                            Depts = d;
                            print(
                                "index::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${data[0]["DepartmentList"].indexOf(d)}");
                            ;
                            DeptsID = data[0]["DepartmentList"]
                                    [data[0]["DepartmentList"].indexOf(d)]
                                ["dept_id"];
                            print(
                                "DEPT ID::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${DeptsID}");
                            ;
                          });
                          getlabtesttbloc.add(UpdateQuery(
                            {"dept_id": "${DeptsID.toString()}"},
                          ));
                        },
                        value: Depts,
                        labelKey: 'dept_name');
                  },
                ),
              ),
              BlocProvider(
                create: (_) => getlabtesttbloc..add(const Load()),
                child: ApiBuilder(
                  shrinkWrap: true,
                  loading: const DropDownShimmer(
                    label: 'Lab Test',
                  ),
                  jsonBuilder: (data, load) {
                    return MDialogDown<dynamic>(
                        isExpanded: true,
                        items: data,
                        label: DeptsID == 0
                            ? 'Please select Department first'
                            : 'Lab Test',
                        onChanged: (d) {
                          setState(() {
                            LabTestName = d;
                            print(
                                "LABBBB:::::::::::::::::::::::::::::::::::::::::::::::::::${LabTestName!['labtest_name']} ${LabTestName!['labtest_id']}");
                          });
                        },
                        value: LabTestName,
                        labelKey: 'labtest_name');
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              MListTile(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      // ...List.generate(dummyTests.length, (i) {
                      //   return Container(
                      //     decoration: BoxDecoration(
                      //         border: Border(
                      //             bottom: BorderSide(
                      //                 color: Theme.of(context).dividerColor))),
                      //     child: ListTile(
                      //       title: Text(dummyTests[i]),
                      //       trailing: const MIconButton(
                      //         child: Icon(
                      //           Icons.delete_outline,
                      //           color: Colors.red,
                      //           size: 20,
                      //         ),
                      //         color: Colors.red,
                      //         padding: EdgeInsets.all(4),
                      //       ),
                      //     ),
                      //   );
                      // }),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(text: 'Please '),
                            TextSpan(
                                text: 'Add New Test',
                                style: TextStyle(color: MTheme.THEME_COLOR)),
                            TextSpan(text: ' here.'),
                          ]),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 50,
                        child: OutlinedButton(
                            child: const Text('Add New Test'),
                            onPressed: () async {
                              print(appointmentId);
                              print(doctorId);
                              print(patientId);
                              if (DeptsID != 0) {
                                showDialog(
                                    context: context,
                                    builder: (c) => AddNewLabTestDialog(
                                          departmentId: DeptsID,
                                        ));
                              } else {
                                await Fluttertoast.showToast(
                                    msg: "Make Sure Department selected",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                controller: instructionController,
                label: 'Instructions',
                maxLines: 5,
                minLines: 3,
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 50,
                child: OutlinedButton(
                  child: const Text('Send Request'),
                  onPressed: () async {
                    print("start");
                    print("$currentDate $currentTime");
                    print(LabTestName!['labtest_id'].toString());
                    print(LabTestName!['labtest_name'].toString());
                    print(doctorId.toString());
                    print(DeptsID.toString());
                    print(appointmentId.toString());
                    if (instructionController.text.isEmpty) {
                      await Fluttertoast.showToast(
                          msg: "Enter new lab test",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else {
                      final call = Injector().apiService.post(
                        path: 'OPsave_laboratorySRMC',
                        body: {
                          "MasterDepartment_id": 1,
                          "Lab_Id": 0,
                          "LabTestMaster_id": 0,
                          "doctor_id": doctorId,
                          "admission_id": 0,
                          "patient_id": patientId,
                          "finding": instructionController.text,
                          "dept_id": DeptsID,
                          "results": instructionController.text,
                          "date": currentDate,
                          "time": currentTime,
                          "Appointment_id": appointmentId,
                          "LabTestList": [
                            {
                              "Testcode": LabTestName!['labtest_id'],
                              "Testname": LabTestName!['labtest_name']
                            }
                          ]
                        },
                      );
                      print("before res${patientId} , ${call.then((value) => print(value.body))}");
                      final res =
                          await showWaitingDialog(context: context, call: call);
                      print("inside res");
                      print("printing res msg1");
                      print(res?.bodyString);
                      print("printing res msg2");
                      print(res?.body.message);
                      print("printing res msg3");
                      if (res?.body.message == "Inserted SuccessFully") {
                        getLabTestList.add(const Refresh());
                        await Future.delayed(const Duration(milliseconds: 300));
                        setState(() {
                          instructionController.clear();
                          DeptsID = 0;
                          LabTestName = null;
                        });
                        await Fluttertoast.showToast(
                            msg: "Lab Test request saved",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      } else {
                        await Fluttertoast.showToast(
                            msg: res?.body.message,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lab Test Records',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              BlocProvider(
                create: (c) => getLabTestList..add(const Load()),
                child: ApiBuilder(
                    shrinkWrap: true,

                    jsonBuilder: (data, load) {
                      print("dataaaaaaaaaa                  $data");
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) => MListTile(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]["DeptName"],
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                            'Test Name: ${data[index]["labtest_name"]}'),
                                        Row(
                                          children: [
                                            const Text('Instructions: '),
                                            Text(
                                              data[index]["finding"],
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                  MIconButton(
                                    color: Colors.red,
                                    padding: const EdgeInsets.all(4),
                                    onTap: () async {
                                      final call = Injector()
                                          .apiService
                                          .get(path: 'DeleteSpecTest', query: {
                                        'LabTestMaster_id': data[index]
                                            ["LabTestMaster_id"],
                                      });
                                      print(data[index]["LabTestMaster_id"]);
                                      final res = await showWaitingDialog(
                                          context: context, call: call);
                                      if (res?.body.message ==
                                          "Deleted SuccessFully") {
                                        Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () async {
                                          setState(() async {
                                            getLabTestList.add(const Refresh());
                                            await Future.delayed(const Duration(
                                                milliseconds: 300));
                                          });
                                        });
                                        await Fluttertoast.showToast(
                                            msg: "Deleted Successfully",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                            fontSize: 16.0);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
