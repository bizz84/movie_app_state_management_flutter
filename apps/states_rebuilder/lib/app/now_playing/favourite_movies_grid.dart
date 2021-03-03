import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/favourite_button.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:flutter/material.dart';

import '../../main_injected.dart';
import '../app_startup/app_startup_page.dart';

class FavouritesMovieGrid extends StatelessWidget {
  const FavouritesMovieGrid(
      {Key key, @required this.movies, @required this.controller})
      : super(key: key);
  final List<TMDBMovieBasic> movies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return MoviesGrid(
      movies: movies,
      controller: controller,
      favouriteBuilder: (context, movie) {
        return dataStoreInject.streamBuilder<bool>(
          stream: (s, _) => s.favouriteMovie(
            profileId: profilesDataInject.state.selectedId,
            movie: movie,
          ),
          onWaiting: () => Container(),
          onError: (err) => Text('Error'),
          onData: (isFavourite) {
            return FavouriteButton(
              isFavourite: isFavourite,
              onFavouriteChanged: (isFavourite) {
                if (profilesDataInject.state.selectedId != null) {
                  dataStoreInject.state.setFavouriteMovie(
                    profileId: profilesDataInject.state.selectedId,
                    movie: movie,
                    isFavourite: isFavourite,
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
