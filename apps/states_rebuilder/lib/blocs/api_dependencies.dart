import 'package:core/api/tmdb_api.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/persistence/sembast_data_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

/// The external api provider that the app depends on.
/// They are easily mocked for testing.
///
/// They are only used in bloCs not in the UI
@immutable
class ApiDependencies {
  final dataStoreRM = RM.injectFuture<DataStore>(
    () => SembastDataStore.makeDefault(),
  );
  Future<void> initializeDataSore() async {
    await dataStoreRM.initializeState();
  }

  final apiRM = RM.inject(() => TMDBClient.platform());
}

/// This is a global state
///
/// It is safe to instantiate it globally because it is immutable and final.
final apiDependencies = ApiDependencies();
