import 'dart:async';

import 'package:core/persistence/data_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/models/app_state/app_startup_state.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupCubit({@required this.dataStore})
      : super(const AppStartupState.initializing()) {
    init();
  }
  final DataStore dataStore;
  StreamSubscription _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  void init() {
    _subscription = dataStore.profilesData().listen((profilesData) {
      if (profilesData.selectedId == null || profilesData.profiles.isEmpty) {
        emit(const AppStartupState.needsProfile());
      } else {
        emit(AppStartupState.profileLoaded(profilesData));
      }
    });
  }

  // @override
  // void onChange(Change<AppStartupState> change) {
  //   print(change.nextState);
  //   super.onChange(change);
  // }
}
