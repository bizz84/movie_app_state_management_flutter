import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_model.dart';

final dataStoreProvider =
    Provider<DataStore>((ref) => throw UnimplementedError());

final appStartupModelProvider =
    StateNotifierProvider<AppStartupModel, AppStartupState>((ref) {
  final dataStore = ref.watch(dataStoreProvider);
  return AppStartupModel(dataStore: dataStore);
});

final profilesDataProvider = Provider<ProfilesData>((ref) {
  final state = ref.watch(appStartupModelProvider);
  return state.when(
      initializing: () => ProfilesData(),
      needsProfile: () => ProfilesData(),
      profileLoaded: (profilesData) => profilesData);
});
