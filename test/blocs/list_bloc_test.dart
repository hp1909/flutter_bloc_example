import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';
import 'package:manabie_code_challenge/blocs/list/list.dart';
import 'package:manabie_code_challenge/locator.dart';
import '../helpers/mock_repositories.dart';

main() {
  registerMockDataRepository();
  ListBloc listBloc;
  List<CardModel> cards = [
    CardModel(id: '8', color: '#2ecc71'),
    CardModel(id: '9', color: '#2ecc71'),
    CardModel(id: '10', color: '#2ecc71'),
  ];
  
  setUp(() {
    listBloc = ListBloc(dataRepository: getIt<DataRepository>());

    when(getIt<DataRepository>().initCards()).thenAnswer((_) => Future.value(cards));
  });

  tearDown(() {
    listBloc.dispose();
  });

  group('ListBloc', () {
    test('should init correct state', () {
      expect(listBloc.initialState, ListLoading());
    });

    test('should not emit new states when dispose', () {
      expectLater(listBloc.state, emitsInOrder([]));

      listBloc.dispose();
    });

    test('should emit a list of cards when dispatch InitList event', () {
      final expectedResponses = [
        ListLoading(),
        ListLoaded(cards: cards),
      ];

      expectLater(listBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
    });

    test('should emit an updated list of cards when dispatch IncreaseCard event', () {
      final cardToUpdate = CardModel(id: '8', color: '#2ecc71');
      List<CardModel> updatedCards = [
        CardModel(id: '8', color: '#2ecc71', value: 1),
        CardModel(id: '9', color: '#2ecc71'),
        CardModel(id: '10', color: '#2ecc71'),
      ];
      final expectedResponses = [
        ListLoading(),
        ListLoaded(cards: cards),
        ListLoaded(cards: updatedCards),
      ];

      expectLater(listBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      listBloc.dispatch(IncreaseCard(card: cardToUpdate));
    });
  });
}
