import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayFacade {
  static pay(
      {required String orderId,
      required num amount,
        Map<String, dynamic>? prefill,
      Function(PaymentSuccessResponse response)? onSuccess,
        Function(PaymentFailureResponse response)? onFailure,
        Function(ExternalWalletResponse response)? onExternal,
      }) {
    Razorpay razorpay = Razorpay();
    var options = {
      "key": "rzp_test_UQu4zdljD2dohm",
      "amount": (amount) * 100,
      "name": "TimesMed",
      "description": "payment",
      'order_id': orderId,
      'send_sms_hash': true,
      "prefill": prefill,
      "external": {
        "wallets": ["paytm"]
      },
    };
    try {
      if(onSuccess != null) razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
      if(onFailure != null) razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onFailure);
      if(onExternal != null) razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternal);
      razorpay.open(options);

    } catch (e) {
      print(e.toString());
      debugPrint('Error: e');
    }
  }
}
