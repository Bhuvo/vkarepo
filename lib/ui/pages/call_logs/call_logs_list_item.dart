import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/call_log.dart';
import 'package:timesmedlite/model/medical_record.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/check_item.dart';
import 'package:timesmedlite/ui/components/patient_schedule_header.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';

class CallLogsListItem extends StatelessWidget {
  final CallLog? data;
  final int i;

  CallLogsListItem({Key? key, this.data, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiBuilderBloc bloc = ApiBuilderBloc(
      path: 'getdetails',
      query: {
        'user_id': data?.User_id,
        //'user_id': 3158,
        'Doctor_id': LocalStorage.getUID(),
        //'Doctor_id': 38371
      },
      //raw: true
    );
    final user = User(
        name: data?.User_Name, email: data?.Emailid, fullName: data?.User_Name);

    // return BlocProvider(
    //     create: (_) => bloc..add(const Load()),
    //     child: ApiBuilder<MedicalRecord>(
    //         shrinkWrap: true,
    //         fromJson: MedicalRecord.fromJsonFactory,
    //         builder: (MedicalRecord, _) {
    return UserProvider(
      data: user,
      child: MListTile(
        actions: [
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.transparent,
            child: const MIconButton(
              color: MTheme.THEME_COLOR,
              child: Icon(
                Icons.done,
                color: MTheme.THEME_COLOR,
              ),
            ),
          ),
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (BuildContext context) {
              context.push(Routes.documentPreview, {
                'appointmentid': data?.Appointment_id.toString(),
                'title': Consts.MEDICAL_RECORDS.toUpperCase()
              });
            },
            backgroundColor: Colors.transparent,
            child: const MIconButton(
              color: MTheme.THEME_COLOR,
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: MTheme.THEME_COLOR,
              ),
            ),
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            PatientScheduleHeader(
              date: data?.Appointment_Date,
              time: data?.Appointment_Time,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: '${user.email}, '),
                  const TextSpan(text: 'Fee: '),
                  TextSpan(
                      text: data?.Order_Amount.toString() ?? '',
                      style: const TextStyle(color: MTheme.THEME_COLOR)),
                  const TextSpan(text: ' - '),
                  TextSpan(
                      text: data?.Transaction_Status.toString() ?? '',
                      style: const TextStyle(color: Colors.green)),
                  const TextSpan(text: ' Mode: '),
                  TextSpan(
                      text: data?.Type.toString() ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black87)),
                ]),
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // Padding(
            //     padding:
            //         EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //     child: StatusIndicator(label: 'Waiting')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            MListTile(
              margin: const EdgeInsets.all(4),
              child: MGradientContainer(
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Progress of the call:',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          if (data?.CallStatus_Flag == "N")
                            const Text(
                              'Call pending',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MTheme.THEME_COLOR,
                                  fontWeight: FontWeight.w600),
                            )
                          else if (data?.CallStatus_Flag == "Y")
                            const Text(
                              'Call completed',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MTheme.THEME_COLOR,
                                  fontWeight: FontWeight.w600),
                            )
                          else if (data?.CallStatus_Flag == "R")
                            const Text(
                              'Revisit',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MTheme.THEME_COLOR,
                                  fontWeight: FontWeight.w600),
                            )
                          else
                            const Text(
                              'Call Cancelled',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                        ],
                      ),
                      const Divider(
                        indent: 0,
                        endIndent: 0,
                      ),
                      Wrap(
                        runSpacing: 4,
                        children: [
                          CheckItem(
                            label: 'PRESCRIPTION',
                            done: data?.PresStatus == 0 ? false : true,
                          ),
                          CheckItem(
                            label: 'LAB TEST',
                            done: data?.LabStatus == 0 ? false : true,
                          ),
                          CheckItem(
                            label: 'CLINICAL NOTES',
                            done: data?.ClinicalStatus == 0 ? false : true,
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
    // }));
  }
}
