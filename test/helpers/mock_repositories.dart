import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';
import 'package:mockito/mockito.dart';

class MockDataRepository extends Mock implements DataRepository {}

void registerMockDataRepository() {
  getIt.registerSingleton<DataRepository>(MockDataRepository());
}
