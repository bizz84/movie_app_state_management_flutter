import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      onError: (err, refresh) => OnErrorWidget(error: err, refresh: refresh),
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

class OnErrorWidget extends StatelessWidget {
  final dynamic error;
  final VoidCallback refresh;

  const OnErrorWidget({Key key, this.error, this.refresh}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: error is MissingPluginException
            ? Center(child: Text('Unsupported platform'))
            : ElevatedButton.icon(
                onPressed: refresh,
                icon: Icon(Icons.refresh),
                label: Text('${error.message}'),
              ),
      ),
    );
  }
}
