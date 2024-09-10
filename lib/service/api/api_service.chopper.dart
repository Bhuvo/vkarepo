// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<FetchListResponse>> fetchList({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPI2/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $body = body;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPI2/${path}';
    final $params = query;
    final $body = body;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $body = body;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPI2/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPI2/${path}';
    final $params = query;
    final $request = Request(
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
    final $url = 'https://tmsnew.timesmed.com/WebAPIP/${path}';
    final $params = <String, dynamic>{
      'DoctorPhone': doctorPhone,
      'MobileNumber': mobile,
      'Password': password,
    };
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }
}
