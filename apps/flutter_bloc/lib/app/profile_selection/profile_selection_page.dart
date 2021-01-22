import 'package:core/ui/profiles_grid.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_page_builder.dart';

class ProfileSelectionPage extends StatelessWidget {
  Future<void> addProfile(BuildContext context) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => CreateProfilePageBuilder.create(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profilesData = RepositoryProvider.of<ProfilesData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile selection'),
      ),
      body: ProfilesGrid(
        profilesData: profilesData,
        onAddProfile: () => addProfile(context),
        onSelectedProfile: (profile) async {
          final dataStore = RepositoryProvider.of<DataStore>(context);
          // the selected profile is an app-state variable.
          // changing this will cause a reload of AppStartupPage
          await dataStore.setSelectedProfile(profile);
        },
      ),
    );
  }
}
