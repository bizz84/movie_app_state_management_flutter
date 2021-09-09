import 'package:core/persistence/data_store.dart';
import 'package:core/persistence/sembast_data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_demo_flutter/app/app_startup/app_startup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize data store
  final dataStore = await SembastDataStore.makeDefault();
  runApp(RepositoryProvider<DataStore>(
    create: (_) => dataStore,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AppStartupPage.create(context),
    );
  }
}
