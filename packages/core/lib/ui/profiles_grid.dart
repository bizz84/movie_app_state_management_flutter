import '../models/app_models/profiles_data.dart';
import '../models/app_models/profile.dart';
import 'add_profile_button.dart';
import 'profile_grid_item.dart';
import 'package:flutter/material.dart';

class ProfilesGrid extends StatelessWidget {
  const ProfilesGrid(
      {Key? key,
      required this.profilesData,
      this.onSelectedProfile,
      this.onAddProfile})
      : super(key: key);
  final ProfilesData profilesData;
  final ValueChanged<Profile>? onSelectedProfile;
  final VoidCallback? onAddProfile;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final profiles = profilesData.sortedByName();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (screenSize.width - 32.0) / 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: profiles.length + 1,
        itemBuilder: (context, index) {
          if (index < profiles.length) {
            final profile = profiles[index];
            return ProfileGridItem(
              profile: profile,
              selected: profilesData.selectedId == profile.id,
              onPressed: () => onSelectedProfile?.call(profile),
            );
          }
          return AddProfileButton(
            onPressed: onAddProfile,
          );
        },
      ),
    );
  }
}
