import 'dart:async';

import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter/foundation.dart';

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
        // TODO: Should we register profilesData as a singleton?
      } else {
        value = AppStartupState.profileLoaded(profilesData);
      }
    });
  }
}
