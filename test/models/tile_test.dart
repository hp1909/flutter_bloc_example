import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/models/card.dart';

main() {
  group('CardModel', () {
    test('should generate correctly CardModel from CardModel constructor', () {
      const cardId = '1';
      const cardValue = 10;
      const cardColor = '#123456';
      final card = CardModel(id: cardId, value: cardValue, color: cardColor);

      expect(card.id, cardId);
      expect(card.value, cardValue);
      expect(card.color, cardColor);
    });

    test('should return new CardModel when use copyWith function', () {
      const cardId = '1';
      const cardValue = 10;
      const cardColor = '#123456';
      const newCardColor = '#123654';
      const newCardValue = 20;
      final card = CardModel(id: cardId, value: cardValue, color: cardColor);

      final newCard = card.copyWith(color: newCardColor);
      expect(newCard.id, cardId);
      expect(newCard.value, cardValue);
      expect(newCard.color, newCardColor);

      final newCard2 = card.copyWith(value: newCardValue);
      expect(newCard2.id, cardId);
      expect(newCard2.value, newCardValue);
      expect(newCard2.color, cardColor);
    });

    test('should return correctly when using ==', () {
      final card1 = CardModel(id: '1', color: '#123456', value: 1);
      final card2 = CardModel(id: '1', color: '#123456', value: 1);
      final card3 = CardModel(id: '1', color: '#123456', value: 2);

      expect(card1, card2);
      expect(card1, isNot(equals(card3)));
    });
  });
}
