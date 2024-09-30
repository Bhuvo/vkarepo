
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/appointment_facade.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/utils/local_storage.dart';

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
          AppointmentFacade.handleDoctorIncoming(navigatorKey.currentState!.context, event);
        }
      });
    } catch (e){
      if (kDebugMode) {
        print('FCM Error: $e');
      }
    }
  }
}