// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesmed_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
 class _$TimesmedService extends TimesmedService {
  _$TimesmedService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = TimesmedService;

  @override
  Future<Response<FetchListResponse>> fetchList({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<FetchListResponse, FetchListResponse>($request);
  }

  @override
  Future<Response<FetchListResponse>> fetchList2({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPI2/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<FetchListResponse, FetchListResponse>($request);
  }

  @override
  Future<Response<ApiResponse>> register({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<ApiResponse>> post({
    required String path,
    Map<String, dynamic> query = const {},
    Map<String, dynamic>? body,
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<ApiResponse>> post2({
    required String path,
    Map<String, dynamic> query = const {},
    Map<String, dynamic>? body,
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPI2/${path}');
    final Map<String, dynamic> $params = query;
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<dynamic>> rawPost({
    required String path,
    Map<String, dynamic> query = const {},
    Map<String, dynamic>? body,
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> get({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<ApiResponse>> get2({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPI2/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<dynamic>> rawGet({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> rawGet2({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPI2/${path}');
    final Map<String, dynamic> $params = query;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> login({
    String path = 'DoctorLogin',
    String? doctorPhone,
    String? mobile,
    required String password,
  }) {
    final Uri $url = Uri.parse('https://api.timesmed.com/WebAPIP/${path}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'DoctorPhone': doctorPhone,
      'MobileNumber': mobile,
      'Password': password,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }
}
