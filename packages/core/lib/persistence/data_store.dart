import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:flutter/foundation.dart';

import '../models/app_models/profile.dart';
import '../models/app_models/profiles_data.dart';

/// Domain-specific data store interface
abstract class DataStore {
  /// Profiles
  Future<void> createProfile(Profile profile);
  Future<void> setSelectedProfile(Profile profile);
  Stream<ProfilesData> profilesData();
  Future<ProfilesData> getProfilesData();
  Future<bool> profileExistsWithName(String name);

  /// Movies
  Future<void> setFavouriteMovie(
      {@required String profileId,
      @required TMDBMovieBasic movie,
      @required bool isFavourite});
  Stream<bool> favouriteMovie(
      {@required String profileId, @required TMDBMovieBasic movie});
  Stream<List<TMDBMovieBasic>> allSavedMovies();
  Stream<List<int>> favouriteMovieIDs({@required String profileId});
  Stream<List<TMDBMovieBasic>> favouriteMovies({@required String profileId});
}
