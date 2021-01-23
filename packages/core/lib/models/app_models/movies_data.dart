import 'dart:convert';

import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MoviesData {
  final Map<int, TMDBMovieBasic> movies;
  MoviesData({
    required this.movies,
  });

  Map<String, dynamic> toMap() {
    return movies.map((key, value) => MapEntry<String, dynamic>(
          key.toString(),
          value.toJson(),
        ));
  }

  factory MoviesData.fromMap(Map<String, dynamic> map) {
    final movies = map.map((key, value) => MapEntry<int, TMDBMovieBasic>(
          int.parse(key),
          TMDBMovieBasic.fromJson(value),
        ));

    return MoviesData(
      movies: movies,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesData.fromJson(String source) =>
      MoviesData.fromMap(json.decode(source));

  @override
  String toString() => 'MoviesData(movies: $movies)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return o is MoviesData && mapEquals(o.movies, movies);
  }

  @override
  int get hashCode => movies.hashCode;
}
