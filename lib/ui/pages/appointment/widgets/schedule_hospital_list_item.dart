import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/model/booking_hospital.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class ScheduleHospitalListItem extends StatelessWidget {
  final String? counter;
  final BookingHospital data;
  const ScheduleHospitalListItem({Key? key, this.counter, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        onTap: (){
          context.push(Routes.scheduledAppointmentList, {'hos_id': data.hospital_id ,
            'statusId': 'T',
          });
        },
        child: Row(
          children: [
            const SizedBox(width: 16,),
            const FaIcon(FontAwesomeIcons.hospital, color: MTheme.ICON_COLOR,),
            const SizedBox(width: 16,),
            Expanded(child: Text('${data.hospital_name}')),
            if(counter != null)Text('$counter', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
            const SizedBox(width: 8,),
            Icon(Icons.chevron_right_rounded, color: Colors.grey.shade300,)
          ],
        ));
  }
}
