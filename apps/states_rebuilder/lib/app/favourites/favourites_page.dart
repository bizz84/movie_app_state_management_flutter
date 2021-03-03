import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../main_injected.dart';
import '../app_startup/app_startup_page.dart';

part 'favourites_inject.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return On.or(
      onWaiting: () => const Center(child: CircularProgressIndicator()),
      onError: (err, refresh) => Container(),
      or: () {
        return ScrollableMoviesPageBuilder(
          title: 'Favourites',
          builder: (_, __) => MoviesGrid(
            movies: _favoriteMoviesInject.state,
          ),
        );
      },
    ).listenTo(_favoriteMoviesInject);
  }
}
