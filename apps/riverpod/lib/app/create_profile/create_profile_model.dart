import 'package:core/models/app_models/profile.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class CreateProfileModel extends StateNotifier<CreateProfileState> {
  CreateProfileModel({required this.dataStore})
      : super(const CreateProfileState.noError());
  final DataStore dataStore;

  Future<bool> createProfile(String name) async {
    if (name.isEmpty) {
      state = CreateProfileState.error('Name can\'t be empty');
      return false;
    }
    final nameExists = await dataStore.profileExistsWithName(name);
    if (nameExists) {
      state = CreateProfileState.error('Name already taken');
      return false;
    }
    final id = Uuid().v1();
    state = CreateProfileState.loading();
    try {
      await dataStore.createProfile(Profile(name: name, id: id));
      state = CreateProfileState.noError();
    } catch (e) {
      state = CreateProfileState.error(e.toString());
    }
    return true;
  }
}
