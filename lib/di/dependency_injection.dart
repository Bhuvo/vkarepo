import 'package:timesmedlite/repository/api_repository.dart';
import 'package:timesmedlite/service/api/api_service.dart';
import 'package:timesmedlite/service/api/timesmed_service.dart';
import 'package:timesmedlite/service/api_service.dart';

class Injector {
  static final Injector _instance = Injector.internal();

  factory Injector() => _instance;

  Injector.internal();

  ApiService get apiService {
    return ApiService.create();
  }

  TimesmedService get timesmedService {
    return TimesmedService.create();
  }

  ApiRepository get getResponse {
    return ApiServiceOld();
  }
}
