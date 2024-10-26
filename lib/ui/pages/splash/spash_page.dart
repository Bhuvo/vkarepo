import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timesmedlite/facade/appointment_facade.dart';
import 'package:timesmedlite/service/firebase/messaging_monitor.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../const/consts.dart';
import '../../../main_doctor.dart';
import '../../app/m_app.dart';
import '../Notification Video Call Schedule/notifying_patient_about_videocall_from_doctor.dart';
import '../doctor_firebase_instant_call_request/doctor_approval_rejection_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    load();
    super.initState();
  }
bool isNotifyDoc = false;
  load() async {
    //fake load
    await Future.delayed(const Duration(seconds: 1));
    await LocalStorage.load();

    ///DONE: COMMENT AFTER WARDS
    //LocalStorage.clear();
    ///
    if (mounted) {
      if (LocalStorage.getUser().id == null && LocalStorage.getUser().hospitalAdminId == null) {
        context.replace(Routes.login);
      } else {
        if (mounted && !isNotifyDoc) {
          MessagingMonitor.init(AppConfig.of(context)!.config);
          if (AppConfig.of(context)?.config == Config.doctor) {
            print('isType is ${LocalStorage.getString(LocalStorage.IsType)}');
            if(LocalStorage.getString(LocalStorage.IsType) == Consts.admin){
              context.replace(Routes.adminDashboard);
            }else {
              context.replace(Routes.currentAppointment);
            }//patientWaitingList
          } else {
            context.replace(Routes.selectPatient);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseNotificationsHandler(
      // defaultNavigatorKey: GlobalKey<NavigatorState>(),
      // onOpenNotificationArrive: (_, payload) {
      //   print("Queue ID::::::::::::::::::::::::::::::::::::::::::${payload['Queue_Id']}${payload['Patient_id']}${payload['PatientName']}");
      //   final SnackBar snackBar = SnackBar(
      //
      //     duration: Duration(seconds: 5),
      //     content: Text("Patient Requested for a Instant Call"), action: SnackBarAction(
      //     label: 'View Request',
      //     onPressed: () {
      //       // some code
      //       Navigator.push( navigatorKey.currentState!.context,MaterialPageRoute(builder: (context)=>FCMMessageDoctorAcceptorRejectUserInstantRequest(paylaodFromFCM: payload,)));
      //     },
      //   ),);
      //   snackbarKey.currentState?.showSnackBar(snackBar);
      //   print("Notification received while app is open with payload $payload");
      // },
      onTap: (navigatorState, appState, payload) {
        print("On Tapped Triggered");
        print(payload);
        print("prints payload");
        // Create an instance of FlutterLocalNotificationsPlugin
        final flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();

        // Initialize FlutterLocalNotificationsPlugin
        const initializationSettings = InitializationSettings(
          android: AndroidInitializationSettings(
              '@mipmap/ic_launcher'), // Replace 'app_icon' with your app's launcher icon name
        );
        flutterLocalNotificationsPlugin.initialize(initializationSettings);

        // Construct a NotificationDetails object with custom sound
        const androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'channelId', // Unique channel ID
            'channelName', // Channel name
            // Channel description
            playSound: true,
            sound:
                RawResourceAndroidNotificationSound('customnotificationsound'),
            icon: '@mipmap/ic_launcher');
        const platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);

        // Display the notification with custom sound
        flutterLocalNotificationsPlugin.show(
          0, // Notification ID
          '${payload["title"]}',
          '${payload["body"]}',
          platformChannelSpecifics,
        );

        if (AppConfig.of(navigatorKey.currentState!.context)?.config ==
            Config.doctor) {
          isNotifyDoc = true;
        var val = Navigator.push(
            navigatorKey.currentState!.context,
            MaterialPageRoute(
              builder: (context) =>
                  FCMMessageDoctorAcceptorRejectUserInstantRequest(
                paylaodFromFCM: payload,
              ),
            ),
          );
        val.then((value) {
          isNotifyDoc = false;
          load();
        });
        }

        /// below code is for notifying patient about the scheduled video call
        if (AppConfig.of(navigatorKey.currentState!.context)?.config ==
            Config.patient) {
          Navigator.push(
            navigatorKey.currentState!.context,
            MaterialPageRoute(
              builder: (context) => FCMMessageNotifyingPatientAboutTheVideoCall(
                paylaodFromFCM: payload,
              ),
            ),
          );
        }

        if (AppConfig.of(navigatorKey.currentState!.context)?.config ==
            Config.patient) {
          final Map<String, dynamic> data = {};
          for (final e in payload.keys) {
            data['$e'] = payload[e];
          }
          if (payload.toString().contains('VideoKeyDetails')) {
            AppointmentFacade.handleDoctorIncoming(
                navigatorKey.currentState!.context, RemoteMessage(data: data));
          }
        }
        // print("Notification tapped with $appState & payload $payload");
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: MTheme.GRADIENT,
          ),
          child: Hero(
              tag: 'LOGO',
              child: SvgPicture.asset(
                'assets/svg/tm_logo_w.svg',
                color: Colors.white,
                width: context.getWPercent(60),
              )),
        ),
      ),
    );
  }
}
