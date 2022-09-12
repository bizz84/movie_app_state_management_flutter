import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_state/now_playing_state.dart';
import 'package:flutter/material.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/app/now_playing/favourite_movies_grid.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_model.dart';

final moviesModelProvider =
    StateNotifierProvider<NowPlayingModel, NowPlayingState>(
        (ref) => NowPlayingModel(api: TMDBClient.makeDefault()));

class NowPlayingPage extends ConsumerWidget {
  static const moviesGridKey = Key('moviesGrid');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollableMoviesPageBuilder(
      title: 'Now Playing',
      onNextPageRequested: () {
        final moviesModel = ref.read(moviesModelProvider.notifier);
        moviesModel.fetchNextPage();
      },
      builder: (_, controller) {
        final state = ref.watch(moviesModelProvider);
        return state.when(
          data: (movies, _) => FavouritesMovieGrid(
            key: moviesGridKey,
            movies: movies,
            controller: controller,
          ),
          dataLoading: (movies) {
            return movies.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FavouritesMovieGrid(
                    key: moviesGridKey,
                    movies: movies,
                    controller: controller,
                  );
          },
          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
