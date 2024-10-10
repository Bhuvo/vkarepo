import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/razorpay_facade.dart';
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class ClinicalPayment {
  static Future<bool> pay(BuildContext context, String id, VoidCallback onSuccess) async {
    showWaitingDialog(context: context);
    try {
      final res = await Injector()
          .timesmedService
          .rawGet2(path: 'CVPaymentRequest', query: {
        'app_id': id,
        'pat_id': LocalStorage.getCursorPatient().userId,
        'paymentType': 'RAZOR',
        'Amount': 200
      });
      context.pop();
      log(res.bodyString);

      if (res.isSuccessful) {
        final orderId = res.body['Data'];
        final amount = res.body['Order_Amount'];
        RazorpayFacade.pay(
            orderId: orderId,
            amount: num.tryParse(amount) ?? 0,
            onSuccess: (d) async {
              print('Payment Success');
              showWaitingDialog(context: context);
              final res2 = await Injector().timesmedService.rawGet2(
                path: 'Razorpay',
                query: {
                  'Res_Order_id': d.orderId,
                  'Res_PaymentID': d.paymentId,
                  'Res_signature': d.signature,
                }
              );
              context.pop();
              await showDialog(context: context, builder: (_){
                return AlertDialog(
                  title: const Icon(Icons.check_circle, size: 40, color: Colors.green,),
                  content: const Text('Payment Success', textAlign: TextAlign.center,),
                  actions: [
                    TextButton(onPressed: (){
                      context.pop();

                    }, child: const Text('OK'))
                  ],
                );
              });
              onSuccess();
            },
            onFailure: (d) {
              print('Payment Failed');
              showDialog(context: context, builder: (_){
                return AlertDialog(
                  title: const Icon(Icons.error, size: 40, color: Colors.red,),
                  content: const Text('Payment Failed'),
                  actions: [
                    TextButton(onPressed: (){
                      context.pop();
                    }, child: const Text('OK'))
                  ],
                );
              });
            },
            );
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
