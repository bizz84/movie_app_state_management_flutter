import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'blocs/api_dependencies.dart';
import 'navigator.dart';

void main() => runApp(const MyApp());

// "ui" folder holds the UI part. NO business logic
// "blocs" folder holds all the business logic. All bloc class are immutable.
// All app functionalities are tested.
class MyApp extends TopStatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  List<Future<void>>? ensureInitialization() {
    return [apiDependencies.initializeDataSore()];
  }

  @override
  Widget? splashScreen() {
    return const SplashScreen();
  }

  @override
  Widget? errorScreen(error, VoidCallback refresh) {
    return OnErrorWidget(
      error: error,
      refresh: refresh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routeInformationParser: navigator.routeInformationParser,
      routerDelegate: navigator.routerDelegate,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text('Splash screen ...'),
        ),
      ),
    );
  }
}

class OnErrorWidget extends StatelessWidget {
  final dynamic error;
  final VoidCallback refresh;

  const OnErrorWidget({
    Key? key,
    this.error,
    required this.refresh,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: error is MissingPluginException
            ? const Center(child: Text('Unsupported platform'))
            : ElevatedButton.icon(
                onPressed: refresh,
                icon: const Icon(Icons.refresh),
                label: Text('${error.message}'),
              ),
      ),
    );
  }
}
