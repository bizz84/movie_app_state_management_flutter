import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/movies_bloc.dart';

class FavouritesPage extends ReactiveStatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return moviesBloc.favoriteMoviesRM.onAll(
      onWaiting: () => const Center(child: CircularProgressIndicator()),
      onError: (dynamic err, refresh) => Container(),
      onData: (movies) {
        return ScrollableMoviesPageBuilder(
          title: 'Favourites',
          builder: (_, __) => MoviesGrid(
            movies: movies,
          ),
        );
      },
    );
  }
}
