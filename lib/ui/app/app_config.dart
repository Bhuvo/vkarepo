import 'package:flutter/material.dart';

enum Config {
  doctor, patient
}

class AppConfig extends InheritedWidget {
  const AppConfig(
      {required this.appDisplayName,
      required this.config,
        Key? key,
      required Widget child})
      : super(child: child, key: key);

  final String appDisplayName;
  final Config config;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
