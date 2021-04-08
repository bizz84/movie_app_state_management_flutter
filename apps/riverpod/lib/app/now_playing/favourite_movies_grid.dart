import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/top_level_providers.dart';

final favouriteMovieProvider =
    StreamProvider.autoDispose.family<bool, TMDBMovieBasic>((ref, movie) {
  final dataStore = ref.watch(dataStoreProvider);
  final profilesData = ref.watch(profilesDataProvider);
  if (profilesData.selectedId != null) {
    return dataStore.favouriteMovie(
        profileId: profilesData.selectedId!, movie: movie);
  }
  return Stream.empty();
});

class FavouritesMovieGrid extends ConsumerWidget {
  const FavouritesMovieGrid(
      {Key? key, required this.movies, required this.controller})
      : super(key: key);
  final List<TMDBMovieBasic> movies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MoviesGrid(
      movies: movies,
      controller: controller,
      favouriteBuilder: (context, movie) {
        return Consumer(
          builder: (_, watch, __) {
            final favouriteMovie = watch(favouriteMovieProvider(movie));
            return favouriteMovie.when(
              data: (isFavourite) => FavouriteButton(
                isFavourite: isFavourite,
                onFavouriteChanged: (isFavourite) {
                  final profilesData = watch(profilesDataProvider);
                  if (profilesData.selectedId != null) {
                    final dataStore = context.read(dataStoreProvider);
                    dataStore.setFavouriteMovie(
                      profileId: profilesData.selectedId!,
                      movie: movie,
                      isFavourite: isFavourite,
                    );
                  }
                },
              ),
              loading: () => Container(),
              error: (_, __) => Container(),
            );
          },
        );
      },
    );
  }
}
