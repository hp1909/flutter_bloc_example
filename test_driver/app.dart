import 'package:flutter/widgets.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:manabie_code_challenge/main.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import '../test/helpers/mock_repositories.dart';

void main() {
  enableFlutterDriverExtension();

  registerMockDataRepository();
  List<Tile> tiles = [
    Tile(id: '8', color: '#2ecc71'),
    Tile(id: '9', color: '#2ecc71'),
    Tile(id: '10', color: '#2ecc71'),
  ];
  when(getIt<DataRepository>().initTiles()).thenAnswer(
    (_) => Future.value(tiles),
  );
  runApp(MyApp());
}
