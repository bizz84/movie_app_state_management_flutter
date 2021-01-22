import 'package:flutter/material.dart';
import 'package:core/ui/home_navigation_builder.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_demo_flutter/app/favourites/favourites_page.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_page.dart';
import 'package:movie_app_demo_flutter/app/profile_selection/profile_selection_page.dart';
import 'package:movie_app_demo_flutter/top_level_providers.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(appStartupModelProvider.state);
    return state.when(
      initializing: () => const Center(child: CircularProgressIndicator()),
      needsProfile: () => ProfileSelectionPage(),
      profileLoaded: (profilesData) => HomeNavigationBuilder(
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
  }
}
