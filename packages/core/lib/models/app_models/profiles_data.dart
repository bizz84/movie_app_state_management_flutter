import 'dart:convert';

import 'package:collection/collection.dart';
import 'profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfilesData {
  final Map<String, Profile> profiles;

  /// id of the currently selected profile
  final String? selectedId;
  ProfilesData({
    this.profiles = const {},
    this.selectedId,
  });

  List<Profile> sortedByName() {
    final sorted = profiles.values.toList();
    sorted.sort((lhs, rhs) => lhs.name.compareTo(rhs.name));
    return sorted;
  }

  factory ProfilesData.fromMap(Map<String, dynamic> map) {
    if (map['profiles'] == null) return ProfilesData();

    final profilesMap = map['profiles'] as Map<String, dynamic>;
    final profiles = profilesMap.map((key, value) => MapEntry<String, Profile>(
          key,
          Profile.fromJson(value),
        ));
    return ProfilesData(
      profiles: profiles,
      selectedId: map['selectedId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfilesData.fromJson(String? source) => source != null
      ? ProfilesData.fromMap(json.decode(source))
      : ProfilesData();

  @override
  String toString() =>
      'ProfilesData(profiles: $profiles, selectedId: $selectedId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return o is ProfilesData &&
        mapEquals(o.profiles, profiles) &&
        o.selectedId == selectedId;
  }

  @override
  int get hashCode => profiles.hashCode ^ selectedId.hashCode;

  ProfilesData copyWith({
    Map<String, Profile>? profiles,
    String? selectedId,
  }) {
    return ProfilesData(
      profiles: profiles ?? this.profiles,
      selectedId: selectedId ?? this.selectedId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profiles': profiles,
      'selectedId': selectedId,
    };
  }
}
