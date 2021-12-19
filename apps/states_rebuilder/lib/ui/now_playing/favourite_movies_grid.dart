import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/favourite_button.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/movies_bloc.dart';

class FavouritesMovieGrid extends StatelessWidget {
  const FavouritesMovieGrid({
    Key? key,
    required this.movies,
    required this.controller,
  }) : super(key: key);
  final List<TMDBMovieBasic> movies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return MoviesGrid(
      movies: movies,
      controller: controller,
      favouriteBuilder: (context, movie) {
        return _MovieWidget(movie: movie);
      },
    );
  }
}

class _MovieWidget extends StatefulWidget {
  const _MovieWidget({Key? key, required this.movie}) : super(key: key);
  final TMDBMovieBasic movie;
  @override
  __MovieWidgetState createState() => __MovieWidgetState();
}

class __MovieWidgetState extends State<_MovieWidget> {
  late Injected<bool> favouriteMovieRM = RM.injectStream<bool>(
    () => moviesBloc.favouriteMovieStream(
      movie: widget.movie,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return OnBuilder<bool>.all(
      listenTo: favouriteMovieRM,
      onWaiting: () => Container(),
      onError: (dynamic err, refresh) => const Text('Error'),
      onData: (isFavourite) {
        return FavouriteButton(
          isFavourite: isFavourite,
          onFavouriteChanged: (isFavourite) {
            moviesBloc.setFavouriteMovie(
              movie: widget.movie,
              isFavourite: isFavourite,
            );
          },
        );
      },
    );
  }
}
