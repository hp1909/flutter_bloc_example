import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/widgets/card_detail.dart';
import 'package:manabie_code_challenge/widgets/card_element.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/utils/keys.dart';
import 'package:manabie_code_challenge/views/home_view.dart';
import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import '../helpers/mock_repositories.dart';

main() {
  registerMockDataRepository();
  List<Tile> tiles = [
    Tile(id: '8', color: '#2ecc71'),
    Tile(id: '9', color: '#2ecc71'),
    Tile(id: '10', color: '#2ecc71'),
  ];

  setUp(() {
    when(getIt<DataRepository>().initTiles()).thenAnswer((_) => Future.value(tiles));
  });

  group('HomeView', () {
    testWidgets('should get empty detail card when init home view',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: HomeView(),
        ),
      ));

      expect(find.byKey(EMPTY_DETAIL_TILE_KEY), findsOneWidget);
      expect(find.byKey(DETAIL_TILE_KEY), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(Duration(seconds: 1));
      expect(find.byType(CardElement), findsNWidgets(3));
    });

    testWidgets('show correctly detail card when select a card in list',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: HomeView(),
        ),
      ));
      await tester.pump(Duration(seconds: 1));
      await tester.tap(find.byType(CardElement).at(0));
      await tester.pumpAndSettle();

      expect(find.byKey(EMPTY_DETAIL_TILE_KEY), findsNothing);
      expect(find.byKey(DETAIL_TILE_KEY), findsOneWidget);
    });

    testWidgets(
        'should increase the corresponding card in list when tap on detail card',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: HomeView(),
        ),
      ));
      await tester.pump(Duration(seconds: 1));
      await tester.tap(find.byType(CardElement).at(0));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsNothing);

      await tester.tap(find.byType(CardDetail));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsNWidgets(2));
    });
  });
}
