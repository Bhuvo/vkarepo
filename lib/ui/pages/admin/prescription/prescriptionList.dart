import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/model/appointment_data.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/pages/admin/prescription/prescriptionListController.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../../model/medical_record.dart';
import '../../../routes/routes.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/m_list_tile.dart';
import '../../medical_record/prescription_print.dart';

class Prescriptionlist extends StatefulWidget {
  const Prescriptionlist({super.key});

  @override
  State<Prescriptionlist> createState() => _PrescriptionlistState();
}

class _PrescriptionlistState extends State<Prescriptionlist> {
  PrescriptionListController controller = PrescriptionListController();
  bool isLoading = false;

  @override
  void dispose() {
controller.data.clear();
super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData()async{
    setState(() {
      isLoading = true;
    });
    await  controller.getTemplateList();
    setState(() {
      isLoading=false;
    } );
  }
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Prescription List'),
      body: isLoading ? LoadingWidget() : ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: controller.data.length,
        itemBuilder: (context , index){
          return controller.data.length == 0 ? NothingWidget(
            title: 'No Template Found',
            message: 'Please Add Template',
            onRefresh: (){
              getData();
            }
          ) : MListTile(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(8),
            //   boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 8)]
            // ),

            actions: [
              CustomSlidableAction(onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrescriptionPrint(
                        orgData: const MedicalRecord(),
                        labTest: [],
                        data:[],
                        appointment:AppointmentData()),
                  ));
              },
              child:  IconButton(onPressed: (){
                // context.push(Routes.addPrescriptionLettered);
              }, icon: Icon(Icons.remove_red_eye)),)

            ],
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StatusIndicator(label:'Status : ${controller.data[index].activeFlag == 'A' ? 'Active' : 'Inactive'}',color: controller.data[index].activeFlag == 'A' ? Colors.green : Colors.red,allCaps: false,bold: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PText('Template Id : ${controller.data[index].printTemplateId}'),
                    PText('Phone Number : ${controller.data[index].hospitalPhoneNumber}'),
                  ],
                ),
                Space(6),
                PText('Address : ${controller.data[index].hospitalAddress}'),
                Space(6),
              ],
            ),
          );
        },
      ),
      bottom:Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        width:MediaQuery.of(context).size.width *0.7,
        child: OutlinedButton(onPressed: () async {
          await context.push(Routes.addPrescriptionLettered);
          getData();
        }, child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add New Template',style: TextStyle(color: Colors.white),),
            Space(),
            Icon(Icons.add,color: Colors.white,),
          ],
        )
        ),
      ),
    );
  }
}

Widget PText(String text) {
  return Text(text ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),);
}
