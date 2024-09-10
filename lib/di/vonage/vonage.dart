import 'dart:async';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Vonage {
  static const MethodChannel _channel = MethodChannel('vonage');

  //static Future<String> get platformVersion async {
  //  final String version = await _channel.invokeMethod('getPlatformVersion');
  //  return version;
  //}

  //static Future<int> get batteryLevel async {
  //  print ('get batteryLevel');
  //  try {
  //    return await _channel.invokeMethod('getBatteryLevel');
  //  } on PlatformException {
  //    return -1;
  //  }
  //}

  static Future<String> initSession(
      String sessionId, String token, String apiKey) async {
    print('initSession');
    bool havePermissions = await checkPermissions();
    if (havePermissions) {
      try {
        return await _channel.invokeMethod('initSession',
            {"sessionId": sessionId, "token": token, "apiKey": apiKey});
      } on PlatformException {
        return "error";
      }
    }
    return "permissions not granted";
  }

  static Future<String> endSession() async {
    print('endSession');
    try {
      return await _channel.invokeMethod('endSession', {});
    } on PlatformException {
      return "error";
    }
  }

  static Future<String> publishStream(String name, int viewId) async {
    try {
      return await _channel
          .invokeMethod('publishStream', {"name": name, "viewId": viewId});
    } on PlatformException {
      return "error";
    }
  }

  static toggleAudio(bool enabled) async {
    try {
      return await _channel.invokeMethod('toggleAudio', {"enabled": enabled});
    } on PlatformException {
      return "error";
    }
  }

  static toggleVideo(bool enabled) async {
    try {
      return await _channel.invokeMethod('toggleVideo', {"enabled": enabled});
    } on PlatformException {
      return "error";
    }
  }

  static onPause() async {
    try {
      return await _channel.invokeMethod('onPause');
    } on PlatformException {
      return "error";
    }
  }

  static onResume() async {
    try {
      return await _channel.invokeMethod('onResume');
    } on PlatformException {
      return "error";
    }
  }

  static onStop() async {
    try {
      return await _channel.invokeMethod('onStop');
    } on PlatformException {
      return "error";
    }
  }

  static Future<String> unpublishStream() async {
    try {
      return await _channel.invokeMethod('unpublishStream', {});
    } on PlatformException {
      return "error";
    }
  }

  static Future<String> subscribe() async {
    try {
      return await _channel.invokeMethod('subscribe', {});
    } on PlatformException {
      return "error";
    }
  }

  static Future<String> swapCamera() async {
    try {
      return await _channel.invokeMethod('swapCamera', {});
    } on PlatformException {
      return "error";
    }
  }

  static Future<bool> checkPermissions() async {
    bool cameraGranted = await Permission.camera.request().isGranted;
    bool cameraDenied = false;
    if (!cameraGranted) {
      cameraDenied = await Permission.camera.isPermanentlyDenied;
    }
    bool microphoneGranted = await Permission.microphone.request().isGranted;
    bool microphoneDenied = false;
    if (!microphoneGranted) {
      microphoneDenied = await Permission.microphone.isPermanentlyDenied;
    }

    if (cameraDenied || microphoneDenied) {
      openAppSettings();
    }
    if (cameraGranted && microphoneGranted) {
      return true;
    }
    return false;
  }
}
