import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/add_profile_button.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:core/ui/profile_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_demo_flutter/ui/now_playing/now_playing_page.dart';
import 'package:movie_app_demo_flutter/ui/profile_selection/profile_selection_page.dart';
import 'package:movie_app_demo_flutter/blocs/api_dependencies.dart';
import 'package:movie_app_demo_flutter/blocs/profiles_bloc.dart';
import 'package:movie_app_demo_flutter/main.dart';

class DataStoreMock extends Mock implements DataStore {}

class TMDBClientMock extends Mock implements TMDBClient {}

void main() {
  //Instantiate and inject mocks
  final dataStoreMock = DataStoreMock();
  final tMDBClientMock = TMDBClientMock();
  setUp(
    () {
      //set injectMock inside the setUp method.
      apiDependencies
        ..dataStoreRM.injectMock(() => dataStoreMock)
        ..apiRM.injectMock(() => tMDBClientMock);

      //profilesDataInject is initially injected using RM.injectStream
      //
      //We can moke it using injectMock, injectFutureMock or injectStreamMock.
      //
      //Here we mock it with a injectFutureMock to simulate the waiting and the first
      //data emission of the stream.
      //
      //later in the test we can emit a new data
      //
      //this mock emits ProfilesData with no stored profile.
      profilesBloc.profilesDataRMStream.injectFutureMock(
        () => Future.delayed(
          const Duration(seconds: 1),
          () => ProfilesData(
            selectedId: null,
            profiles: {},
          ),
        ),
      );
      registerFallbackValue(Profile(id: '', name: ''));
    },
  );
  testWidgets(
    'WHEN the app first starts with not stored profile'
    'THEN display CircularProgressIndicator while getting the stored profiles'
    'THEN display ProfileSelectionPage',
    (tester) async {
      // Override the dateStoreRM state so that to wait for one second to
      // initialize (we want to see a splash screen)
      // This override is only used for this test
      apiDependencies.dataStoreRM.injectFutureMock(() async {
        // await for initialization
        await Future.delayed(const Duration(seconds: 1));
        return dataStoreMock;
      });

      await tester.pumpWidget(const MyApp());
      await tester.pump();
      //Display splashScreen for 1 seconds
      expect(find.text('Splash screen ...'), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      //Display CircularProgressIndicator for 1 seconds
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      //We are in the ProfileSelectionPage
      expect(find.byType(ProfileSelectionPage), findsOneWidget);
      //one AddProfileButton to add profile
      expect(find.byType(AddProfileButton), findsOneWidget);
      //No ProfileGridItem
      expect(find.byType(ProfileGridItem), findsNothing);
    },
  );

  testWidgets(
    'WHEN save a profile with empty name'
    'THEN the error message "Name cant be empty" is displayed',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //
      await tester.tap(find.byType(AddProfileButton));
      await tester.pumpAndSettle();
      expect(find.byType(CreateProfilePage), findsOneWidget);
      //
      await tester.tap(find.text('Save'));
      await tester.pump();
      expect(find.text("Name can't be empty"), findsOneWidget);
    },
  );

  testWidgets(
    'WHEN save a profile with name already used'
    'THEN the error message "Name already taken" is displayed',
    (tester) async {
      //
      when(() => dataStoreMock.profileExistsWithName('profile1')).thenAnswer(
        (_) => Future.value(true),
      );
      //
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //
      await tester.tap(find.byType(AddProfileButton));
      await tester.pumpAndSettle();
      expect(find.byType(CreateProfilePage), findsOneWidget);
      //
      await tester.enterText(find.byType(TextField), 'profile1');
      await tester.tap(find.text('Save'));
      await tester.pump();
      expect(find.text('Name already taken'), findsOneWidget);
    },
  );

  testWidgets(
    'WHEN app first starts with no stored profile'
    'AND WHEN a valid profile name is entered'
    'THEN Navigate back to the NowPlayingPage and invoke nowPlayingMovies(page: 1)'
    'AND a ProfileGridItem is added in the profile page',
    (tester) async {
      //Set up responses
      when(() => dataStoreMock.profileExistsWithName('Profile 1')).thenAnswer(
        (_) => Future.value(false),
      );
      //`createProfile` should create a profile and sinks the new `ProfilesData`
      //in the stream.
      //
      //The stream is listened to by `profilesDataInject`
      //
      //We stub the answer to update the state of the `profilesDataInject`
      when(() => dataStoreMock.createProfile(any())).thenAnswer(
        (_) => Future(
          () => profilesBloc.profilesDataRMStream.state = ProfilesData(
            selectedId: '1',
            profiles: {
              '1': Profile(
                name: 'Profile 1',
                id: '',
              ),
            },
          ),
        ),
      );

      when(() => tMDBClientMock.nowPlayingMovies(page: 1)).thenAnswer(
        (_) async {
          return TMDBMoviesResponse(
            page: 1,
            totalPages: 1,
            totalResults: 0,
            results: [],
          );
        },
      );

      //
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.byType(ProfileSelectionPage), findsOneWidget);
      //
      await tester.tap(find.byType(AddProfileButton));
      await tester.pumpAndSettle();
      expect(find.byType(CreateProfilePage), findsOneWidget);
      //
      //Make user nowPlayingMovies is never called
      verifyNever(() => tMDBClientMock.nowPlayingMovies(page: 1));
      await tester.enterText(find.byType(TextField), 'Profile 1');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      //We are in the NowPlayingPage
      expect(find.byType(NowPlayingPage), findsOneWidget);
      verify(() => tMDBClientMock.nowPlayingMovies(page: 1)).called(1);
      //
      //Tap to display the profiles page
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      expect(find.byType(AddProfileButton), findsOneWidget);
      //Indeed the entred profile is added
      expect(find.byType(ProfileGridItem), findsOneWidget);
      expect(find.text('Profile 1'), findsOneWidget);
    },
  );

  testWidgets(
    'WHEN app starts with an already stored profile'
    'THEN start in NowPlayingPage and invoke nowPlayingMovies(page: 1)',
    (tester) async {
      //Override the moke of `profilesDataInject` to first emit a `ProfilesData` with
      //one stored profile
      profilesBloc.profilesDataRMStream.injectFutureMock(
        () => Future.delayed(
          const Duration(seconds: 1),
          () => ProfilesData(
            selectedId: '1',
            profiles: {
              '1': Profile(
                name: 'Stored profile',
                id: '',
              ),
            },
          ),
        ),
      );

      await tester.pumpWidget(const MyApp());
      await tester.pump();
      //Display CircularProgressIndicator for 1 seconds
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      //NowPlayingPage is displayed
      expect(find.byType(NowPlayingPage), findsOneWidget);
      verify(() => tMDBClientMock.nowPlayingMovies(page: 1)).called(1);
      //
      ////Tap to display the profiles page
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      expect(find.byType(AddProfileButton), findsOneWidget);
      //Indeed the entred profile is displeyed
      expect(find.byType(ProfileGridItem), findsOneWidget);
      expect(find.text('Stored profile'), findsOneWidget);
    },
  );
}
