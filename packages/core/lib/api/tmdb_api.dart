import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cupertino_http/cupertino_client.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

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

// TODO: Convert to use DIO
class TMDBClient {
  TMDBClient({
    required this.client,
  });
  final Client client;

  factory TMDBClient.platform() {
    final client = Platform.isIOS || Platform.isMacOS
        ? CupertinoClient.defaultSessionConfiguration()
        : IOClient();
    return TMDBClient(client: client);
  }

  Future<TMDBMoviesResponse> nowPlayingMovies({required int page}) async {
    final response = await client.get(TMDBApi.moviesNowPlaying(page));
    return TMDBMoviesResponse.fromJson(json.decode(response.body));
  }
}
