
import 'package:chopper/chopper.dart';
import 'package:timesmedlite/service/api/converter.dart';

import '../../model/api_response.dart';
import '../../model/fetch_list_response.dart';
import '../api/interceptor.dart';


part 'vka_service.chopper.dart';

@ChopperApi(baseUrl: 'https://tmsnew.timesmed.com/')
abstract class VkaService extends ChopperService {

  @Get(path: 'VKAAPI1/{path}')
  Future<Response<FetchListResponse>> fetchList({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
  });

  @Post(path: 'VKAAPI1/{path}')
  Future<Response<ApiResponse>> post({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
    @Body() Map<String, dynamic>? body,
  });

  static VkaService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://tmsnew.timesmed.com/'),
      services: [
        _$VkaService(),
      ],
      converter: const JsonSerializableConverter({
        ApiResponse: ApiResponse.fromJsonFactory,
        FetchListResponse: FetchListResponse.fromJson
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        Interceptor2(),
      ],
    );
    return _$VkaService(client);
  }
}