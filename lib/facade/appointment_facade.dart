import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/pages/call/incoming_call_dialog.dart';

abstract class AppointmentFacade {
  static Future handleDoctorIncoming(
      BuildContext context, RemoteMessage message) async {

    final res = await Injector().apiService.rawGet(
        path: 'VideoKeyDetails',
        query: {'Key': message.data['link'].toString().split('=')[1]});
    if (kDebugMode) {
      print(res.bodyString);
    }
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return IncomingCallDialog(
            data: jsonDecode(res.bodyString),
          );
        });
  }
}
