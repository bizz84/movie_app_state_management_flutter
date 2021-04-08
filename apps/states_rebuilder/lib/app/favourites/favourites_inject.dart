part of 'favourites_page.dart';

//Used instead of RxDart
final _favoriteMoviesInject = RM.inject<List<TMDBMovieBasic>>(
  () => _allSavedMoviesInject.state
      .where(
        (movie) => _favoriteMoviesIdInject.state.contains(movie.id),
      )
      .toList(),
  autoDisposeWhenNotUsed: false,
  //when _allSavedMoviesInject or _favoriteMoviesIdInject changes,
  //this _favoriteMoviesInject is recalculated
  dependsOn: DependsOn({_allSavedMoviesInject, _favoriteMoviesIdInject}),
  // debugPrintWhenNotifiedPreMessage: '_favoriteMoviesInject',
);

final _allSavedMoviesInject = RM.injectStream(
  () => dataStoreInject.state.allSavedMovies(),
);

final _favoriteMoviesIdInject = RM.injectStream<List<int>>(
  () => dataStoreInject.state.favouriteMovieIDs(
    profileId: profilesDataInject.state.selectedId,
  ),
  //When the selected profile changes, close the current stream subscritpion
  //and subscribe to new favouriteMovieIDs with the new profile id.
  dependsOn: DependsOn({profilesDataInject}),
);
