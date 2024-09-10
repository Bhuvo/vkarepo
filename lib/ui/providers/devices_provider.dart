import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class DevicesProvider extends InheritedWidget {
  final List<MediaDeviceInfo> devices;
  const DevicesProvider({Key? key, required this.devices, required Widget child}) : super(key: key, child: child);

  static List<MediaDeviceInfo>? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<DevicesProvider>()?.devices;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}