import 'package:flutter/material.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/user.dart';

class PatientProvider extends InheritedWidget {
  final Patient data;
  const PatientProvider({required super.child, super.key, required this.data});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Patient? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PatientProvider>()?.data;
}