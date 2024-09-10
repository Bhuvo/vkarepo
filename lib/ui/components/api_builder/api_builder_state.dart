part of 'api_builder_bloc.dart';

@freezed
class ApiBuilderState with _$ApiBuilderState{
  const factory ApiBuilderState.loading() = Loading;
  const factory ApiBuilderState.loadingMore({required List<Map<String, dynamic>> data}) = LoadingMore;
  const factory ApiBuilderState.refreshing({required List<Map<String, dynamic>> data}) = Refreshing;
  const factory ApiBuilderState.empty() = Empty;
  const factory ApiBuilderState.initial() = InitialState;
  const factory ApiBuilderState.onData({required List<Map<String, dynamic>> data, required DateTime updatedAt}) = Data;
  const factory ApiBuilderState.onError({required ApiFailure error}) = Error;
}

