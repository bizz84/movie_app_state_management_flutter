// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'profile.freezed.dart';

// @freezed
// abstract class Profile with _$Profile {
//   const factory Profile(String name, String id) = _Data;

//   factory Profile.fromJson(Map<String, dynamic> json) =>
//       _$ProfileFromJson(json);
// }

import 'dart:convert';

class Profile {
  final String id;
  final String name;
  Profile({
    required this.id,
    required this.name,
  });

  Profile copyWith({
    String? id,
    String? name,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id']!,
      name: map['name']!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() => 'Profile(id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Profile && o.id == id && o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
