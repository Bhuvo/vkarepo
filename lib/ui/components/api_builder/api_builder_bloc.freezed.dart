// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_builder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiBuilderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Map<String, dynamic> query) updateQuery,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Map<String, dynamic> query)? updateQuery,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Map<String, dynamic> query)? updateQuery,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(UpdateQuery value) updateQuery,
    required TResult Function(LoadMore value) loadMore,
    required TResult Function(Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(UpdateQuery value)? updateQuery,
    TResult? Function(LoadMore value)? loadMore,
    TResult? Function(Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(UpdateQuery value)? updateQuery,
    TResult Function(LoadMore value)? loadMore,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiBuilderEventCopyWith<$Res> {
  factory $ApiBuilderEventCopyWith(
          ApiBuilderEvent value, $Res Function(ApiBuilderEvent) then) =
      _$ApiBuilderEventCopyWithImpl<$Res, ApiBuilderEvent>;
}

/// @nodoc
class _$ApiBuilderEventCopyWithImpl<$Res, $Val extends ApiBuilderEvent>
    implements $ApiBuilderEventCopyWith<$Res> {
  _$ApiBuilderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadCopyWith<$Res> {
  factory _$$LoadCopyWith(_$Load value, $Res Function(_$Load) then) =
      __$$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$Load>
    implements _$$LoadCopyWith<$Res> {
  __$$LoadCopyWithImpl(_$Load _value, $Res Function(_$Load) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Load implements Load {
  const _$Load();

  @override
  String toString() {
    return 'ApiBuilderEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Map<String, dynamic> query) updateQuery,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Map<String, dynamic> query)? updateQuery,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Map<String, dynamic> query)? updateQuery,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(UpdateQuery value) updateQuery,
    required TResult Function(LoadMore value) loadMore,
    required TResult Function(Refresh value) refresh,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(UpdateQuery value)? updateQuery,
    TResult? Function(LoadMore value)? loadMore,
    TResult? Function(Refresh value)? refresh,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(UpdateQuery value)? updateQuery,
    TResult Function(LoadMore value)? loadMore,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load implements ApiBuilderEvent {
  const factory Load() = _$Load;
}

/// @nodoc
abstract class _$$UpdateQueryCopyWith<$Res> {
  factory _$$UpdateQueryCopyWith(
          _$UpdateQuery value, $Res Function(_$UpdateQuery) then) =
      __$$UpdateQueryCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> query});
}

/// @nodoc
class __$$UpdateQueryCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$UpdateQuery>
    implements _$$UpdateQueryCopyWith<$Res> {
  __$$UpdateQueryCopyWithImpl(
      _$UpdateQuery _value, $Res Function(_$UpdateQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$UpdateQuery(
      null == query
          ? _value._query
          : query // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateQuery implements UpdateQuery {
  const _$UpdateQuery(final Map<String, dynamic> query) : _query = query;

  final Map<String, dynamic> _query;
  @override
  Map<String, dynamic> get query {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_query);
  }

  @override
  String toString() {
    return 'ApiBuilderEvent.updateQuery(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuery &&
            const DeepCollectionEquality().equals(other._query, _query));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_query));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQueryCopyWith<_$UpdateQuery> get copyWith =>
      __$$UpdateQueryCopyWithImpl<_$UpdateQuery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Map<String, dynamic> query) updateQuery,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return updateQuery(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Map<String, dynamic> query)? updateQuery,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return updateQuery?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Map<String, dynamic> query)? updateQuery,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (updateQuery != null) {
      return updateQuery(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(UpdateQuery value) updateQuery,
    required TResult Function(LoadMore value) loadMore,
    required TResult Function(Refresh value) refresh,
  }) {
    return updateQuery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(UpdateQuery value)? updateQuery,
    TResult? Function(LoadMore value)? loadMore,
    TResult? Function(Refresh value)? refresh,
  }) {
    return updateQuery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(UpdateQuery value)? updateQuery,
    TResult Function(LoadMore value)? loadMore,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (updateQuery != null) {
      return updateQuery(this);
    }
    return orElse();
  }
}

abstract class UpdateQuery implements ApiBuilderEvent {
  const factory UpdateQuery(final Map<String, dynamic> query) = _$UpdateQuery;

  Map<String, dynamic> get query;
  @JsonKey(ignore: true)
  _$$UpdateQueryCopyWith<_$UpdateQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreCopyWith<$Res> {
  factory _$$LoadMoreCopyWith(
          _$LoadMore value, $Res Function(_$LoadMore) then) =
      __$$LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$LoadMore>
    implements _$$LoadMoreCopyWith<$Res> {
  __$$LoadMoreCopyWithImpl(_$LoadMore _value, $Res Function(_$LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMore implements LoadMore {
  const _$LoadMore();

  @override
  String toString() {
    return 'ApiBuilderEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Map<String, dynamic> query) updateQuery,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Map<String, dynamic> query)? updateQuery,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Map<String, dynamic> query)? updateQuery,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(UpdateQuery value) updateQuery,
    required TResult Function(LoadMore value) loadMore,
    required TResult Function(Refresh value) refresh,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(UpdateQuery value)? updateQuery,
    TResult? Function(LoadMore value)? loadMore,
    TResult? Function(Refresh value)? refresh,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(UpdateQuery value)? updateQuery,
    TResult Function(LoadMore value)? loadMore,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class LoadMore implements ApiBuilderEvent {
  const factory LoadMore() = _$LoadMore;
}

/// @nodoc
abstract class _$$RefreshCopyWith<$Res> {
  factory _$$RefreshCopyWith(_$Refresh value, $Res Function(_$Refresh) then) =
      __$$RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$Refresh>
    implements _$$RefreshCopyWith<$Res> {
  __$$RefreshCopyWithImpl(_$Refresh _value, $Res Function(_$Refresh) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Refresh implements Refresh {
  const _$Refresh();

  @override
  String toString() {
    return 'ApiBuilderEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Map<String, dynamic> query) updateQuery,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Map<String, dynamic> query)? updateQuery,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Map<String, dynamic> query)? updateQuery,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(UpdateQuery value) updateQuery,
    required TResult Function(LoadMore value) loadMore,
    required TResult Function(Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(UpdateQuery value)? updateQuery,
    TResult? Function(LoadMore value)? loadMore,
    TResult? Function(Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(UpdateQuery value)? updateQuery,
    TResult Function(LoadMore value)? loadMore,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class Refresh implements ApiBuilderEvent {
  const factory Refresh() = _$Refresh;
}

/// @nodoc
mixin _$ApiBuilderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiBuilderStateCopyWith<$Res> {
  factory $ApiBuilderStateCopyWith(
          ApiBuilderState value, $Res Function(ApiBuilderState) then) =
      _$ApiBuilderStateCopyWithImpl<$Res, ApiBuilderState>;
}

/// @nodoc
class _$ApiBuilderStateCopyWithImpl<$Res, $Val extends ApiBuilderState>
    implements $ApiBuilderStateCopyWith<$Res> {
  _$ApiBuilderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ApiBuilderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ApiBuilderState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$LoadingMoreCopyWith<$Res> {
  factory _$$LoadingMoreCopyWith(
          _$LoadingMore value, $Res Function(_$LoadingMore) then) =
      __$$LoadingMoreCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class __$$LoadingMoreCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$LoadingMore>
    implements _$$LoadingMoreCopyWith<$Res> {
  __$$LoadingMoreCopyWithImpl(
      _$LoadingMore _value, $Res Function(_$LoadingMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadingMore(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$LoadingMore implements LoadingMore {
  const _$LoadingMore({required final List<Map<String, dynamic>> data})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApiBuilderState.loadingMore(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMore &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMoreCopyWith<_$LoadingMore> get copyWith =>
      __$$LoadingMoreCopyWithImpl<_$LoadingMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return loadingMore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return loadingMore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class LoadingMore implements ApiBuilderState {
  const factory LoadingMore({required final List<Map<String, dynamic>> data}) =
      _$LoadingMore;

  List<Map<String, dynamic>> get data;
  @JsonKey(ignore: true)
  _$$LoadingMoreCopyWith<_$LoadingMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingCopyWith<$Res> {
  factory _$$RefreshingCopyWith(
          _$Refreshing value, $Res Function(_$Refreshing) then) =
      __$$RefreshingCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class __$$RefreshingCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$Refreshing>
    implements _$$RefreshingCopyWith<$Res> {
  __$$RefreshingCopyWithImpl(
      _$Refreshing _value, $Res Function(_$Refreshing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$Refreshing(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$Refreshing implements Refreshing {
  const _$Refreshing({required final List<Map<String, dynamic>> data})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApiBuilderState.refreshing(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refreshing &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingCopyWith<_$Refreshing> get copyWith =>
      __$$RefreshingCopyWithImpl<_$Refreshing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return refreshing(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return refreshing?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class Refreshing implements ApiBuilderState {
  const factory Refreshing({required final List<Map<String, dynamic>> data}) =
      _$Refreshing;

  List<Map<String, dynamic>> get data;
  @JsonKey(ignore: true)
  _$$RefreshingCopyWith<_$Refreshing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCopyWith<$Res> {
  factory _$$EmptyCopyWith(_$Empty value, $Res Function(_$Empty) then) =
      __$$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$Empty>
    implements _$$EmptyCopyWith<$Res> {
  __$$EmptyCopyWithImpl(_$Empty _value, $Res Function(_$Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'ApiBuilderState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements ApiBuilderState {
  const factory Empty() = _$Empty;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$InitialState>
    implements _$$InitialStateCopyWith<$Res> {
  __$$InitialStateCopyWithImpl(
      _$InitialState _value, $Res Function(_$InitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'ApiBuilderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements ApiBuilderState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data, DateTime updatedAt});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? updatedAt = null,
  }) {
    return _then(_$Data(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(
      {required final List<Map<String, dynamic>> data, required this.updatedAt})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ApiBuilderState.onData(data: $data, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return onData(data, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return onData?.call(data, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(data, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return onData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return onData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(this);
    }
    return orElse();
  }
}

abstract class Data implements ApiBuilderState {
  const factory Data(
      {required final List<Map<String, dynamic>> data,
      required final DateTime updatedAt}) = _$Data;

  List<Map<String, dynamic>> get data;
  DateTime get updatedAt;
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiFailure error});

  $ApiFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Error(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiFailureCopyWith<$Res> get error {
    return $ApiFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error({required this.error});

  @override
  final ApiFailure error;

  @override
  String toString() {
    return 'ApiBuilderState.onError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> data) loadingMore,
    required TResult Function(List<Map<String, dynamic>> data) refreshing,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function(
            List<Map<String, dynamic>> data, DateTime updatedAt)
        onData,
    required TResult Function(ApiFailure error) onError,
  }) {
    return onError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult? Function(List<Map<String, dynamic>> data)? refreshing,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult? Function(ApiFailure error)? onError,
  }) {
    return onError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> data)? loadingMore,
    TResult Function(List<Map<String, dynamic>> data)? refreshing,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> data, DateTime updatedAt)?
        onData,
    TResult Function(ApiFailure error)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(LoadingMore value) loadingMore,
    required TResult Function(Refreshing value) refreshing,
    required TResult Function(Empty value) empty,
    required TResult Function(InitialState value) initial,
    required TResult Function(Data value) onData,
    required TResult Function(Error value) onError,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(LoadingMore value)? loadingMore,
    TResult? Function(Refreshing value)? refreshing,
    TResult? Function(Empty value)? empty,
    TResult? Function(InitialState value)? initial,
    TResult? Function(Data value)? onData,
    TResult? Function(Error value)? onError,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(LoadingMore value)? loadingMore,
    TResult Function(Refreshing value)? refreshing,
    TResult Function(Empty value)? empty,
    TResult Function(InitialState value)? initial,
    TResult Function(Data value)? onData,
    TResult Function(Error value)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class Error implements ApiBuilderState {
  const factory Error({required final ApiFailure error}) = _$Error;

  ApiFailure get error;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
