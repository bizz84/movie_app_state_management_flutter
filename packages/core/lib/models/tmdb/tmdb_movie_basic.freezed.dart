// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of core;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TMDBMovieBasic _$TMDBMovieBasicFromJson(Map<String, dynamic> json) {
  return _TMDBMovieBasic.fromJson(json);
}

/// @nodoc
class _$TMDBMovieBasicTearOff {
  const _$TMDBMovieBasicTearOff();

  _TMDBMovieBasic call(
      {@JsonKey(name: 'vote_count') int? voteCount,
      required int id,
      bool video = false,
      @JsonKey(name: 'vote_average') double? voteAverage,
      required String title,
      double? popularity,
      @JsonKey(name: 'poster_path') required String posterPath,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      bool? adult,
      String? overview,
      @JsonKey(name: 'release_date') String? releaseDate}) {
    return _TMDBMovieBasic(
      voteCount: voteCount,
      id: id,
      video: video,
      voteAverage: voteAverage,
      title: title,
      popularity: popularity,
      posterPath: posterPath,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      genreIds: genreIds,
      backdropPath: backdropPath,
      adult: adult,
      overview: overview,
      releaseDate: releaseDate,
    );
  }

  TMDBMovieBasic fromJson(Map<String, Object> json) {
    return TMDBMovieBasic.fromJson(json);
  }
}

/// @nodoc
const $TMDBMovieBasic = _$TMDBMovieBasicTearOff();

/// @nodoc
mixin _$TMDBMovieBasic {
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  int get id;
  bool get video;
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  String get title;
  double? get popularity;
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  bool? get adult;
  String? get overview;
  @JsonKey(name: 'release_date')
  String? get releaseDate;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TMDBMovieBasicCopyWith<TMDBMovieBasic> get copyWith;
}

/// @nodoc
abstract class $TMDBMovieBasicCopyWith<$Res> {
  factory $TMDBMovieBasicCopyWith(
          TMDBMovieBasic value, $Res Function(TMDBMovieBasic) then) =
      _$TMDBMovieBasicCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'vote_count') int? voteCount,
      int id,
      bool video,
      @JsonKey(name: 'vote_average') double? voteAverage,
      String title,
      double? popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      bool? adult,
      String? overview,
      @JsonKey(name: 'release_date') String? releaseDate});
}

/// @nodoc
class _$TMDBMovieBasicCopyWithImpl<$Res>
    implements $TMDBMovieBasicCopyWith<$Res> {
  _$TMDBMovieBasicCopyWithImpl(this._value, this._then);

  final TMDBMovieBasic _value;
  // ignore: unused_field
  final $Res Function(TMDBMovieBasic) _then;

  @override
  $Res call({
    Object? voteCount = freezed,
    Object? id = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? title = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? genreIds = freezed,
    Object? backdropPath = freezed,
    Object? adult = freezed,
    Object? overview = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int?,
      id: id == freezed ? _value.id : id as int,
      video: video == freezed ? _value.video : video as bool,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double?,
      title: title == freezed ? _value.title : title as String,
      popularity:
          popularity == freezed ? _value.popularity : popularity as double?,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String?,
      genreIds: genreIds == freezed ? _value.genreIds : genreIds as List<int>?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String?,
      adult: adult == freezed ? _value.adult : adult as bool?,
      overview: overview == freezed ? _value.overview : overview as String?,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String?,
    ));
  }
}

/// @nodoc
abstract class _$TMDBMovieBasicCopyWith<$Res>
    implements $TMDBMovieBasicCopyWith<$Res> {
  factory _$TMDBMovieBasicCopyWith(
          _TMDBMovieBasic value, $Res Function(_TMDBMovieBasic) then) =
      __$TMDBMovieBasicCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'vote_count') int? voteCount,
      int id,
      bool video,
      @JsonKey(name: 'vote_average') double? voteAverage,
      String title,
      double? popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      bool? adult,
      String? overview,
      @JsonKey(name: 'release_date') String? releaseDate});
}

