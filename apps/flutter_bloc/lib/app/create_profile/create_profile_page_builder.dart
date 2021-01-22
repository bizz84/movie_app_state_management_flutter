import 'package:core/persistence/data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:movie_app_demo_flutter/app/create_profile/create_profile_cubit.dart';

class CreateProfilePageBuilder extends StatelessWidget {
  static Widget create(BuildContext context) {
    final dataStore = RepositoryProvider.of<DataStore>(context);
    return BlocProvider<CreateProfileCubit>(
      create: (_) => CreateProfileCubit(dataStore: dataStore),
      child: CreateProfilePageBuilder(),
    );
  }

  Future<void> createProfile(BuildContext context, String name) async {
    final cubit = BlocProvider.of<CreateProfileCubit>(context);
    final success = await cubit.createProfile(name);
    if (success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileCubit, CreateProfileState>(
        builder: (context, state) {
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
    });
  }
}
