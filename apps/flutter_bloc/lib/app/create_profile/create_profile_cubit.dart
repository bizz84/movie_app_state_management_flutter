import 'package:core/models/app_models/profile.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:uuid/uuid.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit({required this.dataStore})
      : super(const CreateProfileState.noError());
  final DataStore dataStore;

  Future<bool> createProfile(String name) async {
    if (name.isEmpty) {
      emit(const CreateProfileState.error('Name can\'t be empty'));
      return false;
    }
    final nameExists = await dataStore.profileExistsWithName(name);
    if (nameExists) {
      emit(const CreateProfileState.error('Name already taken'));
      return false;
    }
    final id = const Uuid().v1();
    emit(const CreateProfileState.loading());
    try {
      await dataStore.createProfile(Profile(name: name, id: id));
      emit(const CreateProfileState.noError());
    } catch (e) {
      emit(CreateProfileState.error(e.toString()));
    }
    return true;
  }
}
