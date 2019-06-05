import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/widgets/card_detail.dart';
import 'package:manabie_code_challenge/widgets/card_element.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/utils/keys.dart';
import 'package:manabie_code_challenge/views/home_view.dart';
import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';
import '../helpers/mock_repositories.dart';

main() {
  registerMockDataRepository();
  List<CardModel> cards = [
    CardModel(id: '8', color: '#2ecc71'),
    CardModel(id: '9', color: '#2ecc71'),
    CardModel(id: '10', color: '#2ecc71'),
  ];

  setUp(() {
    when(getIt<DataRepository>().initCards()).thenAnswer((_) => Future.value(cards));
  });

  group('HomeView', () {
    testWidgets('should get empty detail card when init home view', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: HomeView(),
        ),
      ));

      expect(find.byKey(EMPTY_DETAIL_CARD_KEY), findsOneWidget);
      expect(find.byKey(DETAIL_CARD_KEY), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(Duration(seconds: 1));
      expect(find.byType(CardElement), findsNWidgets(3));
    });

    testWidgets('should show correctly detail card when select a card in list', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: HomeView(),
        ),
      ));
      await tester.pump(Duration(seconds: 1));
      await tester.tap(find.byType(CardElement).at(0));
      await tester.pumpAndSettle();

      expect(find.byKey(EMPTY_DETAIL_CARD_KEY), findsNothing);
      expect(find.byKey(DETAIL_CARD_KEY), findsOneWidget);
    });

    testWidgets('should increase the corresponding card in list when tap on detail card', (WidgetTester tester) async {
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
