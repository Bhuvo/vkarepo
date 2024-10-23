import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/pages/admin/prescription/prescriptionListController.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../routes/routes.dart';

class Prescriptionlist extends StatefulWidget {
  const Prescriptionlist({super.key});

  @override
  State<Prescriptionlist> createState() => _PrescriptionlistState();
}

class _PrescriptionlistState extends State<Prescriptionlist> {
  PrescriptionListController controller = PrescriptionListController();

  @override
  void dispose() {
controller.data.clear();
super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Prescription List'),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context , index){
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 8)]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StatusIndicator(label:'Status ${controller.data[index].activeFlag == 'A' ? 'Active' : 'Inactive'}',color: controller.data[index].activeFlag == 'A' ? Colors.green : Colors.red,allCaps: false,bold: true),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PText('Template Id:${controller.data[index].printTemplateId}'),
                          PText('Phone Number:${controller.data[index].hospitalPhoneNumber}'),
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
          ),
          IconButton.outlined(onPressed: (){
            context.push(Routes.addPrescriptionLettered);
          }, icon: Icon(Icons.add,color: MTheme.THEME_COLOR,) )
        ],
      ),
    );
  }
}

Widget PText(String text) {
  return Text(text ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),);
}
