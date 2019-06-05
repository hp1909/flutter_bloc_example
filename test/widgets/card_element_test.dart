import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/models/card.dart';

import 'package:manabie_code_challenge/widgets/card_element.dart';

main() {
  testWidgets('should show correct value when init CardElement', (WidgetTester tester) async {
    final CardModel card = CardModel(id: '1', value: 10, color: '#123456');
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: CardElement(
          card: card,
        ),
      ),
    ));

    final findValue = find.text('10');

    expect(findValue, findsOneWidget);
  });
}
