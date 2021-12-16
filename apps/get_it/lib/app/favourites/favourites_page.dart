import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class FavouritesPage extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final dataStore = get<DataStore>();
    final profilesData = dataStore.profilesData();
    return StreamBuilder<ProfilesData>(
      stream: profilesData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final profilesData = snapshot.data!;
          final profileFavouriteMovies =
              dataStore.favouriteMovies(profileId: profilesData.selectedId!);
          return StreamBuilder<List<TMDBMovieBasic>>(
            stream: profileFavouriteMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ScrollableMoviesPageBuilder(
                  title: 'Favourites',
                  builder: (_, __) => MoviesGrid(movies: snapshot.data!),
                );
              } else if (snapshot.hasError) {
                // TODO:
                return Container();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
