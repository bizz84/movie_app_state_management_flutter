import 'package:core/models/app_state/create_profile_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_model.dart';
import 'package:provider/provider.dart';

class CreateProfilePageBuilder extends StatelessWidget {
  static Widget create(BuildContext context) {
    final dataStore = Provider.of<DataStore>(context, listen: false);
    return StateNotifierProvider<CreateProfileModel, CreateProfileState>(
      create: (_) => CreateProfileModel(dataStore: dataStore),
      child: CreateProfilePageBuilder(),
    );
  }

  Future<void> createProfile(BuildContext context, String name) async {
    final model = context.read<CreateProfileModel>();
    final success = await model.createProfile(name);
    if (success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateProfileState>();
    return CreateProfilePage(
      onSubmit: (name) => createProfile(context, name),
      isLoading: state.maybeWhen(
        loading: () => true,
        orElse: () => false,
      ),
      errorText: state.maybeWhen(
        error: (error) => error,
        orElse: () => null,
      ),
    );
  }
}
