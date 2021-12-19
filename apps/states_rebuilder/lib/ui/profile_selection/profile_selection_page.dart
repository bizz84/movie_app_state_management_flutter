import 'package:core/ui/profiles_grid.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/profiles_bloc.dart';
import '../../navigator.dart';
import '../create_profile/create_profile_page_builder.dart';

class ProfileSelectionPage extends ReactiveStatelessWidget {
  const ProfileSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile selection'),
      ),
      body: ProfilesGrid(
        profilesData: profilesBloc.profilesData,
        onAddProfile: () => navigator.to(
          CreateProfilePageBuilder.routeName,
          fullscreenDialog: true,
        ),
        // the selected profile is an app-state variable.
        // changing this will cause a reload of AppStartupPage
        onSelectedProfile: profilesBloc.setSelectedProfile,
      ),
    );
  }
}
