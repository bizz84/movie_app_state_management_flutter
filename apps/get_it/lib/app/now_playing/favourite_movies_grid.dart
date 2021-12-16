import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/favourite_button.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class FavouritesMovieGrid extends StatelessWidget with GetItMixin {
  FavouritesMovieGrid(
      {Key? key, required this.movies, required this.controller})
      : super(key: key);
  final List<TMDBMovieBasic> movies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return MoviesGrid(
      movies: movies,
      controller: controller,
      favouriteBuilder: (context, movie) {
        final dataStore = get<DataStore>();
        final profilesData = dataStore.profilesData();
        return StreamBuilder<ProfilesData>(
          stream: profilesData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final profilesData = snapshot.data!;
              final stream = profilesData.selectedId != null
                  ? dataStore.favouriteMovie(
                      profileId: profilesData.selectedId!, movie: movie)
                  : Stream<bool>.empty();
              return StreamBuilder<bool>(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final isFavourite = snapshot.data!;
                    return FavouriteButton(
                      isFavourite: isFavourite,
                      onFavouriteChanged: (isFavourite) {
                        if (profilesData.selectedId != null) {
                          final dataStore = get<DataStore>();
                          dataStore.setFavouriteMovie(
                            profileId: profilesData.selectedId!,
                            movie: movie,
                            isFavourite: isFavourite,
                          );
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
