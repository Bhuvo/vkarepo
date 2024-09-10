import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

class MMarker extends StatelessWidget {
  final LatLng latLng;
  final Color? color;
  final IconData? icon;
  final Widget? child;
  const MMarker({Key? key, required this.latLng, this.child, this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ?? Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white, size: 20,),
    );
  }
}
