import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:chopper/chopper.dart';

Future<Response<dynamic>?> showWaitingDialog({required BuildContext context, String title = 'Please wait', String message = 'Updating...', Future<Response<dynamic>>? call}){
  call?.then((r){
    context.popDialog(r);
  });
  return showDialog<Response<dynamic>?>(
      barrierDismissible: false,
      context: context, builder: (c){
    return  MDialog(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16,),
            Text(message)
          ],
        ),
      ),
      title: Text(title),
    );
  });
}