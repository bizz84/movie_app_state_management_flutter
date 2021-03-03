import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../main_injected.dart';

class NowPlayingMovies {
  final List<TMDBMovieBasic> movies;
  final int page;
  NowPlayingMovies({
    this.movies,
    this.page,
  });
}

final nowPlayingMoviesInject = RM.inject<NowPlayingMovies>(
  () => NowPlayingMovies(movies: [], page: 0),
  onInitialized: (s) => s.fetchNextPage(),
  autoDisposeWhenNotUsed: false,
  //middleSnapState is called after fetchNextPage is invoked and just before state
  //mutation
  //
  //It exposes the current snap of the state and the next snap.
  middleSnapState: (snap) {
    snap.print(); //logger for the state
    if (!snap.nextSnap.hasData) {
      //If the next snap has no data (isIdle, isWaiting, hasError) just continue with it
      return snap.nextSnap;
    }

    if (snap.currentSnap.data.movies.isNotEmpty &&
        snap.nextSnap.data.movies.isEmpty) {
      //If the movie's pages reache the maximum
      //return the currentSnap with isAcive flag set to false
      return snap.currentSnap.copyTo(isActive: false);
    }

    return snap.nextSnap.copyTo(
      data: NowPlayingMovies(
        movies: [
          ...snap.currentSnap.data.movies,
          ...snap.nextSnap.data.movies,
        ],
        page: snap.nextSnap.data.page,
      ),
    );
  },
);

extension NowPlayingMoviesX on NowPlayingMovies {
  Future<void> fetchNextPage() async {
    if (!nowPlayingMoviesInject.isActive || nowPlayingMoviesInject.isWaiting) {
      //isActive will be false if we reaches the maximum of pages
      //
      //When the state is waiting we prevent any further movies' fetch
      return;
    }
    return nowPlayingMoviesInject.setState(
      (s) async {
        print('Fetching page ${page + 1}');

        final TMDBMoviesResponse result =
            await apiInject.state.nowPlayingMovies(
          page: page + 1,
        );
        return NowPlayingMovies(
          movies: result.results,
          page: page + 1,
        );
      },
    );
  }
}
