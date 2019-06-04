import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/models/tile.dart';

import 'package:manabie_code_challenge/widgets/card_element.dart';

main() {
  testWidgets('should show correct value when init CardElement', (WidgetTester tester) async {
    final Tile tile = Tile(id: '1', value: 10, color: '#123456');
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: CardElement(
          tile: tile,
        ),
      ),
    ));

    final findValue = find.text('10');

    expect(findValue, findsOneWidget);
  });
}
