import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/patient.dart';
import '../../components/waiting_dialog.dart';

class AddInrDetails extends StatefulWidget {
  final DocID;
  final patID;

   AddInrDetails({Key? key, this.DocID, this.patID}) : super(key: key);

  @override
  State<AddInrDetails> createState() => _AddInrDetailsState();
}

class _AddInrDetailsState extends State<AddInrDetails> {
   final String doctorId = "179097";

   final String patientId = "3158";

   final TextEditingController _ptPatientController = TextEditingController();

   final TextEditingController _ptControlController = TextEditingController();

   final TextEditingController _inrController = TextEditingController();

   final TextEditingController  _dateController = TextEditingController();
   Map<String, dynamic>? doctor;
   // final  _dateController = TextEditingController(text: DateTime.now().toString());
   @override
  Widget build(BuildContext context) {
     _dateController..text=DateFormat('dd/MM/yyyy').format(DateTime.now());
     print(_dateController);
     print(widget.DocID);

     Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(Consts.ADD_INR_DETAILS),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: SingleChildScrollView(
              child: Container(
                height: size.height * 0.738,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    MSearchDown<Map<String, dynamic>>(
                      label: 'Search by Doctor Name',
                      suffixIcon: const Icon(CupertinoIcons.search),
                      onSearched: (String d) async {
                        final res = await Injector()
                            .apiService
                            .get(path: 'DoctorName_Search', query: {'term': d});
                        List<Map<String, dynamic>> list = [];
                        if (res.isSuccessful) {
                          print("Sucesssssssssssssssssss");
                          if (res.body?.data is List) {
                            for (var e in res.body!.data) {
                              list.add(e as Map<String, dynamic>);
                            }
                          }
                        }
                        return list;
                      },
                      labelKey: 'Doctor_Name',
                      subTitleKey: 'SubCategory_Name',
                      onChanged: (d) {
                        setState(() {
                          doctor = d;
                          // print("printing doctor");
                          // print(doctor!["SubCategory_id"].toString());
                          // doctorSpecialityID = doctor!["SubCategory_id"].toString();
                          // print(doctor!["SubCategory_Name"].toString());
                          // doctorSpecialityName =
                          //     doctor!["SubCategory_Name"].toString();
                        });
                      },
                    ),
                    MDateTimePicker(start: DateTime(2000), end: DateTime(2100), label: 'Select Date',onChanged: (d)
                    { final DateFormat formatter = DateFormat('dd/MM/yyyy');
                    final String formatted = formatter.format(d!);
                    _dateController.text=formatted ;
                    print(_dateController);
                    },),
                    const SizedBox(height: 16,),
                    MTextField(
                      label: 'P.T(Patient)',
                      type: MInputType.decimal,
                      suffixIcon: Icon(FontAwesomeIcons.stopwatch),
                      controller: _ptPatientController,
                    ),
                    const SizedBox(height: 12,),
                    MTextField(
                      label: 'P.T(Control)',
                      type: MInputType.decimal,
                      suffixIcon: Icon(FontAwesomeIcons.stopwatch),
                      controller: _ptControlController,
                    ),
                    const SizedBox(height: 12,),
                    MTextField(
                      label: 'INR',
                      type: MInputType.decimal,
                      controller: _inrController,
                    ),
                    Spacer(),
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
                                  context.pop();
                                },
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () async {
                                  print(_dateController.text);
                                    final call = Injector().apiService.get2(path: 'PatientINRDetails_Insert', query: {
                                      // 'Doctor_Id':  LocalStorage.getUser().id,
                                      // 'Patient_Id':  LocalStorage.getUID(),
                                      'Doctor_Id':doctor?['doctor'] ??  widget.DocID??doctorId,
                                      'Patient_Id': widget.patID ??patientId,
                                      'Date':  _dateController.text,
                                      'PT_Patient':  _ptPatientController.text,
                                      'PT_Control':  _ptControlController.text,
                                      'INR':  _inrController.text,
                                    });
                                    final res = await showWaitingDialog(context: context, call: call);
                                    print("${_dateController.text}+ ${_ptPatientController.text} ${_ptControlController.text} ${_inrController.text}");
                                    if(res?.body.message == "Details Inserted Successfully"){
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("Details Inserted Successfully"), duration: Duration(milliseconds: 2000), ), );
                                    }
                                    context.pop();
                                  },
                                  child: const Text('Save'))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
