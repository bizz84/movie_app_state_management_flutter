import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/ui/home_navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_model.dart';
import 'package:movie_app_demo_flutter/app/favourites/favourites_page.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_page.dart';
import 'package:movie_app_demo_flutter/app/profile_selection/profile_selection_page.dart';
import 'package:provider/provider.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    final dataStore = Provider.of<DataStore>(context, listen: false);
    return StateNotifierProvider<AppStartupModel, AppStartupState>(
      create: (_) => AppStartupModel(dataStore: dataStore),
      child: AppStartupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppStartupState>();
    return state.when(
      initializing: () => const Center(child: CircularProgressIndicator()),
      needsProfile: () => Provider.value(
        value: ProfilesData(), // empty
        child: ProfileSelectionPage(),
      ),
      profileLoaded: (profilesData) => Provider.value(
        value: profilesData,
        child: HomeNavigationBuilder(
          builder: (context, tabItem) {
            if (tabItem == TabItem.nowPlaying) {
              return NowPlayingPage.create(context);
            } else if (tabItem == TabItem.favourites) {
              return FavouritesPage();
            } else {
              return ProfileSelectionPage();
            }
          },
        ),
      ),
    );
  }
}
