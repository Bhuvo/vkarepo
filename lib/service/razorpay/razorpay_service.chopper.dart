// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'razorpay_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RazorpayService extends RazorpayService {
  _$RazorpayService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RazorpayService;

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
