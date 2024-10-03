
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/appointment_facade.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/utils/local_storage.dart';


import '../../ui/pages/doctor_firebase_instant_call_request/doctor_approval_rejection_screen.dart';

abstract class MessagingMonitor {
  static String? token;
  static Stream<String>? tokenStream;
  static BuildContext? context;
  static initContext(BuildContext c){
    context = c;
  }


  static void setToken(String? token, Config config) async {


    final id = LocalStorage.getUID();
    if (kDebugMode) {
      print('FCM Token: $token');
      print('Updating for UID: $id');
    }
    if(id != null){
      if(config == Config.patient){
        print("TOOOOOOOOOOOOOOOOOOOOOOOOO: $token");
        final res = await Injector().apiService.get(path: 'UpdateDevice_id', query: {'Device_id': token, 'User_id': id});
        print(res.bodyString);
        print("prints body");
      } else {
        print("TOOOOOOOOOOOOOOOOOOOOOOOOO: $token");
        Injector().apiService.get(path: 'UpdateDevice_idDoctor', query: {'Device_id': token, 'Doctor_id': id});
      }
    }
  }

  static init(Config config) {
    try {
      FirebaseMessaging.instance
          .getToken()
          .then((t) => setToken(t, config));
      tokenStream = FirebaseMessaging.instance.onTokenRefresh;
      tokenStream?.listen((t) => setToken(t, config));
      FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
        if (kDebugMode) {
          print('FCM Payload onBackgroundMessage');
          print(message.data);
        }
      });
      FirebaseMessaging.onMessage.listen((event) {
        if (kDebugMode) {
          print('FCM Payload');
          print('data: ${event.data}');
          print('title: ${event.notification?.body}');
          print('body: ${event.notification?.title}');
        }
        if(event.data.toString().contains('VideoKeyDetails')){
          print("Video Key Details");
          AppointmentFacade.handleDoctorIncoming(navigatorKey.currentState!.context, event);
        }else if(event.data.toString().contains('Instant call')){
          // print("Instant Call");
          // final flutterLocalNotificationsPlugin =
          // FlutterLocalNotificationsPlugin();
          // const initializationSettings = InitializationSettings(
          //   android: AndroidInitializationSettings(
          //       '@mipmap/ic_launcher'), // Replace 'app_icon' with your app's launcher icon name
          // );
          // flutterLocalNotificationsPlugin.initialize(initializationSettings);
          // const androidPlatformChannelSpecifics = AndroidNotificationDetails(
          //     'channelId', // Unique channel ID
          //     'channelName', // Channel name
          //     // Channel description
          //     playSound: true,
          //     sound:
          //     RawResourceAndroidNotificationSound('customnotificationsound'),
          //     icon: '@mipmap/ic_launcher');
          // const platformChannelSpecifics =
          // NotificationDetails(android: androidPlatformChannelSpecifics);
          //
          // flutterLocalNotificationsPlugin.show(
          //   0, // Notification ID
          //   '${event.data["title"]}',
          //   '${event.data["body"]}',
          //   platformChannelSpecifics,
          // );
          // if (AppConfig.of(navigatorKey.currentState!.context)?.config ==
          //     Config.doctor){
          //      Navigator.push(
          //     navigatorKey.currentState!.context,
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           FCMMessageDoctorAcceptorRejectUserInstantRequest(
          //             paylaodFromFCM: event.data,
          //           ),
          //     ),
          //   );
          // }

        }
      });
    } catch (e){
      if (kDebugMode) {
        print('FCM Error: $e');
      }
    }
  }
}