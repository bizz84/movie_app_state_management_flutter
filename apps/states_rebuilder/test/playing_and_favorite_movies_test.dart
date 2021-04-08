import 'dart:async';

import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/poster_tile.dart';
import 'package:core/ui/profile_grid_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_page.dart';
import 'package:movie_app_demo_flutter/app/favourites/favourites_page.dart';
import 'package:movie_app_demo_flutter/app/now_playing/favourite_movies_grid.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_page.dart';
import 'package:movie_app_demo_flutter/main.dart';
import 'package:movie_app_demo_flutter/main_injected.dart';

class DataStoreMoke extends Mock implements DataStore {
  final Map<int, StreamController<bool>> _favouriteMovieControllers = {};
  final Map<String, List<TMDBMovieBasic>> _movies = {};
  final StreamController<List<TMDBMovieBasic>> allSavedMoviesController =
      StreamController.broadcast();
  final StreamController<List<int>> favoriedMoviesIdsController =
      StreamController.broadcast();

  List<TMDBMovieBasic> get savedMovies => _movies.values.fold(
        [],
        (p, e) => p..addAll(e),
      );
  @override
  Stream<bool> favouriteMovie({
    @required String profileId,
    @required TMDBMovieBasic movie,
  }) {
    _favouriteMovieControllers[movie.id]?.close();
    _favouriteMovieControllers[movie.id] = StreamController();
    Future(
      () {
        _favouriteMovieControllers[movie.id].sink.add(
              _movies[profileId]?.contains(movie) == true,
            );
      },
    );
    return _favouriteMovieControllers[movie.id].stream;
  }

  @override
  Future<void> setFavouriteMovie({
    @required String profileId,
    @required TMDBMovieBasic movie,
    @required bool isFavourite,
  }) async {
    if (isFavourite) {
      _movies[profileId] = [...(_movies[profileId] ?? []), movie];
    } else {
      _movies[profileId].remove(movie);
    }
    _favouriteMovieControllers[movie.id].sink.add(isFavourite);
    allSavedMoviesController.sink.add(savedMovies);
    favoriedMoviesIdsController.sink.add(
      _movies[profileId]?.map((e) => e.id)?.toList() ?? [],
    );
  }

  @override
  Stream<List<TMDBMovieBasic>> allSavedMovies() {
    Future(() => allSavedMoviesController.sink.add(savedMovies));
    return allSavedMoviesController.stream;
  }

  @override
  Stream<List<int>> favouriteMovieIDs({@required String profileId}) {
    Future(
      () => favoriedMoviesIdsController.sink.add(
        _movies[profileId]?.map((e) => e.id)?.toList() ?? [],
      ),
    );

    return favoriedMoviesIdsController.stream;
  }

  void dispose() {
    allSavedMoviesController.close();
    favoriedMoviesIdsController.close();
  }
}

class TMDBClientMoke extends Mock implements TMDBClient {}

