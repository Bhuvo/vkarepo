import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';

class RazorpayInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    Map<String, String> modifiedHeader = Map.from(request.headers);
    final auth =
        'Basic ${base64Encode(utf8.encode('rzp_test_UQu4zdljD2dohm:NEp6W4SFs3COR3Uw9pJBzOGU'))}';
    modifiedHeader['Content-Type'] = 'application/json';
    modifiedHeader['Authorization'] = auth;
    Request modified = Request(
      request.method,
      request.url,
      request.baseUri,
      body: request.body,
      headers: modifiedHeader,
      multipart: request.multipart,
      parameters: request.parameters,
      parts: request.parts,
    );
    return modified;
  }
}
