import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_state/now_playing_state.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app_demo_flutter/app/now_playing/favourite_movies_grid.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_model.dart';
import 'package:provider/provider.dart';

class NowPlayingPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    return StateNotifierProvider<NowPlayingModel, NowPlayingState>(
      create: (_) => NowPlayingModel(api: TMDBClient.platform()),
      child: NowPlayingPage(),
    );
  }

  static const moviesGridKey = Key('moviesGrid');

  @override
  Widget build(BuildContext context) {
    return ScrollableMoviesPageBuilder(
      title: 'Now Playing',
      onNextPageRequested: () {
        final model = context.read<NowPlayingModel>();
        model.fetchNextPage();
      },
      builder: (context, controller) {
        final state = context.watch<NowPlayingState>();
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
