import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';

import '../../components/patient_bottom_navigation.dart';
import '../../components/status_indicator.dart';
import '../../theme/theme.dart';
import '../../widgets/m_gradient_container.dart';
import '../../widgets/m_icon_button.dart';
import '../appointment/widgets/scheduled_appointment_list_item.dart';
import 'controller/clinical_appointment_controller.dart';

class ClinicalAppointments extends StatefulWidget {
  const ClinicalAppointments({super.key});

  @override
  State<ClinicalAppointments> createState() => _ClinicalAppointmentsState();
}

class _ClinicalAppointmentsState extends State<ClinicalAppointments> {

  ClinicalAppointmentController controller = ClinicalAppointmentController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()async{
    await controller.getClinicalAppointmentList('184376', '193976', 'W', '10/07/2024', '10/09/2024');
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      // bottom: const PatientBottomNavigation(),
      body: controller.patientList.length >0 ?ListView.builder(
        itemCount: controller.patientList.length,
        itemBuilder: (context ,index){
          return MListTile(
              actions: [
                CustomSlidableAction(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    child:  MIconButton(
                      color: MTheme.THEME_COLOR,
                      child: Icon(
                        Icons.done,
                        color: MTheme.THEME_COLOR,
                      ),
                    ),
                    onPressed: (BuildContext context) async {
                      await controller.changeStatus('50992' ,controller.patientList[index].Appointment_id.toString() , 'Accept');
                      await controller.getClinicalAppointmentList('184376', '193976', 'W', '10/07/2024', '10/09/2024');
                      setState(() {
                      });
                      print('done');
                    }
                ),
                CustomSlidableAction(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    child:  MIconButton(
                      color: MTheme.THEME_COLOR,
                      child: Icon(
                        Icons.clear,
                        color: MTheme.THEME_COLOR,
                      ),
                    ),
                    onPressed: (BuildContext context)async {
                      await controller.changeStatus('50992' ,controller.patientList[index].Appointment_id.toString() , 'Reject');
                      await controller.getClinicalAppointmentList('184376', '193976', 'W', '10/07/2024', '10/09/2024');
                      setState(() {
                      });
                    }
                ),
                CustomSlidableAction(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    child:  MIconButton(
                      color: MTheme.THEME_COLOR,
                      child: Icon(
                        Icons.timer_outlined,
                        color: MTheme.THEME_COLOR,
                      ),
                    ),
                    onPressed: (BuildContext context)async {
                      await controller.changeStatus('50992' ,controller.patientList[index].Appointment_id.toString() , 'Reschedule');
                      await controller.getClinicalAppointmentList('184376', '193976', 'W', '10/07/2024', '10/09/2024');
                      setState(() {
                      });
                    }
                )
              ],
              child:ScheduledAppointmentListItem(data: controller.patientList[index],onTap: (){},));
        },
      ) : Container(
        child: Center(child: Text('No data found',style: TextStyle(color:Colors.black,fontSize: 16),)),
      ),
    );
  }
}
