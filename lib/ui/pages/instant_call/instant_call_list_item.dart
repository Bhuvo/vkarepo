import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/patient_schedule_header.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../model/instant_approval_request.dart';

class InstantCallListItem extends StatelessWidget {
  final bool paid;
  final String? userName;
  final String? transactionStatus;
  final String? mobileNumber;
  final String? date;
  final String? time;
  final String? meridiem;
  final String? doctorApprovalDateTime;
  final String? doctorApprovalDate;
  final String? doctorApprovalTime;
  final String? doctorApprovalMeridiem;
  final String? doctorApproval;
  final String? orderDate;
  final String? orderTime;
  final String? orderDateMeridiem;

  const InstantCallListItem({
    Key? key,
    this.paid = true,
    this.userName,
    this.transactionStatus,
    this.mobileNumber,
    this.date,
    this.time,
    this.meridiem,
    this.doctorApprovalDateTime,
    this.doctorApprovalDate,
    this.doctorApprovalTime,
    this.doctorApprovalMeridiem,
    this.doctorApproval,
    this.orderDate,
    this.orderTime,
    this.orderDateMeridiem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String errorDate = "No Dates";
    return MListTile(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              const UserAvatar(
                radius: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName?.toUpperCase() ?? "Username",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  // if (caption != null) caption!
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              UserInfo(
                Info.custom,
                icon: FontAwesomeIcons.calendar,
                lable: date ?? errorDate,
                textColor: MTheme.THEME_COLOR,
              ),
              UserInfo(
                Info.custom,
                icon: FontAwesomeIcons.clock,
                lable: "$time $meridiem" ?? errorDate,
                textColor: MTheme.THEME_COLOR,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          MGradientContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                    spacing: 2,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Doctor Approved Date and Time: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black54),
                      ),
                      const Icon(
                        Icons.date_range,
                        color: Colors.black87,
                        size: 16,
                      ),
                      Text(doctorApprovalDate!,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.black87,
                        size: 14,
                      ),
                      Text("$doctorApprovalTime $doctorApprovalMeridiem",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'APPROVED   ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: MTheme.THEME_COLOR),
                    ),
                    if (doctorApproval != "R") ...[
                      const Text('PAID  ',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      const Text('on ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      const Icon(
                        Icons.date_range,
                        color: Colors.black54,
                        size: 13,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        orderDate ?? '',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.black54,
                        size: 11,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        "$time $meridiem"
                        // '$orderTime $orderDateMeridiem'
                        ,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ] else ...const [
                      Text(
                        'NOT PAID  ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
