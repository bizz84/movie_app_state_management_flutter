library core;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb_movie_basic.freezed.dart';
part 'tmdb_movie_basic.g.dart';

@freezed
class TMDBMovieBasic with _$TMDBMovieBasic {
  factory TMDBMovieBasic({
    @JsonKey(name: 'vote_count') int? voteCount,
    required int id,
    @Default(false) bool video,
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
    @JsonKey(name: 'release_date') String? releaseDate,
  }) = _TMDBMovieBasic;

  factory TMDBMovieBasic.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieBasicFromJson(json);
}
