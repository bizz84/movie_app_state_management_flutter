import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_keys.dart';

import '../models/tmdb/tmdb_movies_response.dart';

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
  static String tmdbBaseUrl = "https://api.themoviedb.org/3";
  static String tmdbBaseImageUrl = "http://image.tmdb.org/t/p/";

  static String moviesNowPlaying(int page) {
    return '$tmdbBaseUrl'
        '/movie/now_playing?api_key='
        '$tmdbApiKey'
        '&include_adult=false&page=$page';
  }

  static String imageUrl(String path, PosterSize size) {
    return tmdbBaseImageUrl + _posterSizes[size] + path;
  }
}

// TODO: Convert to use DIO
class TMDBClient {
  Future<TMDBMoviesResponse> nowPlayingMovies({int page}) async {
    final response = await http.get(TMDBApi.moviesNowPlaying(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }
}
