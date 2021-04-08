import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_inject.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'favourite_movies_grid.dart';

class NowPlayingPage extends StatelessWidget {
  static const moviesGridKey = Key('moviesGrid');

  @override
  Widget build(BuildContext context) {
    return ScrollableMoviesPageBuilder(
      title: 'Now Playing',
      onNextPageRequested: () {
        nowPlayingMoviesInject.state.fetchNextPage();
      },
      builder: (context, controller) {
        return On.or(
          onError: (error, refresh) {
            return Center(
              child: TextButton.icon(
                onPressed: refresh,
                icon: Icon(Icons.refresh),
                label: Text('${error.message}'),
              ),
            );
          },
          or: () {
            if (nowPlayingMoviesInject.isWaiting &&
                nowPlayingMoviesInject.state.movies.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return FavouritesMovieGrid(
              key: moviesGridKey,
              movies: nowPlayingMoviesInject.state.movies,
              controller: controller,
            );
          },
        ).listenTo(nowPlayingMoviesInject);
      },
    );
  }
}
