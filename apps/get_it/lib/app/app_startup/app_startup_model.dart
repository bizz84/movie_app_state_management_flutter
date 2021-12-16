import 'dart:async';

import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app_demo_flutter/service_locator.dart';

class AppStartupModel extends ValueNotifier<AppStartupState> {
  AppStartupModel({required this.dataStore})
      : super(const AppStartupState.initializing()) {
    init();
  }
  final DataStore dataStore;
  late StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void init() {
    _subscription = dataStore.profilesData().listen((profilesData) {
      if (profilesData.selectedId == null || profilesData.profiles.isEmpty) {
        value = AppStartupState.needsProfile();
      } else {
        value = AppStartupState.profileLoaded(profilesData);
      }
      // TODO: Is this the correct way of registering values that can change?
      // if (getIt.isRegistered<ProfilesData>()) {
      //   getIt.resetLazySingleton<ProfilesData>(instance: profilesData);
      // } else {
      //   getIt.registerSingleton<ProfilesData>(profilesData);
      // }
    });
  }
}
