import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/api_response.dart';

import '../api/converter.dart';
import 'interceptor.dart';

part 'razorpay_service.chopper.dart';

@ChopperApi(baseUrl: Consts.RAZORPAY_BASE_URL)
abstract class RazorpayService extends ChopperService {
 
  @Post(path: 'orders')
  Future<Response<dynamic>> order({
    @Field() required String currency,
    @Field() required int amount
  });

  static RazorpayService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(Consts.BASE_URL),
      services: [
        _$RazorpayService(),
      ],
      converter: const JsonSerializableConverter({
        ApiResponse: ApiResponse.fromJsonFactory,
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        RazorpayInterceptor2()
    ]
    );
    return _$RazorpayService(client);
  }
}

//RazorpayService RazorpayService = RazorpayService.create();
