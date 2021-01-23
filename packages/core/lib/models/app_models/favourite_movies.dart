import 'dart:convert';

import 'package:collection/collection.dart';

/// This class represents all the favourite movie IDs for a given profile
class FavouriteMovies {
  final Set<int> favouriteIDs;
  FavouriteMovies({
    required this.favouriteIDs,
  });

  String toJson() => json.encode(favouriteIDs.toList());

  factory FavouriteMovies.fromJson(String source) {
    final list = json.decode(source);
    return FavouriteMovies(favouriteIDs: Set<int>.from(list));
  }

  @override
  String toString() => 'FavouriteMovies(favouriteIDs: $favouriteIDs)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final setEquals = const DeepCollectionEquality().equals;

    return o is FavouriteMovies && setEquals(o.favouriteIDs, favouriteIDs);
  }

  @override
  int get hashCode => favouriteIDs.hashCode;
}
