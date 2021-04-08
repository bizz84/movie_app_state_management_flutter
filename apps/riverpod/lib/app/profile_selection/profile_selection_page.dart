import 'package:core/ui/profiles_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_page_builder.dart';
import 'package:movie_app_demo_flutter/top_level_providers.dart';

class ProfileSelectionPage extends ConsumerWidget {
  Future<void> addProfile(BuildContext context) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => CreateProfilePageBuilder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final profilesData = watch(profilesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile selection'),
      ),
      body: profilesData != null
          ? ProfilesGrid(
              profilesData: profilesData,
              onAddProfile: () => addProfile(context),
              onSelectedProfile: (profile) async {
                final dataStore = context.read(dataStoreProvider);
                // the selected profile is an app-state variable.
                // changing this will cause a reload of AppStartupPage
                await dataStore.setSelectedProfile(profile);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
