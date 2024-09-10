part of 'api_builder_bloc.dart';

@freezed
class ApiBuilderEvent with _$ApiBuilderEvent{
  const factory ApiBuilderEvent.load() = Load;
  const factory ApiBuilderEvent.updateQuery(Map<String, dynamic> query) = UpdateQuery;
  const factory ApiBuilderEvent.loadMore() = LoadMore;
  const factory ApiBuilderEvent.refresh() = Refresh;
}

