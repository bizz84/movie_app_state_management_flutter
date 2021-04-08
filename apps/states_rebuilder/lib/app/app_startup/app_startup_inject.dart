part of 'app_startup_page.dart';

final profilesDataInject = RM.injectStream<ProfilesData>(
  () => dataStoreInject.state.profilesData(),
  onData: (profilesData) {
    if (profilesData.selectedId == null || profilesData.profiles.isEmpty) {
      _appStartUpInject.state = const AppStartupState.needsProfile();
    } else {
      _appStartUpInject.state = AppStartupState.profileLoaded(profilesData);
    }
  },
);

final _appStartUpInject = RM.inject(() => AppStartupState.needsProfile());
