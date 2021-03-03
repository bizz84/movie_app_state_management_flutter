import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'app/app_startup/app_startup_page.dart';
import 'app/create_profile/create_profile_page_builder.dart';
import 'main_injected.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopAppWidget(
      // Initialize plugins
      waiteFor: () => [dataStoreInject.stateAsync],
      onWaiting: () => SplashScreen(),
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        navigatorKey: RM.navigate.navigatorKey,
        onGenerateRoute: RM.navigate.onGenerateRoute({
          AppStartupPage.routeName: (_) => AppStartupPage(), // home page
          CreateProfilePageBuilder.routeName: (_) => CreateProfilePageBuilder(),
        }),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