/// @nodoc
class __$TMDBMovieBasicCopyWithImpl<$Res>
    extends _$TMDBMovieBasicCopyWithImpl<$Res>
    implements _$TMDBMovieBasicCopyWith<$Res> {
  __$TMDBMovieBasicCopyWithImpl(
      _TMDBMovieBasic _value, $Res Function(_TMDBMovieBasic) _then)
      : super(_value, (v) => _then(v as _TMDBMovieBasic));

  @override
  _TMDBMovieBasic get _value => super._value as _TMDBMovieBasic;

  @override
  $Res call({
    Object? voteCount = freezed,
    Object? id = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? title = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? genreIds = freezed,
    Object? backdropPath = freezed,
    Object? adult = freezed,
    Object? overview = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_TMDBMovieBasic(
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int?,
      id: id == freezed ? _value.id : id as int,
      video: video == freezed ? _value.video : video as bool,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double?,
      title: title == freezed ? _value.title : title as String,
      popularity:
          popularity == freezed ? _value.popularity : popularity as double?,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String?,
      genreIds: genreIds == freezed ? _value.genreIds : genreIds as List<int>?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String?,
      adult: adult == freezed ? _value.adult : adult as bool?,
      overview: overview == freezed ? _value.overview : overview as String?,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TMDBMovieBasic implements _TMDBMovieBasic {
  _$_TMDBMovieBasic(
      {@JsonKey(name: 'vote_count') this.voteCount,
      required this.id,
      this.video = false,
      @JsonKey(name: 'vote_average') this.voteAverage,
      required this.title,
      this.popularity,
      @JsonKey(name: 'poster_path') required this.posterPath,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      @JsonKey(name: 'genre_ids') this.genreIds,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      this.adult,
      this.overview,
      @JsonKey(name: 'release_date') this.releaseDate});

  factory _$_TMDBMovieBasic.fromJson(Map<String, dynamic> json) =>
      _$_$_TMDBMovieBasicFromJson(json);

  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @override
  final int id;
  @JsonKey(defaultValue: false)
  @override
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  final String title;
  @override
  final double? popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @override
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  final bool? adult;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @override
  String toString() {
    return 'TMDBMovieBasic(voteCount: $voteCount, id: $id, video: $video, voteAverage: $voteAverage, title: $title, popularity: $popularity, posterPath: $posterPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, genreIds: $genreIds, backdropPath: $backdropPath, adult: $adult, overview: $overview, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TMDBMovieBasic &&
            (identical(other.voteCount, voteCount) ||
                const DeepCollectionEquality()
                    .equals(other.voteCount, voteCount)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.voteAverage, voteAverage) ||
                const DeepCollectionEquality()
                    .equals(other.voteAverage, voteAverage)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.popularity, popularity) ||
                const DeepCollectionEquality()
                    .equals(other.popularity, popularity)) &&
            (identical(other.posterPath, posterPath) ||
                const DeepCollectionEquality()
                    .equals(other.posterPath, posterPath)) &&
            (identical(other.originalLanguage, originalLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.originalLanguage, originalLanguage)) &&
            (identical(other.originalTitle, originalTitle) ||
                const DeepCollectionEquality()
                    .equals(other.originalTitle, originalTitle)) &&
            (identical(other.genreIds, genreIds) ||
                const DeepCollectionEquality()
                    .equals(other.genreIds, genreIds)) &&
            (identical(other.backdropPath, backdropPath) ||
                const DeepCollectionEquality()
                    .equals(other.backdropPath, backdropPath)) &&
            (identical(other.adult, adult) ||
                const DeepCollectionEquality().equals(other.adult, adult)) &&
            (identical(other.overview, overview) ||
                const DeepCollectionEquality()
                    .equals(other.overview, overview)) &&
            (identical(other.releaseDate, releaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.releaseDate, releaseDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(voteCount) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(voteAverage) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(popularity) ^
      const DeepCollectionEquality().hash(posterPath) ^
      const DeepCollectionEquality().hash(originalLanguage) ^
      const DeepCollectionEquality().hash(originalTitle) ^
      const DeepCollectionEquality().hash(genreIds) ^
      const DeepCollectionEquality().hash(backdropPath) ^
      const DeepCollectionEquality().hash(adult) ^
      const DeepCollectionEquality().hash(overview) ^
      const DeepCollectionEquality().hash(releaseDate);

  @JsonKey(ignore: true)
  @override
  _$TMDBMovieBasicCopyWith<_TMDBMovieBasic> get copyWith =>
      __$TMDBMovieBasicCopyWithImpl<_TMDBMovieBasic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TMDBMovieBasicToJson(this);
  }
}

abstract class _TMDBMovieBasic implements TMDBMovieBasic {
  factory _TMDBMovieBasic(
      {@JsonKey(name: 'vote_count') int? voteCount,
      required int id,
      bool video,
      @JsonKey(name: 'vote_average') double? voteAverage,
      required String title,
      double? popularity,
      @JsonKey(name: 'poster_path') required String posterPath,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_title') String? originalTitle,
      @JsonKey(name: 'genre_ids') List<int>? genreIds,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      bool? adult,
      String? overview,
      @JsonKey(name: 'release_date') String? releaseDate}) = _$_TMDBMovieBasic;

  factory _TMDBMovieBasic.fromJson(Map<String, dynamic> json) =
      _$_TMDBMovieBasic.fromJson;

  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  int get id;
  @override
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  String get title;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  bool? get adult;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  @JsonKey(ignore: true)
  _$TMDBMovieBasicCopyWith<_TMDBMovieBasic> get copyWith;
}
