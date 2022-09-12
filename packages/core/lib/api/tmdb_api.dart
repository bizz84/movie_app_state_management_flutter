import 'dart:async';

import 'package:dio/dio.dart';

import '../models/tmdb/tmdb_movies_response.dart';
import 'api_keys.dart';

enum PosterSize {
  w92,
  w154,
  w185,
  w342,
  w500,
  w780,
  original,
}

Map<PosterSize, String> _posterSizes = {
  PosterSize.w92: "w92",
  PosterSize.w154: "w154",
  PosterSize.w185: "w185",
  PosterSize.w342: "w342",
  PosterSize.w500: "w500",
  PosterSize.w780: "w780",
  PosterSize.original: "original",
};

class TMDBApi {
  static String tmdbBaseImageUrl = "http://image.tmdb.org/t/p/";

  static Uri moviesNowPlaying(int page) {
    return Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': tmdbApiKey,
        'include_adult': 'false',
        'page': '$page',
      },
    );
  }

  static String imageUrl(String path, PosterSize size) {
    return tmdbBaseImageUrl + _posterSizes[size]! + path;
  }
}

class TMDBClient {
  TMDBClient({required this.client});
  factory TMDBClient.makeDefault() => TMDBClient(client: Dio());
  final Dio client;

  Future<TMDBMoviesResponse> nowPlayingMovies({required int page}) async {
    final response =
        await client.get(TMDBApi.moviesNowPlaying(page).toString());
    return TMDBMoviesResponse.fromJson(response.data);
  }
}
