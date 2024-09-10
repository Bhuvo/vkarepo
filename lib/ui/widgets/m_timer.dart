import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timesmedlite/utils/string_utils.dart';

class MTimer extends StatefulWidget {
  Duration initial, maximum, interval;
  final Function()? onComplete;
  final bool autoStart;
  final Widget Function(Duration value)? builder;
  final Function(Duration value)? onChanged;

  MTimer(
      {Key? key,
      this.initial = const Duration(milliseconds: 0),
      required this.maximum,
      this.onComplete,
      this.onChanged,
      this.builder,
        this.autoStart = true,
      this.interval = const Duration(seconds: 1)})
      : super(key: key);

  @override
  State<MTimer> createState() => MTimerState();
}

class MTimerState extends State<MTimer> {
  Duration value = const Duration(seconds: 0);
  Timer? timer;
  start(){
    Timer.periodic(widget.interval, (t) {
      timer = t;
      if(value >= widget.maximum){
        pause();
        widget.onComplete?.call();
      } else {
        onChanged();
        if (mounted) {
          setState(() {
            value = value + widget.interval;
          });
        } else {
          //timer?.cancel();
        }

      }
    });
  }
  pause(){
    setState(() {
      timer?.cancel();
    });
  }
  reset(){
    pause();
    setState(() {
      value = const Duration(seconds: 0);
      onChanged();
    });
  }
  extend(Duration d){
    setState(() {
      widget.maximum += d;
    });

  }

  onChanged(){
    widget.onChanged?.call(value);
  }

  @override
  void initState() {
    value = widget.initial;
    if(widget.autoStart) start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(value) ?? Text(printDuration(value));
  }
}
