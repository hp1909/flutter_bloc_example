import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/providers/data_repository.dart';

class MockDataRepository extends Mock implements DataRepository {}

GetIt getIt = GetIt();

void setupLocator() {
  getIt.registerLazySingleton<DataRepository>(() => DataRepository());
}
