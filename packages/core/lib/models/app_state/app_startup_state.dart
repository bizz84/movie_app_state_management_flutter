import 'package:freezed_annotation/freezed_annotation.dart';
import '../app_models/profiles_data.dart';

part 'app_startup_state.freezed.dart';

@freezed
abstract class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initializing() = _Initializing;
  const factory AppStartupState.needsProfile() = _NeedsProfile;
  const factory AppStartupState.profileLoaded(ProfilesData profilesData) =
      _ProfileLoaded;
}