void main() {
  //Instantiate and inject mocks
  final dataStoreMock = DataStoreMoke();
  final tMDBClientMoke = TMDBClientMoke();
  dataStoreInject.injectMock(() => dataStoreMock);
  apiInject.injectMock(() => tMDBClientMoke);

  //`profilesDataInject` is initially injected using `RM.injectStream`
  //
  //We can moke it using `injectMock`, `injectFutureMock` or `injectStreamMock`.
  //
  //As the profile functionalities are already tested we simply use a simple mock
  //with two already saved profile.
  //
  profilesDataInject.injectFutureMock(
    () => Future.value(
      ProfilesData(
        selectedId: '1',
        profiles: {
          '1': Profile(
            name: 'Profile 1',
            id: '1',
          ),
          '2': Profile(
            name: 'Profile 2',
            id: '2',
          ),
        },
      ),
    ),
  );

  when(tMDBClientMoke.nowPlayingMovies(page: 1)).thenAnswer(
    (_) async {
      await Future.delayed(Duration(seconds: 1));
      return TMDBMoviesResponse(
        page: 1,
        totalPages: 1,
        totalResults: 10,
        results: List.generate(
          10,
          (index) => TMDBMovieBasic(
            id: index,
            title: 'movie: $index',
          ),
        ),
      );
    },
  );
//
  final whiteFavoriteIcons = find.byWidgetPredicate(
    (widget) =>
        widget is Icon &&
        widget.icon == Icons.favorite &&
        widget.color == Colors.white,
  );
  final redFavoriteIcons = find.byWidgetPredicate(
    (widget) =>
        widget is Icon &&
        widget.icon == Icons.favorite &&
        widget.color == Colors.red,
  );

  final selectedProfile1 = find.byWidgetPredicate(
    (widget) =>
        widget is ProfileGridItem &&
        widget.profile.id == '1' &&
        widget.selected,
  );
  final selectedProfile2 = find.byWidgetPredicate(
    (widget) =>
        widget is ProfileGridItem &&
        widget.profile.id == '2' &&
        widget.selected,
  );
  tearDown(() {
    dataStoreMock._favouriteMovieControllers.clear();
    dataStoreMock._movies.clear();
  });
  testWidgets(
    'WHEN App starts with stored profiles and no favorite movie stored'
    'THEN it fetchs the movies and display them'
    'AND WHEN navigate to `Favourites` tap'
    'THEN no favorite poster is found'
    'AND WHEN navigate back to `Now Playing`'
    'THEN movies are displayed whithout fetching them again -movies are catched',
    (tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(NowPlayingPage), findsOneWidget);
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
      //
      //Tap to display the profiles page
      await tester.tap(find.text('Favourites'));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsOneWidget);
      expect(find.byType(PosterTile), findsNothing);
      //Tap to display the Now Playing page
      await tester.tap(find.text('Now Playing'));
      await tester.pumpAndSettle();
      expect(find.byType(NowPlayingPage), findsOneWidget);
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
      verify(tMDBClientMoke.nowPlayingMovies(page: 1)).called(1);
    },
  );

  testWidgets(
    'WHEN tapping on a white favorite icon'
    'THEN it turns to red and the movie is added to the favorite'
    'AND WHEN tapping on a red favorite icon'
    'THEN it turns to white and the movie is removed from the favorite',
    (tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(NowPlayingPage), findsOneWidget);
      //we start with no favorite movie
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
      //
      //Taping on the first white favorite icon
      await tester.tap(whiteFavoriteIcons.at(0));
      await tester.pump();
      //we have one favorite movie
      expect(whiteFavoriteIcons, findsNWidgets(5));
      expect(redFavoriteIcons, findsNWidgets(1));
      //Tap to display the profiles page
      await tester.tap(find.text('Favourites'));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsNWidgets(1));
      expect(find.byType(PosterTile), findsOneWidget);
      //
      //Tap to display the Now Playing page
      await tester.tap(find.text('Now Playing'));
      await tester.pumpAndSettle();
      //tapp on the third white favorite icon
      await tester.tap(whiteFavoriteIcons.at(2));
      await tester.pump();
      //We have two favorie movies
      expect(whiteFavoriteIcons, findsNWidgets(4));
      expect(redFavoriteIcons, findsNWidgets(2));
      //Tap to display the profiles page
      await tester.tap(find.text('Favourites'));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsOneWidget);
      expect(find.byType(PosterTile), findsNWidgets(2));
      //
      //Tap to display the Now Playing page
      await tester.tap(find.text('Now Playing'));
      await tester.pumpAndSettle();
      //tap on the second red favorite icon
      await tester.tap(redFavoriteIcons.at(1));
      await tester.pump();
      //We have one favorite movie
      expect(whiteFavoriteIcons, findsNWidgets(5));
      expect(redFavoriteIcons, findsNWidgets(1));
      //
      //Tap to display the profiles page
      await tester.tap(find.text('Favourites'));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsOneWidget);
      expect(find.byType(PosterTile), findsNWidgets(1));
    },
  );

  testWidgets(
    'WHEN profile changes'
    'THEN the favorite movies change depending on the selected profile',
    (tester) async {
      await tester.pumpWidget(MyApp());
      //The app starts with Profile 1
      await tester.pumpAndSettle();
      //we start with no favorite movie
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
      //add two movies to the favorite
      await tester.tap(whiteFavoriteIcons.at(0));
      await tester.tap(whiteFavoriteIcons.at(1));
      await tester.pump();
      expect(whiteFavoriteIcons, findsNWidgets(4));
      expect(redFavoriteIcons, findsNWidgets(2));
      //
      //Change profile
      //Tap to display the Profiles page
      await tester.tap(find.text('Profiles'));
      await tester.pumpAndSettle();
      //profile 1 is selected
      expect(selectedProfile1, findsOneWidget);
      expect(selectedProfile2, findsNothing);
      //select profile 2
      profilesDataInject.state = profilesDataInject.state.copyWith(
        selectedId: '2',
      );
      await tester.pump();
      //profile 2 is selected
      expect(selectedProfile1, findsNothing);
      expect(selectedProfile2, findsOneWidget);
      //Tap to display the Now Playing page
      await tester.tap(find.text('Now Playing'));
      await tester.pumpAndSettle();
      //with profile 2 there are no favorite movies
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
      //set one movie to be favorite
      await tester.tap(whiteFavoriteIcons.at(2));
      await tester.pump();
      //we have one favorite movie
      expect(whiteFavoriteIcons, findsNWidgets(5));
      expect(redFavoriteIcons, findsNWidgets(1));
      //Tap to display the profiles page
      await tester.tap(find.text('Favourites'));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsOneWidget);
      expect(find.byType(PosterTile), findsNWidgets(1));
      //
      //change to profile 1
      profilesDataInject.state = profilesDataInject.state.copyWith(
        selectedId: '1',
      );
      await tester.pumpAndSettle();
      //profile 1 has 2 favorite movies
      expect(find.byType(PosterTile), findsNWidgets(2));
      //
      //change back to profile 2
      profilesDataInject.state = profilesDataInject.state.copyWith(
        selectedId: '2',
      );
      await tester.pumpAndSettle();
      //profile 2 has 1 favorite movie
      expect(find.byType(PosterTile), findsNWidgets(1));
    },
  );

  testWidgets(
    'WHEN fetching  now-playing movies throws'
    'THEN display the error page'
    'AND WHEN refresh button is tapped'
    'THEN A new fetch attempt is invoked',
    (tester) async {
      //set the nowPlayingMovies to throw
      when(tMDBClientMoke.nowPlayingMovies(page: 1)).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 1));
        throw Exception('No internet connection');
      });
      await tester.pumpWidget(MyApp());
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('No internet connection'), findsOneWidget);
      expect(find.byType(FavouritesMovieGrid), findsNothing);
      //
      //Set nowPlayingMovies to not throw
      when(tMDBClientMoke.nowPlayingMovies(page: 1)).thenAnswer(
        (_) async {
          await Future.delayed(Duration(seconds: 1));
          return TMDBMoviesResponse(
            page: 1,
            totalPages: 1,
            totalResults: 10,
            results: List.generate(
              10,
              (index) => TMDBMovieBasic(
                id: index,
                title: 'movie: $index',
              ),
            ),
          );
        },
      );
      //Tap to refresh
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(whiteFavoriteIcons, findsNWidgets(6));
      expect(redFavoriteIcons, findsNWidgets(0));
    },
  );
}
