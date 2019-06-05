import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';
import 'package:manabie_code_challenge/blocs/list/list.dart';
import 'package:manabie_code_challenge/blocs/detail/detail.dart';
import '../helpers/mock_repositories.dart';

main() {
  registerMockDataRepository();
  ListBloc listBloc;
  DetailBloc detailBloc;
  List<CardModel> cards = [
    CardModel(id: '8', color: '#2ecc71'),
    CardModel(id: '9', color: '#2ecc71'),
    CardModel(id: '10', color: '#2ecc71'),
  ];

  setUp(() {
    listBloc = ListBloc(dataRepository: getIt<DataRepository>());
    detailBloc = DetailBloc(listBloc: listBloc);

    when(getIt<DataRepository>().initCards()).thenAnswer((_) => Future.value(cards));
  });

  group('DetailBloc', () {
    test('should init correct state', () {
      expect(detailBloc.initialState, DetailUninitialized());
    });

    test('should not emit new states when dispose', () {
      expect(detailBloc.state, emitsInOrder([]));

      detailBloc.dispose();
    });

    test('should emit a DetailSelected when dispatch SelectDetail event', () {
      final selectedCard = CardModel(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
        DetailSelected(card: selectedCard),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));
      detailBloc.dispatch(SelectDetail(card: selectedCard));
    });

    test(
        'should not emit DetailSelected when increase a Card in list but DetailCard not selected',
        () {
      final cardToUpdate = CardModel(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      listBloc.dispatch(IncreaseCard(card: cardToUpdate));
    });

    test('should emit DetailSelected when increase a Card in list and DetailCard is selected',
        () {
      final selectedCard = CardModel(id: '8', color: '#2ecc71');
      final cardToUpdate = CardModel(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
        DetailSelected(card: selectedCard),
        DetailSelected(
            card: cardToUpdate.copyWith(value: cardToUpdate.value + 1)),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      detailBloc.dispatch(SelectDetail(card: selectedCard));
      listBloc.dispatch(IncreaseCard(card: cardToUpdate));
    });
  });

  tearDown(() {
    detailBloc.dispose();
    listBloc.dispose();
  });
}
