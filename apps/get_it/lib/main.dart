import 'package:core/api/tmdb_api.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/persistence/sembast_data_store.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_model.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_page.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_model.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_model.dart';
import 'package:movie_app_demo_flutter/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize data store
  final dataStore = await SembastDataStore.makeDefault();
  getIt.registerSingleton<DataStore>(dataStore);
  getIt.registerLazySingleton<AppStartupModel>(
      () => AppStartupModel(dataStore: dataStore));
  getIt.registerLazySingleton<CreateProfileModel>(
      () => CreateProfileModel(dataStore: dataStore));
  getIt.registerLazySingleton<NowPlayingModel>(
      () => NowPlayingModel(api: TMDBClient.platform()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AppStartupPage(),
    );
  }
}
