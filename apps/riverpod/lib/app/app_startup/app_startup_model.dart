import 'dart:async';

import 'package:core/persistence/data_store.dart';
import 'package:flutter/foundation.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupModel extends StateNotifier<AppStartupState> {
  AppStartupModel({@required this.dataStore})
      : super(const AppStartupState.initializing()) {
    init();
  }
  final DataStore dataStore;
  StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void init() {
    _subscription = dataStore.profilesData().listen((profilesData) {
      if (profilesData.selectedId == null || profilesData.profiles.isEmpty) {
        state = AppStartupState.needsProfile();
      } else {
        state = AppStartupState.profileLoaded(profilesData);
      }
    });
  }
}
