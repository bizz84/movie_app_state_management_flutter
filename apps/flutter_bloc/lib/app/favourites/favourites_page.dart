import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataStore = RepositoryProvider.of<DataStore>(context);
    final profilesData = RepositoryProvider.of<ProfilesData>(context);
    return StreamBuilder<List<TMDBMovieBasic>>(
      stream: dataStore.favouriteMovies(profileId: profilesData.selectedId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final movies = snapshot.data;
            return ScrollableMoviesPageBuilder(
              title: 'Favourites',
              builder: (_, __) => MoviesGrid(movies: movies!),
            );
          } else {
            return Container();
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
