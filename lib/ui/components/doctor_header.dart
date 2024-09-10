import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/auth/logout.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../di/dependency_injection.dart';
import '../../model/get_doctor_details.dart';
import 'user_avatar.dart';

class DoctorHeader extends StatelessWidget {
  const DoctorHeader({Key? key}) : super(key: key);

  final String appointmentID = "157224";

  @override
  Widget build(BuildContext context) {
    final user = LocalStorage.getUser();
    final user1 = UserProvider.of(context);
    print(user);
    print(user1);
    print("prints user");
    return UserProvider(
      data: user,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            PopupMenuButton(
                offset: const Offset(0, 60),
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      child: Text('Basic Details'),
                      value: 'Basic Details',
                    ),
                    PopupMenuItem(
                      child: Text('Hospital List'),
                      value: 'Hospital List',
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      value: 'Logout',
                    ),
                  ];
                },
                onSelected: (v) async {
                  switch (v) {
                    case 'Basic Details':
                      {
                        final call = Injector().apiService.get2(
                            path: 'GetDoctorDetails',
                            query: {'DoctorId': LocalStorage.getUID()});
                        final res = await showWaitingDialog(
                            context: context, call: call);
                        if (res != null) {
                          var data = GetDoctorDetails.fromJson(res.body.data);
                          print(data);

                          context.push(Routes.doctorBasicDetails,
                              {'doctorDetails': data});
                        }
                      }
                      break;
                    case 'Hospital List':
                      context.push(Routes.hospitalsBasedOnDoctor);
                      break;
                    case 'Logout':
                      logOut(context);
                      break;
                  }
                },
                child: const UserAvatar(
                  radius: 26,
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.fullName}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user.qualification ?? user.designation ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13),
                ),
              ],
            ),
            const Spacer(),
            // MIconButton(
            //   child: const Icon(Icons.videocam),
            //   onTap: () async {
            //     final call =
            //         Injector().apiService.get(path: 'TimeTracker', query: {
            //       'Appointment_id': appointmentID,
            //     });
            //     final res =
            //         await showWaitingDialog(context: context, call: call);
            //     if (res?.body.message == "Stream Time Updated") {
            //       context.push(Routes.inAppCallPageDoctor);
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
