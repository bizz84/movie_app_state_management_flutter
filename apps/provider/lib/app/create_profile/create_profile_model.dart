import 'package:core/models/app_models/profile.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:uuid/uuid.dart';
import 'package:state_notifier/state_notifier.dart';

class CreateProfileModel extends StateNotifier<CreateProfileState> {
  CreateProfileModel({required this.dataStore})
      : super(const CreateProfileState.noError());
  final DataStore dataStore;

  Future<bool> createProfile(String name) async {
    if (name.isEmpty) {
      state = const CreateProfileState.error('Name can\'t be empty');
      return false;
    }
    final nameExists = await dataStore.profileExistsWithName(name);
    if (nameExists) {
      state = const CreateProfileState.error('Name already taken');
      return false;
    }
    final id = const Uuid().v1();
    state = const CreateProfileState.loading();
    try {
      await dataStore.createProfile(Profile(name: name, id: id));
      state = const CreateProfileState.noError();
    } catch (e) {
      state = CreateProfileState.error(e.toString());
    }
    return true;
  }
}
