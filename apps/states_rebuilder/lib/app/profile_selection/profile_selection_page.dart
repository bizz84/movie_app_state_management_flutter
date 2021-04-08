import 'package:core/ui/profiles_grid.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../main_injected.dart';
import '../app_startup/app_startup_page.dart';
import '../create_profile/create_profile_page_builder.dart';

class ProfileSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile selection'),
      ),
      body: ProfilesGrid(
        profilesData: profilesDataInject.state,
        onAddProfile: () => RM.navigate.toNamed(
          CreateProfilePageBuilder.routeName,
          fullscreenDialog: true,
        ),
        onSelectedProfile: (profile) async {
          // the selected profile is an app-state variable.
          // changing this will cause a reload of AppStartupPage
          await dataStoreInject.state.setSelectedProfile(profile);
        },
      ),
    );
  }
}
