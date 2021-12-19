import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'api_dependencies.dart';
import 'profiles_bloc.dart';

/// Hold all business logic related to Movies creation, selection and fetching
@immutable
class MoviesBloc {
  /// Get now playing movies
  late final nowPlayingMoviesRM = RM.inject<_NowPlayingMovies>(
    () => _NowPlayingMovies(movies: [], page: 0),
    sideEffects: SideEffects(
      initState: fetchNextPage,
    ),
    autoDisposeWhenNotUsed: false,
    //stateInterceptor is called after fetchNextPage is invoked and just before state
    //mutation
    //
    //It exposes the current snap of the state and the next snap.
    stateInterceptor: (currentSnap, nextSnap) {
      if (!nextSnap.hasData) {
        //If the next snap has no data (isIdle, isWaiting, hasError) just continue with it
        return nextSnap;
      }

      if (currentSnap.state.movies.isNotEmpty &&
          nextSnap.state.movies.isEmpty) {
        //If the movie's pages reache the maximum
        //return the currentSnap with hasReachMax flag set to true
        return currentSnap.copyTo(
          data: currentSnap.data!.copyWith(hasReachMax: true),
        );
      }

      return nextSnap.copyTo(
        data: _NowPlayingMovies(
          movies: [
            ...currentSnap.state.movies,
            ...nextSnap.state.movies,
          ],
          page: nextSnap.state.page,
        ),
      );
    },
  );
  List<TMDBMovieBasic> get nowPlayingMovies => nowPlayingMoviesRM.state.movies;

  Future<void> fetchNextPage() async {
    if (nowPlayingMoviesRM.state.hasReachMax || nowPlayingMoviesRM.isWaiting) {
      // if we reaches the maximum of pages; or
      //
      //When the state is waiting we prevent any further movies' fetch
      return;
    }
    await nowPlayingMoviesRM.setState(
      (s) async {
        print('Fetching page ${nowPlayingMoviesRM.state.page + 1}');

        final TMDBMoviesResponse result =
            await apiDependencies.apiRM.state.nowPlayingMovies(
          page: nowPlayingMoviesRM.state.page + 1,
        );

        return _NowPlayingMovies(
          movies: result.results,
          page: nowPlayingMoviesRM.state.page + 1,
        );
      },
    );
  }

  // get and set favorite movies
  Stream<bool> favouriteMovieStream({
    required TMDBMovieBasic movie,
  }) {
    assert(profilesBloc.selectedId != null);
    return apiDependencies.dataStoreRM.state.favouriteMovie(
      profileId: profilesBloc.selectedId!,
      movie: movie,
    );
  }

  Future<void> setFavouriteMovie({
    required TMDBMovieBasic movie,
    required bool isFavourite,
  }) {
    assert(profilesBloc.selectedId != null);
    return apiDependencies.dataStoreRM.state.setFavouriteMovie(
      profileId: profilesBloc.selectedId!,
      movie: movie,
      isFavourite: isFavourite,
    );
  }

  final _allSavedMoviesRMStream = RM.injectStream(
    () => apiDependencies.dataStoreRM.state.allSavedMovies(),
  );

  final _favoriteMoviesIdRMStream = RM.injectStream<List<int>>(
    () {
      assert(profilesBloc.selectedId != null);
      return apiDependencies.dataStoreRM.state.favouriteMovieIDs(
        profileId: profilesBloc.selectedId!,
      );
    },
    //When the selected profile changes, close the current stream subscritpion
    //and subscribe to new favouriteMovieIDs with the new profile id.
    dependsOn: DependsOn({profilesBloc.profilesDataRMStream}),
  );

  late final favoriteMoviesRM = RM.inject<List<TMDBMovieBasic>>(
    () => _allSavedMoviesRMStream.state
        .where(
          (movie) => _favoriteMoviesIdRMStream.state.contains(movie.id),
        )
        .toList(),
    autoDisposeWhenNotUsed: false,
    //when _allSavedMoviesInject or _favoriteMoviesIdInject changes,
    //this _favoriteMoviesInject is recalculated
    dependsOn: DependsOn({_allSavedMoviesRMStream, _favoriteMoviesIdRMStream}),
    // debugPrintWhenNotifiedPreMessage: '_favoriteMoviesInject',
  );
}

final moviesBloc = MoviesBloc();

class _NowPlayingMovies {
  final List<TMDBMovieBasic> movies;
  final int page;
  final bool hasReachMax;

  _NowPlayingMovies({
    required this.movies,
    required this.page,
    this.hasReachMax = false,
  });

  _NowPlayingMovies copyWith({
    List<TMDBMovieBasic>? movies,
    int? page,
    bool? hasReachMax,
  }) {
    return _NowPlayingMovies(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      hasReachMax: hasReachMax ?? this.hasReachMax,
    );
  }
}
