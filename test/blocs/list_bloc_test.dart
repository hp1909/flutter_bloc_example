import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import 'package:manabie_code_challenge/blocs/list/list.dart';

class MockDataRepository extends Mock implements DataRepository {}

main() {
  MockDataRepository dataRepository;
  ListBloc listBloc;
  List<Tile> tiles = [
    Tile(id: '8', color: '#2ecc71'),
    Tile(id: '9', color: '#2ecc71'),
    Tile(id: '10', color: '#2ecc71'),
  ];
  setUp(() {
    dataRepository = MockDataRepository();
    listBloc = ListBloc(dataRepository: dataRepository);

    when(dataRepository.initTiles()).thenAnswer((_) => Future.value(tiles));
  });

  group('ListBloc', () {
    test('initial state is correct', () {
      expect(listBloc.initialState, ListLoading());
    });

    test('dispose does not emit new states', () {
      expectLater(listBloc.state, emitsInOrder([]));

      listBloc.dispose();
    });

    test('emit a list of tiles when dispatch InitList event', () {
      final expectedResponses = [
        ListLoading(),
        ListLoaded(tiles: tiles),
      ];

      expectLater(listBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
    });

    test('emit an updated list of tiles when dispatch IncreaseTile event', () {
      final tileToUpdate = Tile(id: '8', color: '#2ecc71');
      List<Tile> updatedTiles = [
        Tile(id: '8', color: '#2ecc71', value: 1),
        Tile(id: '9', color: '#2ecc71'),
        Tile(id: '10', color: '#2ecc71'),
      ];
      final expectedResponses = [
        ListLoading(),
        ListLoaded(tiles: tiles),
        ListLoaded(tiles: updatedTiles),
      ];

      expectLater(listBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      listBloc.dispatch(IncreaseTile(tile: tileToUpdate));
    });
  });
}
