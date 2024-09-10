import 'package:flutter/material.dart';

Widget EmptyWidgetWhenNoDatainApiBuilder(IconData icon,String text) {
  return  Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
      Icon(icon,color: Colors.black26,size: 50),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(text,style: const TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color:  Colors.black26,),textAlign: TextAlign.center),
      ),
    ],
  ),);
}
