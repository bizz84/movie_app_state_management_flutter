import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/profiles_grid.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_page_builder.dart';

class ProfileSelectionPage extends StatelessWidget with GetItMixin {
  Future<void> addProfile(BuildContext context) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => CreateProfilePageBuilder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataStore = get<DataStore>();
    final profilesData = dataStore.profilesData();
    return StreamBuilder<ProfilesData>(
      stream: profilesData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final profilesData = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile selection'),
            ),
            body: ProfilesGrid(
              profilesData: profilesData,
              onAddProfile: () => addProfile(context),
              onSelectedProfile: (profile) async {
                final dataStore = get<DataStore>();
                // the selected profile is an app-state variable.
                // changing this will cause a reload of AppStartupPage
                await dataStore.setSelectedProfile(profile);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
