import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/movies_bloc.dart';
import 'favourite_movies_grid.dart';

class NowPlayingPage extends ReactiveStatelessWidget {
  static const moviesGridKey = Key('moviesGrid');

  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableMoviesPageBuilder(
      title: 'Now Playing',
      onNextPageRequested: moviesBloc.fetchNextPage,
      builder: (context, controller) {
        final movies = moviesBloc.nowPlayingMovies;

        return moviesBloc.nowPlayingMoviesRM.onAll(
          onWaiting: movies.isEmpty
              ? () => const Center(
                    child: CircularProgressIndicator(),
                  )
              : null,
          onError: (dynamic error, refresh) {
            return Center(
              child: TextButton.icon(
                onPressed: refresh,
                icon: const Icon(Icons.refresh),
                label: Text('${error.message}'),
              ),
            );
          },
          onData: (_) {
            return FavouritesMovieGrid(
              key: moviesGridKey,
              movies: movies,
              controller: controller,
            );
          },
        );
      },
    );
  }
}
