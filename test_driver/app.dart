import 'package:flutter/widgets.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:manabie_code_challenge/main.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';
import '../test/helpers/mock_repositories.dart';

void main() {
  enableFlutterDriverExtension();

  registerMockDataRepository();
  List<CardModel> cards = [
    CardModel(id: '8', color: '#2ecc71'),
    CardModel(id: '9', color: '#2ecc71'),
    CardModel(id: '10', color: '#2ecc71'),
  ];
  when(getIt<DataRepository>().initCards()).thenAnswer(
    (_) => Future.value(cards),
  );
  runApp(MyApp());
}
