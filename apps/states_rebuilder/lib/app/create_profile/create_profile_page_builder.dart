import 'package:core/models/app_models/profile.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../main_injected.dart';

part 'create_profile_inject.dart';

class CreateProfilePageBuilder extends StatelessWidget {
  static const routeName = '/CreateProfilePageBuilder';
  @override
  Widget build(BuildContext context) {
    return On(
      () => CreateProfilePage(
        onSubmit: _createProfile,
        isLoading: _isProfileCreatedInject.isWaiting,
        errorText: _isProfileCreatedInject.error?.message,
      ),
    ).listenTo(_isProfileCreatedInject);
  }
}
