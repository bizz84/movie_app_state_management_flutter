part of 'create_profile_page_builder.dart';

final _isProfileCreatedInject = RM.inject(
  () => false,
  //pop navigator after profile creation
  onSetState: On.data(() => RM.navigate.back()),
);

Future<void> _createProfile(String name) {
  return _isProfileCreatedInject.setState(
    (s) async {
      if (name.isEmpty) {
        throw Exception('Name can\'t be empty');
      }
      final nameExists =
          await dataStoreInject.state.profileExistsWithName(name);
      if (nameExists) {
        throw Exception('Name already taken');
      }

      final id = Uuid().v1();

      await dataStoreInject.state.createProfile(
        Profile(name: name, id: id),
      );
      return true;
    },
  );
}
