import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';

class ApiFacade {
  static Future<Response?> callApi(
      {required BuildContext context, required Future<Response> call}) async {
    try {
      final Response<dynamic>? res = await showWaitingDialog(
          context: context, message: 'Loading...', call: call);

      print('body: ${res?.body} ${res?.body.runtimeType}');
      print('error: ${res?.error}');

      if (res?.isSuccessful == true) {
        if (res?.body is ApiResponse) {
          if ('${res?.body?.code}' == '1') {
            /* showMessage(
                context: context,
                message: res?.body?.message ?? '');*/
            return res;
          }
          showMessage(context: context, message: res?.body?.message ?? '');
        } else if (res?.body is Map) {
          return res;
        } else if (res?.body is String) {
          return res;
        }
      } else {
        showMessage(
            context: context,
            message: 'Request failed, Please check your connection.');
      }
      return null;
    } catch (_) {
      //return Response();
    }
  }
}
