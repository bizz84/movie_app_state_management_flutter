// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of core;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TMDBMoviesResponse _$TMDBMoviesResponseFromJson(Map<String, dynamic> json) {
  return _TMDBMoviesResponse.fromJson(json);
}

/// @nodoc
class _$TMDBMoviesResponseTearOff {
  const _$TMDBMoviesResponseTearOff();

// ignore: unused_element
  _TMDBMoviesResponse call(
      {int page,
      List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'errors') List<String> errors}) {
    return _TMDBMoviesResponse(
      page: page,
      results: results,
      totalResults: totalResults,
      totalPages: totalPages,
      errors: errors,
    );
  }

// ignore: unused_element
  TMDBMoviesResponse fromJson(Map<String, Object> json) {
    return TMDBMoviesResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TMDBMoviesResponse = _$TMDBMoviesResponseTearOff();

/// @nodoc
mixin _$TMDBMoviesResponse {
  int get page;
  List<TMDBMovieBasic> get results;
  @JsonKey(name: 'total_results')
  int get totalResults;
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @JsonKey(name: 'errors')
  List<String> get errors;

  Map<String, dynamic> toJson();
  $TMDBMoviesResponseCopyWith<TMDBMoviesResponse> get copyWith;
}

/// @nodoc
abstract class $TMDBMoviesResponseCopyWith<$Res> {
  factory $TMDBMoviesResponseCopyWith(
          TMDBMoviesResponse value, $Res Function(TMDBMoviesResponse) then) =
      _$TMDBMoviesResponseCopyWithImpl<$Res>;
  $Res call(
      {int page,
      List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'errors') List<String> errors});
}

/// @nodoc
class _$TMDBMoviesResponseCopyWithImpl<$Res>
    implements $TMDBMoviesResponseCopyWith<$Res> {
  _$TMDBMoviesResponseCopyWithImpl(this._value, this._then);

  final TMDBMoviesResponse _value;
  // ignore: unused_field
  final $Res Function(TMDBMoviesResponse) _then;

  @override
  $Res call({
    Object page = freezed,
    Object results = freezed,
    Object totalResults = freezed,
    Object totalPages = freezed,
    Object errors = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
      results:
          results == freezed ? _value.results : results as List<TMDBMovieBasic>,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      totalPages: totalPages == freezed ? _value.totalPages : totalPages as int,
      errors: errors == freezed ? _value.errors : errors as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$TMDBMoviesResponseCopyWith<$Res>
    implements $TMDBMoviesResponseCopyWith<$Res> {
  factory _$TMDBMoviesResponseCopyWith(
          _TMDBMoviesResponse value, $Res Function(_TMDBMoviesResponse) then) =
      __$TMDBMoviesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'errors') List<String> errors});
}

/// @nodoc
class __$TMDBMoviesResponseCopyWithImpl<$Res>
    extends _$TMDBMoviesResponseCopyWithImpl<$Res>
    implements _$TMDBMoviesResponseCopyWith<$Res> {
  __$TMDBMoviesResponseCopyWithImpl(
      _TMDBMoviesResponse _value, $Res Function(_TMDBMoviesResponse) _then)
      : super(_value, (v) => _then(v as _TMDBMoviesResponse));

  @override
  _TMDBMoviesResponse get _value => super._value as _TMDBMoviesResponse;

  @override
  $Res call({
    Object page = freezed,
    Object results = freezed,
    Object totalResults = freezed,
    Object totalPages = freezed,
    Object errors = freezed,
  }) {
    return _then(_TMDBMoviesResponse(
      page: page == freezed ? _value.page : page as int,
      results:
          results == freezed ? _value.results : results as List<TMDBMovieBasic>,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      totalPages: totalPages == freezed ? _value.totalPages : totalPages as int,
      errors: errors == freezed ? _value.errors : errors as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TMDBMoviesResponse implements _TMDBMoviesResponse {
  _$_TMDBMoviesResponse(
      {this.page,
      this.results,
      @JsonKey(name: 'total_results') this.totalResults,
      @JsonKey(name: 'total_pages') this.totalPages,
      @JsonKey(name: 'errors') this.errors});

  factory _$_TMDBMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TMDBMoviesResponseFromJson(json);

  @override
  final int page;
  @override
  final List<TMDBMovieBasic> results;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'errors')
  final List<String> errors;

  @override
  String toString() {
    return 'TMDBMoviesResponse(page: $page, results: $results, totalResults: $totalResults, totalPages: $totalPages, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TMDBMoviesResponse &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality()
                    .equals(other.results, results)) &&
            (identical(other.totalResults, totalResults) ||
                const DeepCollectionEquality()
                    .equals(other.totalResults, totalResults)) &&
            (identical(other.totalPages, totalPages) ||
                const DeepCollectionEquality()
                    .equals(other.totalPages, totalPages)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(results) ^
      const DeepCollectionEquality().hash(totalResults) ^
      const DeepCollectionEquality().hash(totalPages) ^
      const DeepCollectionEquality().hash(errors);

  @override
  _$TMDBMoviesResponseCopyWith<_TMDBMoviesResponse> get copyWith =>
      __$TMDBMoviesResponseCopyWithImpl<_TMDBMoviesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TMDBMoviesResponseToJson(this);
  }
}

abstract class _TMDBMoviesResponse implements TMDBMoviesResponse {
  factory _TMDBMoviesResponse(
      {int page,
      List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'errors') List<String> errors}) = _$_TMDBMoviesResponse;

  factory _TMDBMoviesResponse.fromJson(Map<String, dynamic> json) =
      _$_TMDBMoviesResponse.fromJson;

  @override
  int get page;
  @override
  List<TMDBMovieBasic> get results;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'errors')
  List<String> get errors;
  @override
  _$TMDBMoviesResponseCopyWith<_TMDBMoviesResponse> get copyWith;
}
