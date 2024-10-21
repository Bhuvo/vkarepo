// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vka_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
 class _$VkaService extends VkaService {
  _$VkaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = VkaService;

  @override
  Future<Response<FetchListResponse>> fetchList({
    required String path,
    Map<String, dynamic> query = const {},
  }) {
    final Uri $url = Uri.parse('https://tmsnew.timesmed.com/VKAAPI1/${path}');
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
  Future<Response<ApiResponse>> post({
    required String path,
    Map<String, dynamic> query = const {},
    Map<String, dynamic>? body,
  }) {
    final Uri $url = Uri.parse('https://tmsnew.timesmed.com/VKAAPI1/${path}');
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
}
