import 'package:core/models/app_state/create_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_model.dart';

class CreateProfilePageBuilder extends StatelessWidget with GetItMixin {
  Future<void> createProfile(BuildContext context, String name) async {
    final model = get<CreateProfileModel>();
    final success = await model.createProfile(name);
    if (success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = watch<CreateProfileModel, CreateProfileState>();
    return CreateProfilePage(
      onSubmit: (name) => createProfile(context, name),
      isLoading: state.maybeWhen(
        loading: () => true,
        orElse: () => false,
      ),
      errorText: state.maybeWhen(
        error: (error) => error,
        orElse: () => null,
      ),
    );
  }
}
