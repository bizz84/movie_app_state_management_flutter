// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of core;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TMDBMoviesResponse _$TMDBMoviesResponseFromJson(Map<String, dynamic> json) {
  return _TMDBMoviesResponse.fromJson(json);
}

/// @nodoc
mixin _$TMDBMoviesResponse {
  int get page => throw _privateConstructorUsedError;
  List<TMDBMovieBasic> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  List<String> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TMDBMoviesResponseCopyWith<TMDBMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
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
      List<String> errors});
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
    Object? page = freezed,
    Object? results = freezed,
    Object? totalResults = freezed,
    Object? totalPages = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TMDBMovieBasic>,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TMDBMoviesResponseCopyWith<$Res>
    implements $TMDBMoviesResponseCopyWith<$Res> {
  factory _$$_TMDBMoviesResponseCopyWith(_$_TMDBMoviesResponse value,
          $Res Function(_$_TMDBMoviesResponse) then) =
      __$$_TMDBMoviesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'total_pages') int totalPages,
      List<String> errors});
}

/// @nodoc
class __$$_TMDBMoviesResponseCopyWithImpl<$Res>
    extends _$TMDBMoviesResponseCopyWithImpl<$Res>
    implements _$$_TMDBMoviesResponseCopyWith<$Res> {
  __$$_TMDBMoviesResponseCopyWithImpl(
      _$_TMDBMoviesResponse _value, $Res Function(_$_TMDBMoviesResponse) _then)
      : super(_value, (v) => _then(v as _$_TMDBMoviesResponse));

  @override
  _$_TMDBMoviesResponse get _value => super._value as _$_TMDBMoviesResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalResults = freezed,
    Object? totalPages = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_TMDBMoviesResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TMDBMovieBasic>,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TMDBMoviesResponse implements _TMDBMoviesResponse {
  _$_TMDBMoviesResponse(
      {required this.page,
      required final List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') required this.totalResults,
      @JsonKey(name: 'total_pages') required this.totalPages,
      final List<String> errors = const []})
      : _results = results,
        _errors = errors;

  factory _$_TMDBMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TMDBMoviesResponseFromJson(json);

  @override
  final int page;
  final List<TMDBMovieBasic> _results;
  @override
  List<TMDBMovieBasic> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<String> _errors;
  @override
  @JsonKey()
  List<String> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'TMDBMoviesResponse(page: $page, results: $results, totalResults: $totalResults, totalPages: $totalPages, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TMDBMoviesResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  _$$_TMDBMoviesResponseCopyWith<_$_TMDBMoviesResponse> get copyWith =>
      __$$_TMDBMoviesResponseCopyWithImpl<_$_TMDBMoviesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TMDBMoviesResponseToJson(
      this,
    );
  }
}

abstract class _TMDBMoviesResponse implements TMDBMoviesResponse {
  factory _TMDBMoviesResponse(
      {required final int page,
      required final List<TMDBMovieBasic> results,
      @JsonKey(name: 'total_results') required final int totalResults,
      @JsonKey(name: 'total_pages') required final int totalPages,
      final List<String> errors}) = _$_TMDBMoviesResponse;

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
  List<String> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_TMDBMoviesResponseCopyWith<_$_TMDBMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
