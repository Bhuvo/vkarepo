import 'package:flutter/material.dart';

extension SizeUtils on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  getWPercent(int percent) => width * (percent/100);
  getHPercent(int percent) => height * (percent/100);
}