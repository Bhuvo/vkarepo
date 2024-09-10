import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget{
  final Color? colour;
  final IconData? icon;
    const ProfileCircle({Key? key,  required this.colour,   this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white, // border color
        shape: BoxShape.circle,
      ),
      child:Container( // or ClipRRect if you need to clip the content
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colour,
            border: Border.all(width: 1,color: Colors.white)//  // inner circle color
        ),
        child:Icon(icon), // inner content
      ),
    );
  }

}