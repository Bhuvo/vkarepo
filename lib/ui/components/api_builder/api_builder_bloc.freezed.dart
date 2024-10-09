// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_builder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'ApiBuilderEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
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
  const factory Load() = _$LoadImpl;
}

/// @nodoc
abstract class _$$UpdateQueryImplCopyWith<$Res> {
  factory _$$UpdateQueryImplCopyWith(
          _$UpdateQueryImpl value, $Res Function(_$UpdateQueryImpl) then) =
      __$$UpdateQueryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> query});
}

/// @nodoc
class __$$UpdateQueryImplCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$UpdateQueryImpl>
    implements _$$UpdateQueryImplCopyWith<$Res> {
  __$$UpdateQueryImplCopyWithImpl(
      _$UpdateQueryImpl _value, $Res Function(_$UpdateQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$UpdateQueryImpl(
      null == query
          ? _value._query
          : query // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateQueryImpl implements UpdateQuery {
  const _$UpdateQueryImpl(final Map<String, dynamic> query) : _query = query;

  final Map<String, dynamic> _query;
  @override
  Map<String, dynamic> get query {
    if (_query is EqualUnmodifiableMapView) return _query;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_query);
  }

  @override
  String toString() {
    return 'ApiBuilderEvent.updateQuery(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQueryImpl &&
            const DeepCollectionEquality().equals(other._query, _query));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_query));

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQueryImplCopyWith<_$UpdateQueryImpl> get copyWith =>
      __$$UpdateQueryImplCopyWithImpl<_$UpdateQueryImpl>(this, _$identity);

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
  const factory UpdateQuery(final Map<String, dynamic> query) =
      _$UpdateQueryImpl;

  Map<String, dynamic> get query;

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQueryImplCopyWith<_$UpdateQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreImpl implements LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'ApiBuilderEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
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
  const factory LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$ApiBuilderEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'ApiBuilderEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
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
  const factory Refresh() = _$RefreshImpl;
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

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ApiBuilderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
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
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadingMoreImplCopyWith<$Res> {
  factory _$$LoadingMoreImplCopyWith(
          _$LoadingMoreImpl value, $Res Function(_$LoadingMoreImpl) then) =
      __$$LoadingMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class __$$LoadingMoreImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$LoadingMoreImpl>
    implements _$$LoadingMoreImplCopyWith<$Res> {
  __$$LoadingMoreImplCopyWithImpl(
      _$LoadingMoreImpl _value, $Res Function(_$LoadingMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadingMoreImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$LoadingMoreImpl implements LoadingMore {
  const _$LoadingMoreImpl({required final List<Map<String, dynamic>> data})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApiBuilderState.loadingMore(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMoreImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
      __$$LoadingMoreImplCopyWithImpl<_$LoadingMoreImpl>(this, _$identity);

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
      _$LoadingMoreImpl;

  List<Map<String, dynamic>> get data;

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingImplCopyWith<$Res> {
  factory _$$RefreshingImplCopyWith(
          _$RefreshingImpl value, $Res Function(_$RefreshingImpl) then) =
      __$$RefreshingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class __$$RefreshingImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$RefreshingImpl>
    implements _$$RefreshingImplCopyWith<$Res> {
  __$$RefreshingImplCopyWithImpl(
      _$RefreshingImpl _value, $Res Function(_$RefreshingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RefreshingImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$RefreshingImpl implements Refreshing {
  const _$RefreshingImpl({required final List<Map<String, dynamic>> data})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApiBuilderState.refreshing(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshingImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingImplCopyWith<_$RefreshingImpl> get copyWith =>
      __$$RefreshingImplCopyWithImpl<_$RefreshingImpl>(this, _$identity);

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
      _$RefreshingImpl;

  List<Map<String, dynamic>> get data;

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshingImplCopyWith<_$RefreshingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl implements Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'ApiBuilderState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
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
  const factory Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStateImpl implements InitialState {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'ApiBuilderState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
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
  const factory InitialState() = _$InitialStateImpl;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> data, DateTime updatedAt});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DataImpl(
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

class _$DataImpl implements Data {
  const _$DataImpl(
      {required final List<Map<String, dynamic>> data, required this.updatedAt})
      : _data = data;

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), updatedAt);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

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
      required final DateTime updatedAt}) = _$DataImpl;

  List<Map<String, dynamic>> get data;
  DateTime get updatedAt;

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiFailure error});

  $ApiFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ApiBuilderStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiFailureCopyWith<$Res> get error {
    return $ApiFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final ApiFailure error;

  @override
  String toString() {
    return 'ApiBuilderState.onError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

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
  const factory Error({required final ApiFailure error}) = _$ErrorImpl;

  ApiFailure get error;

  /// Create a copy of ApiBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
