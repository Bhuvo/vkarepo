import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../model/booking_appointment_patient.dart';
import '../../model/user.dart';

class ActionTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  final String? route;
  final String? name;
  final String? id;
  final String? phone;
  final String? email;
  final BookingAppointmentPatient? data;

  const ActionTile({
    Key? key,
    required this.title,
    this.subTitle,
    this.icon,
    this.onTap,
    this.route,
    this.name,
    this.id,
    this.phone,
    this.email,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      onTap: route != null
          ? () {
              context.push(route!, {
                "data":data,
              });
            }
          : onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            FaIcon(
              icon,
              color: MTheme.ICON_COLOR,
              size: 20,
            ),
            const SizedBox(
              width: 16,
            )
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
