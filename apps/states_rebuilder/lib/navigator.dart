import 'package:states_rebuilder/states_rebuilder.dart';

import 'ui/app_startup/app_startup_page.dart';
import 'ui/create_profile/create_profile_page_builder.dart';

final navigator = RM.injectNavigator(
  routes: {
    AppStartupPage.routeName: (_) => const AppStartupPage(), // home page
    CreateProfilePageBuilder.routeName: (_) => const CreateProfilePageBuilder(),
  },
);
