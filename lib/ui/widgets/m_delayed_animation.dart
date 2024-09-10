import 'dart:async';

import 'package:flutter/material.dart';

class MDelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final Duration duration;
  final Offset begin;

  const MDelayedAnimation({required this.child, this.delay = 0, Key? key, this.duration = const Duration(milliseconds: 300), this.begin = const Offset(0.0, 0.35)}) : super(key: key);

  @override
  _MDelayedAnimationState createState() => _MDelayedAnimationState();
}

class _MDelayedAnimationState extends State<MDelayedAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.duration);
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animOffset =
        Tween<Offset>(begin: widget.begin, end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}