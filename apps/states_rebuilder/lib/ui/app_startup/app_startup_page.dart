import 'package:core/ui/home_navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/profiles_bloc.dart';
import '../favourites/favourites_page.dart';
import '../now_playing/now_playing_page.dart';
import '../profile_selection/profile_selection_page.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends ReactiveStatelessWidget {
  static const routeName = '/';

  const AppStartupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return profilesBloc.profilesDataRMStream.onAll(
      onWaiting: () => const Center(child: CircularProgressIndicator()),
      onError: (dynamic err, refresh) => Center(child: Text('$err')),
      onData: (_) {
        return profilesBloc.appStartupState.maybeWhen<Widget>(
          needsProfile: () => const ProfileSelectionPage(),
          orElse: () => HomeNavigationBuilder(
            builder: (context, tabItem) {
              if (tabItem == TabItem.nowPlaying) {
                return const NowPlayingPage();
              } else if (tabItem == TabItem.favourites) {
                return const FavouritesPage();
              } else {
                return const ProfileSelectionPage();
              }
            },
          ),
        );
      },
    );
  }
}
