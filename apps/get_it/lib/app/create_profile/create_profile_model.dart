import 'package:core/models/app_models/profile.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class CreateProfileModel extends ValueNotifier<CreateProfileState> {
  CreateProfileModel({required this.dataStore})
      : super(CreateProfileState.noError());
  final DataStore dataStore;

  Future<bool> createProfile(String name) async {
    if (name.isEmpty) {
      value = CreateProfileState.error('Name can\'t be empty');
      return false;
    }
    final nameExists = await dataStore.profileExistsWithName(name);
    if (nameExists) {
      value = CreateProfileState.error('Name already taken');
      return false;
    }
    final id = Uuid().v1();
    value = CreateProfileState.loading();
    try {
      await dataStore.createProfile(Profile(name: name, id: id));
      value = CreateProfileState.noError();
    } catch (e) {
      value = CreateProfileState.error(e.toString());
    }
    return true;
  }
}
