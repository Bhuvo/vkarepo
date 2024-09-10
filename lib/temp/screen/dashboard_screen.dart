import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'curve_screen.dart';
import 'curve_screen1.dart';

class DashboradPage extends StatefulWidget {
  const DashboradPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboradPage> createState() => _DashboradPageState();
}

class _DashboradPageState extends State<DashboradPage> {

  @override
  Widget build(BuildContext context) {
    return ClippingApp1();
  }
}
