import '../tmdb/tmdb_movie_basic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'now_playing_state.freezed.dart';

@freezed
abstract class NowPlayingState with _$NowPlayingState {
  const factory NowPlayingState.data(
      List<TMDBMovieBasic> movies, bool hasReachedMax) = _Data;
  const factory NowPlayingState.dataLoading(List<TMDBMovieBasic> movies) =
      _DataLoading;
  const factory NowPlayingState.error(String error) = _Error;
}
