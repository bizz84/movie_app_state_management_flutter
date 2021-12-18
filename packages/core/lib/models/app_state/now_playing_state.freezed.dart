// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'now_playing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NowPlayingStateTearOff {
  const _$NowPlayingStateTearOff();

  _Data data(List<TMDBMovieBasic> movies, bool hasReachedMax) {
    return _Data(
      movies,
      hasReachedMax,
    );
  }

  _DataLoading dataLoading(List<TMDBMovieBasic> movies) {
    return _DataLoading(
      movies,
    );
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $NowPlayingState = _$NowPlayingStateTearOff();

/// @nodoc
mixin _$NowPlayingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)
        data,
    required TResult Function(List<TMDBMovieBasic> movies) dataLoading,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowPlayingStateCopyWith<$Res> {
  factory $NowPlayingStateCopyWith(
          NowPlayingState value, $Res Function(NowPlayingState) then) =
      _$NowPlayingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NowPlayingStateCopyWithImpl<$Res>
    implements $NowPlayingStateCopyWith<$Res> {
  _$NowPlayingStateCopyWithImpl(this._value, this._then);

  final NowPlayingState _value;
  // ignore: unused_field
  final $Res Function(NowPlayingState) _then;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  $Res call({List<TMDBMovieBasic> movies, bool hasReachedMax});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$NowPlayingStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? movies = freezed,
    Object? hasReachedMax = freezed,
  }) {
    return _then(_Data(
      movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<TMDBMovieBasic>,
      hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Data with DiagnosticableTreeMixin implements _Data {
  const _$_Data(this.movies, this.hasReachedMax);

  @override
  final List<TMDBMovieBasic> movies;
  @override
  final bool hasReachedMax;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NowPlayingState.data(movies: $movies, hasReachedMax: $hasReachedMax)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NowPlayingState.data'))
      ..add(DiagnosticsProperty('movies', movies))
      ..add(DiagnosticsProperty('hasReachedMax', hasReachedMax));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            const DeepCollectionEquality()
                .equals(other.hasReachedMax, hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(movies),
      const DeepCollectionEquality().hash(hasReachedMax));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)
        data,
    required TResult Function(List<TMDBMovieBasic> movies) dataLoading,
    required TResult Function(String error) error,
  }) {
    return data(movies, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return data?.call(movies, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(movies, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements NowPlayingState {
  const factory _Data(List<TMDBMovieBasic> movies, bool hasReachedMax) =
      _$_Data;

  List<TMDBMovieBasic> get movies;
  bool get hasReachedMax;
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DataLoadingCopyWith<$Res> {
  factory _$DataLoadingCopyWith(
          _DataLoading value, $Res Function(_DataLoading) then) =
      __$DataLoadingCopyWithImpl<$Res>;
  $Res call({List<TMDBMovieBasic> movies});
}

/// @nodoc
class __$DataLoadingCopyWithImpl<$Res>
    extends _$NowPlayingStateCopyWithImpl<$Res>
    implements _$DataLoadingCopyWith<$Res> {
  __$DataLoadingCopyWithImpl(
      _DataLoading _value, $Res Function(_DataLoading) _then)
      : super(_value, (v) => _then(v as _DataLoading));

  @override
  _DataLoading get _value => super._value as _DataLoading;

  @override
  $Res call({
    Object? movies = freezed,
  }) {
    return _then(_DataLoading(
      movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<TMDBMovieBasic>,
    ));
  }
}

/// @nodoc

class _$_DataLoading with DiagnosticableTreeMixin implements _DataLoading {
  const _$_DataLoading(this.movies);

  @override
  final List<TMDBMovieBasic> movies;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NowPlayingState.dataLoading(movies: $movies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NowPlayingState.dataLoading'))
      ..add(DiagnosticsProperty('movies', movies));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataLoading &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  @JsonKey(ignore: true)
  @override
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      __$DataLoadingCopyWithImpl<_DataLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)
        data,
    required TResult Function(List<TMDBMovieBasic> movies) dataLoading,
    required TResult Function(String error) error,
  }) {
    return dataLoading(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return dataLoading?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (dataLoading != null) {
      return dataLoading(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return dataLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return dataLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (dataLoading != null) {
      return dataLoading(this);
    }
    return orElse();
  }
}

abstract class _DataLoading implements NowPlayingState {
  const factory _DataLoading(List<TMDBMovieBasic> movies) = _$_DataLoading;

  List<TMDBMovieBasic> get movies;
  @JsonKey(ignore: true)
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$NowPlayingStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NowPlayingState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NowPlayingState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)
        data,
    required TResult Function(List<TMDBMovieBasic> movies) dataLoading,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TMDBMovieBasic> movies, bool hasReachedMax)? data,
    TResult Function(List<TMDBMovieBasic> movies)? dataLoading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_DataLoading value) dataLoading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_DataLoading value)? dataLoading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NowPlayingState {
  const factory _Error(String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
