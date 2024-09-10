import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/dashboard_screen.dart';
import 'package:timesmedlite/temp/screen/patient_inr_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const DashboradPage(title: 'Flutter Demo Home Page'),
    );
  }
}


