import 'package:core/api/tmdb_api.dart';
import 'package:core/persistence/data_store.dart';
import 'package:core/persistence/sembast_data_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

//These two injected state will be mocked in test
final dataStoreInject = RM.injectFuture<DataStore>(
  () => SembastDataStore.makeDefault(),
);

final apiInject = RM.inject(() => TMDBClient());
