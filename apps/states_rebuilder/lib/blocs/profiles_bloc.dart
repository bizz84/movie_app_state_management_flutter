import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../navigator.dart';
import 'api_dependencies.dart';

/// Hold all business logic related to Profile creation, selection and fetching

@immutable
class ProfilesBloc {
  //Injected ProfilesData stream and get profilesData, selectedId, profiles
  //and appStartupState.
  late final profilesDataRMStream = RM.injectStream<ProfilesData>(
    () => apiDependencies.dataStoreRM.state.profilesData(),
  );
  ProfilesData get profilesData => profilesDataRMStream.state;

  String? get selectedId => profilesDataRMStream.state.selectedId;

  Map<String, Profile> get profiles => profilesDataRMStream.state.profiles;

  AppStartupState get appStartupState {
    if (selectedId == null || profiles.isEmpty) {
      return const AppStartupState.needsProfile();
    } else {
      return AppStartupState.profileLoaded(profilesData);
    }
  }

  // Create profile
  final _isProfileCreatedRM = RM.inject<bool>(
    () => false,
    //pop navigator after profile creation
    sideEffects: SideEffects.onData((_) => navigator.back()),
  );

  bool get isWaitingForProfileCreation => _isProfileCreatedRM.isWaiting;

  String? get profileCreationErrorText => _isProfileCreatedRM.error?.message;
  final uuidRM = RM.inject(() => const Uuid());
  Future<void> createProfile(String name) {
    return _isProfileCreatedRM.setState(
      (s) async {
        if (name.isEmpty) {
          throw Exception('Name can\'t be empty');
        }
        final nameExists =
            await apiDependencies.dataStoreRM.state.profileExistsWithName(name);
        if (nameExists) {
          throw Exception('Name already taken');
        }

        final id = uuidRM.state.v1();

        await apiDependencies.dataStoreRM.state.createProfile(
          Profile(name: name, id: id),
        );
        return true;
      },
    );
  }

  // Select profile
  Future<void> setSelectedProfile(Profile profile) {
    return apiDependencies.dataStoreRM.state.setSelectedProfile(profile);
  }
}

final profilesBloc = ProfilesBloc();
