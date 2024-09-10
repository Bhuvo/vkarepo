import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../facade/api_facade.dart';
import 'call_waiting_dialog.dart';
import 'package:http/http.dart' as http;

class BookingsDialog extends StatefulWidget {
  const BookingsDialog({super.key});

  @override
  State<BookingsDialog> createState() => _BookingsDialogState();
}

class _BookingsDialogState extends State<BookingsDialog> {
  String value = Consts.CLINICAL_VISIT;

  final navigatorKey = GlobalKey<NavigatorState>();
  bool isSubmitPressed = false;

  @override
  Widget build(BuildContext context) {
    return MDialog(
      title: Row(
        children: [
          Text(Consts.BOOKINGS.toUpperCase()),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.popDialog();
            },
            icon: const Icon(
              Icons.close_rounded,
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.056,
              ),
              child: MRadioChip<String>(
                value: value,
                items: const [
                  MRadioItem(
                      value: Consts.CLINICAL_VISIT,
                      label: Consts.CLINICAL_VISIT),
                  MRadioItem(
                      value: Consts.VIDEO_CONSULTATION,
                      label: Consts.VIDEO_CONSULTATION),
                ],
                type: MRadioChipType.radio,
                onChanged: (d) {
                  setState(() {
                    value = d;
                  });
                },
              ),
            ),
            isSubmitPressed
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Requesting Please wait"),
                        SizedBox(
                          width: 10,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: OutlinedButton(
                        child: const Text('SUBMIT'),
                        onPressed: () async {
                          setState(() {
                            isSubmitPressed = true;
                          });

                          switch (value) {
                            case Consts.CLINICAL_VISIT:
                              context.popDialog();
                              context
                                  .push(Routes.BookAnAppointmentClinicalVisit);
                              break;
                            case Consts.VIDEO_CONSULTATION:
                              context.popDialog();
                              context.push(Routes.bookAppointmentPage);
                              // context.push(Routes.scheduleAppointmentPatient,
                              //     {'instantDoctor': widget.doctor});
                              break;
                          }
                        },
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
