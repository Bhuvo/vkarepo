

import 'package:flutter/material.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_sdk.dart';

class WebRTCServiceProvider extends InheritedWidget {
  final FebRtcSdk service;

  const WebRTCServiceProvider({
    Key? key,
    required this.service,
    required Widget child,
  }) : super(key: key, child: child);

  static FebRtcSdk? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WebRTCServiceProvider>()?.service;
  }

  @override
  bool updateShouldNotify(WebRTCServiceProvider oldWidget) {
    return oldWidget.service != service;
  }
}
