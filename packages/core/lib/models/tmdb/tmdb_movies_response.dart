library core;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'tmdb_movie_basic.dart';

part 'tmdb_movies_response.freezed.dart';
part 'tmdb_movies_response.g.dart';

@freezed
abstract class TMDBMoviesResponse with _$TMDBMoviesResponse {
  factory TMDBMoviesResponse({
    required int page,
    required List<TMDBMovieBasic> results,
    @JsonKey(name: 'total_results') required int totalResults,
    @JsonKey(name: 'total_pages') required int totalPages,
    @Default([]) List<String> errors,
  }) = _TMDBMoviesResponse;

  factory TMDBMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBMoviesResponseFromJson(json);
}

extension TMDBMoviesResponseX on TMDBMoviesResponse {
  //@late
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return results.length > 0;
  }

  bool hasErrors() {
    return errors.length > 0;
  }
}
