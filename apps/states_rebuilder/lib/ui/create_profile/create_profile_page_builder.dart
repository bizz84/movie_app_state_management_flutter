import 'package:core/ui/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../blocs/profiles_bloc.dart';

class CreateProfilePageBuilder extends ReactiveStatelessWidget {
  static const routeName = '/CreateProfilePageBuilder';

  const CreateProfilePageBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CreateProfilePage(
      onSubmit: profilesBloc.createProfile,
      isLoading: profilesBloc.isWaitingForProfileCreation,
      errorText: profilesBloc.profileCreationErrorText,
    );
  }
}
