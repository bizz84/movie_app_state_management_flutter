import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/top_level_providers.dart';

final AutoDisposeStreamProvider<List<TMDBMovieBasic>>?
    profileFavouriteMoviesProvider =
    StreamProvider.autoDispose<List<TMDBMovieBasic>>((ref) {
  final dataStore = ref.watch(dataStoreProvider);
  final profilesData = ref.watch(profilesDataProvider);
  if (profilesData.selectedId != null) {
    return dataStore.favouriteMovies(profileId: profilesData.selectedId!);
  } else {
    throw UnimplementedError();
  }
});

class FavouritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final profileFavouriteMovies = watch(profileFavouriteMoviesProvider!);
    return profileFavouriteMovies.when(
      data: (movies) => ScrollableMoviesPageBuilder(
        title: 'Favourites',
        builder: (_, __) => MoviesGrid(movies: movies),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (_, __) => Container(),
    );
  }
}
