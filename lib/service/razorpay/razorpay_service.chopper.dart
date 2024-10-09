// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'razorpay_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
 class _$RazorpayService extends RazorpayService {
  _$RazorpayService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RazorpayService;

  @override
  Future<Response<dynamic>> order({
    required String currency,
    required int amount,
  }) {
    final Uri $url = Uri.parse('https://api.razorpay.com/v1/orders');
    final $body = <String, dynamic>{
      'currency': currency,
      'amount': amount,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
