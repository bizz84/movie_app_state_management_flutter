import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_demo_flutter/blocs/api_dependencies.dart';
import 'package:movie_app_demo_flutter/blocs/movies_bloc.dart';
import 'package:movie_app_demo_flutter/blocs/profiles_bloc.dart';

class DataStoreMock extends Mock implements DataStore {
  bool isFavouriteMovieCalled = false;
  @override
  Stream<bool> favouriteMovie({
    required String profileId,
    required TMDBMovieBasic movie,
  }) {
    isFavouriteMovieCalled = true;
    return Future.value(true).asStream();
  }
}

class TMDBClientMock extends Mock implements TMDBClient {}

void main() {
  final dataStoreMock = DataStoreMock();
  final tMDBClientMock = TMDBClientMock();
  setUp(() {
    apiDependencies.dataStoreRM.injectMock(() => dataStoreMock);
    apiDependencies.apiRM.injectMock(() => tMDBClientMock);
    profilesBloc.profilesDataRMStream.injectMock(() => ProfilesData(
          profiles: {},
          selectedId: '1',
        ));
  });

  testWidgets(
    'Test MovieBloc.fetchNextPage method',
    (tester) async {
      when(() => tMDBClientMock.nowPlayingMovies(page: 1)).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 1));
          return TMDBMoviesResponse(
            page: 1,
            results: List.generate(
              5,
              (i) => TMDBMovieBasic(
                id: i,
                posterPath: 'path',
                title: 'title$i',
              ),
            ),
            totalPages: 2,
            totalResults: 10,
          );
        },
      );
      // First call of fetchNextPage.
      moviesBloc.fetchNextPage();
      await tester.pump();
      expect(moviesBloc.nowPlayingMoviesRM.isWaiting, true);
      await tester.pump(const Duration(seconds: 1));
      expect(moviesBloc.nowPlayingMoviesRM.hasData, true);
      // Has no reach max yet
      expect(moviesBloc.nowPlayingMoviesRM.state.hasReachMax, false);
      // We have 5 movies
      expect(moviesBloc.nowPlayingMovies.length, 5);
      //
      when(() => tMDBClientMock.nowPlayingMovies(page: 2)).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 1));
          return TMDBMoviesResponse(
            page: 2,
            results: List.generate(
              5,
              (i) => TMDBMovieBasic(
                id: i,
                posterPath: 'path',
                title: 'title$i',
              ),
            ),
            totalPages: 2,
            totalResults: 10,
          );
        },
      );
      // The second call of fetchNextPage
      moviesBloc.fetchNextPage();
      await tester.pump();
      expect(moviesBloc.nowPlayingMoviesRM.isWaiting, true);
      await tester.pump(const Duration(seconds: 1));
      expect(moviesBloc.nowPlayingMoviesRM.hasData, true);
      // We haven't reach max yet
      expect(moviesBloc.nowPlayingMoviesRM.state.hasReachMax, false);
      // the new movies are added to the old movies (5+5=10)
      expect(moviesBloc.nowPlayingMovies.length, 10);
      //
      //
      when(() => tMDBClientMock.nowPlayingMovies(page: 3)).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 1));
          return TMDBMoviesResponse(
            page: 2,
            results: const [], // Returns empty results (reach max)
            totalPages: 2,
            totalResults: 10,
          );
        },
      );
      // The third call of fetchNextPage
      moviesBloc.fetchNextPage();
      await tester.pump();
      expect(moviesBloc.nowPlayingMoviesRM.isWaiting, true);
      await tester.pump(const Duration(seconds: 1));
      expect(moviesBloc.nowPlayingMoviesRM.hasData, true);
      // As result is empty, we reached the max
      expect(moviesBloc.nowPlayingMoviesRM.state.hasReachMax, true);
      // The movies remains 10
      expect(moviesBloc.nowPlayingMovies.length, 10);
    },
  );
  testWidgets(
    'Text MovieBloc.favouriteMovieStream method',
    (tester) async {
      expect(dataStoreMock.isFavouriteMovieCalled, false);
      moviesBloc.favouriteMovieStream(
        movie: TMDBMovieBasic(
          id: 1,
          posterPath: 'path',
          title: 'title1',
        ),
      );
      await tester.pump();
      expect(dataStoreMock.isFavouriteMovieCalled, true);
    },
  );

  testWidgets(
    'Text MovieBloc.setFavouriteMovie method',
    (tester) async {
      when(
        () => dataStoreMock.setFavouriteMovie(
          profileId: '1',
          movie: TMDBMovieBasic(
            id: 1,
            posterPath: 'path',
            title: 'title1',
          ),
          isFavourite: true,
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );

      moviesBloc.setFavouriteMovie(
        movie: TMDBMovieBasic(
          id: 1,
          posterPath: 'path',
          title: 'title1',
        ),
        isFavourite: true,
      );
      await tester.pump();

      verify(() => dataStoreMock.setFavouriteMovie(
            profileId: '1',
            movie: TMDBMovieBasic(
              id: 1,
              posterPath: 'path',
              title: 'title1',
            ),
            isFavourite: true,
          )).called(1);
    },
  );
}
