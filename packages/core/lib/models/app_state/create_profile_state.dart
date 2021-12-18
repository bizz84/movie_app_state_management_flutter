import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_profile_state.freezed.dart';

@freezed
class CreateProfileState with _$CreateProfileState {
  const factory CreateProfileState.noError() = _NoError;
  const factory CreateProfileState.error(String errorText) = _Error;
  const factory CreateProfileState.loading() = _Loading;
}
