import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

// showMessage({required BuildContext context, required String message}){
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
// }


showMessage({required BuildContext context, required String message}) async {
  return await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MTheme.THEME_COLOR,
      textColor: Colors.white,
      fontSize: 16.0);
}

showToast({required String message}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}