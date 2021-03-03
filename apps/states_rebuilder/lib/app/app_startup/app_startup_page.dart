import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/ui/home_navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../main_injected.dart';
import '../favourites/favourites_page.dart';
import '../now_playing/now_playing_page.dart';
import '../profile_selection/profile_selection_page.dart';

part 'app_startup_inject.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return On.or(
      onWaiting: () => const Center(child: CircularProgressIndicator()),
      onError: (err, refresh) => Center(child: Text('$err')),
      or: () {
        return _appStartUpInject.state.maybeWhen<Widget>(
          needsProfile: () => ProfileSelectionPage(),
          orElse: () => HomeNavigationBuilder(
            builder: (context, tabItem) {
              if (tabItem == TabItem.nowPlaying) {
                return NowPlayingPage();
              } else if (tabItem == TabItem.favourites) {
                return FavouritesPage();
              } else {
                return ProfileSelectionPage();
              }
            },
          ),
        );
      },
    ).listenTo(profilesDataInject);
  }
}
