import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/model/api_failure.dart';
import 'package:chopper/chopper.dart';

class ApiBuilderFacade{
  static Future<Either<ApiFailure,List<Map<String, dynamic>>>> fetchList({required String path, bool raw = false, Map<String, dynamic>? query, int limit = 20, int offset = 0, bool api2 = false, bool timesmedApi = false,bool vka = false}) async {
    try{
      dynamic service = timesmedApi ? Injector().timesmedService :vka?Injector().vkaService: Injector().apiService;
      final Response res = await (
      raw ?
      api2 ?
      service.rawGet2(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})}) :
      service.rawGet(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})}) :
      api2 ?
      service.fetchList2(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})}) :
      service.fetchList(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})})
      );

      log('API URL: ' + (res.base.request?.url.toString() ?? ''));

      // print('api url: ${path} query: ${query}');
      if(raw){

        // print('api body: ${res.body ?? 'nothing'}');
        // print('api error: ${res.error ?? 'nothing'}');

        //final res = await Injector().apiService.rawGet(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})});

        if(res.isSuccessful){
          // print('get: $path/$query');
          // print('response.body.raw: ${res.body}');
          if(res.body is List){
            List<Map<String, dynamic>> list = [];
            final jsonList = jsonDecode(res.bodyString);
            jsonList.forEach((e){
              if(e != null) {
                list.add(e);
              }
            });
            // print(list);
            return right(list);
          }
          if(res.body is Map){
            return right([res.body]);
          }
          // else if(res.body is List) {
          //   return right(res.body);
          // }
          return right([]);
        } else {
          // print('get: $path/$query');
          // print('response.body.error: ${res.error}');
          return left(const ApiFailure(message: 'Failed to Load, Please check your connection.'));
        }
      } else {
        //final res = await Injector().apiService.fetchList(path: path, query: {'limit': limit, 'offset': offset, ...(query ?? {})});
        // print('api url: ${path} query: ${query}');
        // print('api body: ${res.body ?? 'nothing'}');
        // print('api error: ${res.error ?? 'nothing'}');
        if(res.isSuccessful){
          if(res.body?.code == '1' || res.body?.code == '' || res.body?.data != null){
            if(res.body?.data is List) {
              List<Map<String, dynamic>> list = [];
              res.body?.data?.forEach((e){
                list.add(e);
              });
              if(res.body?.payload is List) {
                res.body?.payload?.forEach((e){
                  list.add(e);
                });
              } else if(res.body?.payload is Map) {
                return right([res.body?.payload]);
              }
              return right(list);
            } else if(res.body?.data is Map) {
              return right([res.body?.data]);
            }

            return right([]);
          } else {
            return left(ApiFailure(message: res.body?.message, code: res.body?.code));
          }
        } else {
          return left(const ApiFailure(message: 'Failed to Load, Please check your connection.'));
        }
      }
    } catch (e){
      print(e.toString());

      return left(const ApiFailure(message: 'Something went wrong', code: '100'));
    }

  }
}