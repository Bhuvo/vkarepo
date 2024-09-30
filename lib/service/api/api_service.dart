import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/model/fetch_list_response.dart';

import 'converter.dart';
import 'interceptor.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: Consts.BASE_URL)
abstract class ApiService extends ChopperService {
  @Get(path: 'WebAPIP/{path}')
  Future<Response<FetchListResponse>> fetchList({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {}
  });
  @Get(path: 'WebAPI2/{path}')
  Future<Response<FetchListResponse>> fetchList2({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {}
  });
  @Get(path: 'WebAPIP/{path}')
  Future<Response<ApiResponse>> register({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {}
  });
  @Post(path: 'WebAPIP/{path}')
  Future<Response<ApiResponse>> post({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
    @Body() Map<String, dynamic>? body,
  });
  @Post(path: 'WebAPI2/{path}')
  Future<Response<ApiResponse>> post2({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
    @Body() Map<String, dynamic>? body,
  });
  @Post(path: 'WebAPIP/{path}')
  Future<Response<dynamic>> rawPost({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
    @Body() Map<String, dynamic>? body,
  });

  @Get(path: 'WebAPIP/{path}')
  Future<Response<ApiResponse>> get({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
  });
  @Get(path: 'WebAPI2/{path}')
  Future<Response<ApiResponse>> get2({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
  });
  @Get(path: 'WebAPIP/{path}')
  Future<Response> rawGet({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
  });
  @Get(path: 'WebAPI2/{path}')
  Future<Response> rawGet2({
    @Path() required String path,
    @QueryMap() Map<String, dynamic> query = const {},
  });

  @Get(path: 'WebAPIP/{path}')
  Future<Response<ApiResponse>> login({
    @Path() String path = 'DoctorLogin',
    @Query('DoctorPhone') String? doctorPhone,
    @Query('MobileNumber') String? mobile,
    @Query('Password') required String password
  });

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(Consts.BASE_URL),
      services: [
        _$ApiService(),
      ],
      converter: const JsonSerializableConverter({
        ApiResponse: ApiResponse.fromJsonFactory,
        FetchListResponse: FetchListResponse.fromJsonFactory
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        Interceptor(),
        (Response response) async {
          if (response.statusCode == 404) {
            chopperLogger.severe('404 NOT FOUND');
          }
          return response;
        },
      ],
    );
    return _$ApiService(client);
  }
}

//ApiService apiService = ApiService.create();
