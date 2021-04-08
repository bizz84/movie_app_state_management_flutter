import 'package:flutter/material.dart';
import '../models/tmdb/tmdb_movie_basic.dart';
import '../ui/poster_tile.dart';

// TODO: Add favourite button builder
class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    Key? key,
    required this.movies,
    this.controller,
    this.favouriteBuilder,
  }) : super(key: key);
  final List<TMDBMovieBasic> movies;
  final ScrollController? controller;
  final Widget Function(BuildContext, TMDBMovieBasic)? favouriteBuilder;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: screenSize.width / 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 185.0 / 278.0,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return PosterTile(
          imagePath: movie.posterPath,
          //debugIndex: index,
          favouriteBuilder: favouriteBuilder != null
              ? (context) => favouriteBuilder!.call(context, movie)
              : null,
        );
      },
      controller: controller,
    );
  }
}
