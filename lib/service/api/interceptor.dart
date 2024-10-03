import 'dart:async';
import 'package:chopper/chopper.dart';

class Interceptor2 implements Interceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    Map<String, String> modifiedHeader = Map.from(request.headers);
    // modifiedHeader.putIfAbsent('token',
    //         () =>  Prefs.getString(Prefs.TOKEN, def: ''));
    modifiedHeader['Content-Type'] = 'application/json';
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

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {

    final Request request = chain.request;


    // if(kDebugMode){
    //   print(modifiedHeader.toString());
    // }

    Request modified = Request(
      request.method,
      request.url,
      request.baseUri,
      body: request.body,
      headers: request.headers,
      multipart: request.multipart,
      parameters: request.parameters,
      parts: request.parts,
    );

    final Response<BodyType> response = await chain.proceed(modified);

    return response;
  }
}
