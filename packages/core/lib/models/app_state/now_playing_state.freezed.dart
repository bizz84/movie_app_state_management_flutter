// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'now_playing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NowPlayingStateTearOff {
  const _$NowPlayingStateTearOff();

// ignore: unused_element
  _Data data(List<TMDBMovieBasic> movies, bool hasReachedMax) {
    return _Data(
      movies,
      hasReachedMax,
    );
  }

// ignore: unused_element
  _DataLoading dataLoading(List<TMDBMovieBasic> movies) {
    return _DataLoading(
      movies,
    );
  }

// ignore: unused_element
  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NowPlayingState = _$NowPlayingStateTearOff();

/// @nodoc
mixin _$NowPlayingState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    @required TResult dataLoading(List<TMDBMovieBasic> movies),
    @required TResult error(String error),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    TResult dataLoading(List<TMDBMovieBasic> movies),
    TResult error(String error),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  });
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
    Object movies = freezed,
    Object hasReachedMax = freezed,
  }) {
    return _then(_Data(
      movies == freezed ? _value.movies : movies as List<TMDBMovieBasic>,
      hasReachedMax == freezed ? _value.hasReachedMax : hasReachedMax as bool,
    ));
  }
}

/// @nodoc
class _$_Data with DiagnosticableTreeMixin implements _Data {
  const _$_Data(this.movies, this.hasReachedMax)
      : assert(movies != null),
        assert(hasReachedMax != null);

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
        (other is _Data &&
            (identical(other.movies, movies) ||
                const DeepCollectionEquality().equals(other.movies, movies)) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                const DeepCollectionEquality()
                    .equals(other.hasReachedMax, hasReachedMax)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(movies) ^
      const DeepCollectionEquality().hash(hasReachedMax);

  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    @required TResult dataLoading(List<TMDBMovieBasic> movies),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return data(movies, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    TResult dataLoading(List<TMDBMovieBasic> movies),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(movies, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  _$DataCopyWith<_Data> get copyWith;
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
    Object movies = freezed,
  }) {
    return _then(_DataLoading(
      movies == freezed ? _value.movies : movies as List<TMDBMovieBasic>,
    ));
  }
}

/// @nodoc
class _$_DataLoading with DiagnosticableTreeMixin implements _DataLoading {
  const _$_DataLoading(this.movies) : assert(movies != null);

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
        (other is _DataLoading &&
            (identical(other.movies, movies) ||
                const DeepCollectionEquality().equals(other.movies, movies)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(movies);

  @override
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      __$DataLoadingCopyWithImpl<_DataLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    @required TResult dataLoading(List<TMDBMovieBasic> movies),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return dataLoading(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    TResult dataLoading(List<TMDBMovieBasic> movies),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (dataLoading != null) {
      return dataLoading(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return dataLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (dataLoading != null) {
      return dataLoading(this);
    }
    return orElse();
  }
}

abstract class _DataLoading implements NowPlayingState {
  const factory _DataLoading(List<TMDBMovieBasic> movies) = _$_DataLoading;

  List<TMDBMovieBasic> get movies;
  _$DataLoadingCopyWith<_DataLoading> get copyWith;
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
    Object error = freezed,
  }) {
    return _then(_Error(
      error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error(this.error) : assert(error != null);

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
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    @required TResult dataLoading(List<TMDBMovieBasic> movies),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(List<TMDBMovieBasic> movies, bool hasReachedMax),
    TResult dataLoading(List<TMDBMovieBasic> movies),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NowPlayingState {
  const factory _Error(String error) = _$_Error;

  String get error;
  _$ErrorCopyWith<_Error> get copyWith;
}
