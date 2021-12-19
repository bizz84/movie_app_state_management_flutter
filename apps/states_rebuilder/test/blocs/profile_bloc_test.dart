import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_demo_flutter/blocs/api_dependencies.dart';
import 'package:movie_app_demo_flutter/blocs/profiles_bloc.dart';
import 'package:movie_app_demo_flutter/navigator.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

class DataStoreMock extends Mock implements DataStore {}

class UuidMock extends Mock implements Uuid {}

class NavigatorMock extends Mock implements InjectedNavigator {
  // @override
  // void back<T extends Object>([T? result]) {
  //   print('');
  // }
}

void main() {
  final dataStoreMock = DataStoreMock();
  final uuidMock = UuidMock();
  final navigatorMock = NavigatorMock();
  setUp(() {
    apiDependencies.dataStoreRM.injectMock(() => dataStoreMock);
    profilesBloc.uuidRM.injectMock(() => uuidMock);
    navigator.injectMock(navigatorMock);
  });
  group(
    'Test ProfilesBloc.appStartupState method',
    () {
      testWidgets(
        'WHEN There is no selected profile (selectedId == null)'
        'THEN return AppStartupState.needsProfile'
        'EVEN IF profiles is not empty',
        (tester) async {
          // We mock the profileDataRMStream to hold a profile with null selectedId
          profilesBloc.profilesDataRMStream.injectMock(
            () => ProfilesData(
              selectedId: null,
              profiles: {'profile1': Profile(id: '1', name: 'profile1')},
            ),
          );

          expect(
            profilesBloc.appStartupState,
            const AppStartupState.needsProfile(),
          );
        },
      );
      testWidgets(
        'WHEN There are no stored profiles'
        'THEN return AppStartupState.needsProfile'
        'EVEN IF the selectedId is not null',
        (tester) async {
          // We mock the profileDataRMStream to hold a profile with null selectedId
          profilesBloc.profilesDataRMStream.injectMock(
            () => ProfilesData(
              selectedId: '1',
              profiles: {},
            ),
          );
          expect(
            profilesBloc.appStartupState,
            const AppStartupState.needsProfile(),
          );
        },
      );

      testWidgets(
        'WHEN There is a valid stored profile with non null selectedId'
        'THEN return AppStartupState.profileLoaded',
        (tester) async {
          // We mock the profileDataRMStream to hold a profile with null selectedId
          profilesBloc.profilesDataRMStream.injectMock(
            () => ProfilesData(
              selectedId: '1',
              profiles: {'profile1': Profile(id: '1', name: 'profile1')},
            ),
          );
          expect(
            profilesBloc.appStartupState,
            AppStartupState.profileLoaded(
              ProfilesData(
                profiles: {'profile1': Profile(id: '1', name: 'profile1')},
                selectedId: '1',
              ),
            ),
          );
        },
      );
    },
  );

  group('Test ProfilesBloc.createProfile method', () {
    testWidgets(
      'WHEN creating a new profile with empty name'
      'THEN return Name can\t be empty error message',
      (tester) async {
        profilesBloc.createProfile('');
        await tester.pump();
        expect(profilesBloc.profileCreationErrorText, 'Name can\'t be empty');
      },
    );
    testWidgets(
      'WHEN creating a profile with an already existed name'
      'THEN return Name already taken error message',
      (tester) async {
        when(() => dataStoreMock.profileExistsWithName('profile1')).thenAnswer(
          (_) => Future.value(true),
        );
        profilesBloc.createProfile('profile1');
        await tester.pump();
        expect(profilesBloc.profileCreationErrorText, 'Name already taken');
      },
    );

    testWidgets(
      'WHEN creating a profile with a valid name'
      'THEN the profile is created'
      'AND the navigator navigate back after profile creation',
      (tester) async {
        when(() => uuidMock.v1()).thenAnswer(
          (_) => 'Generated Id',
        );
        when(() => dataStoreMock.profileExistsWithName('profile1')).thenAnswer(
          (_) => Future.value(false),
        );
        when(
          () => dataStoreMock.createProfile(
            Profile(
              id: 'Generated Id',
              name: 'profile1',
            ),
          ),
        ).thenAnswer(
          (_) => Future.value(),
        );
        profilesBloc.createProfile('profile1');
        await tester.pump();
        verify(
          () => dataStoreMock.createProfile(
            Profile(
              id: 'Generated Id',
              name: 'profile1',
            ),
          ),
        ).called(1);
        // Check the navigator stack is popped
        verify(
          () => navigatorMock.back(),
        ).called(1);
      },
    );
  });

  group(
    'Test ProfilesBloc.setSelectedProfile method',
    () {
      testWidgets(
        'WHEN setSelectedProfile is called'
        'THEN the profile is set',
        (tester) async {
          when(
            () => dataStoreMock.setSelectedProfile(
              Profile(
                id: 'Generated Id',
                name: 'profile1',
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(),
          );

          profilesBloc.setSelectedProfile(
            Profile(
              id: 'Generated Id',
              name: 'profile1',
            ),
          );
          await tester.pump();
          verify(
            () => dataStoreMock.setSelectedProfile(
              Profile(
                id: 'Generated Id',
                name: 'profile1',
              ),
            ),
          ).called(1);
        },
      );
    },
  );
}
