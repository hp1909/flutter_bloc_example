import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import 'package:manabie_code_challenge/blocs/list/list.dart';
import 'package:manabie_code_challenge/blocs/detail/detail.dart';

class MockDataRepository extends Mock implements DataRepository {}

main() {
  MockDataRepository dataRepository;
  ListBloc listBloc;
  DetailBloc detailBloc;
  List<Tile> tiles = [
    Tile(id: '8', color: '#2ecc71'),
    Tile(id: '9', color: '#2ecc71'),
    Tile(id: '10', color: '#2ecc71'),
  ];

  setUp(() {
    dataRepository = MockDataRepository();
    listBloc = ListBloc(dataRepository: dataRepository);
    detailBloc = DetailBloc(listBloc: listBloc);

    when(dataRepository.initTiles()).thenAnswer((_) => Future.value(tiles));
  });

  group('DetailBloc', () {
    test('initial state is correct', () {
      expect(detailBloc.initialState, DetailUninitialized());
    });

    test('dispose does not emit new states', () {
      expect(detailBloc.state, emitsInOrder([]));

      detailBloc.dispose();
    });

    test('emit a Tile when dispatch SelectDetail event', () {
      final selectedTile = Tile(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
        DetailSelected(tile: selectedTile),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));
      detailBloc.dispatch(SelectDetail(tile: selectedTile));
    });

    test(
        'does not emit Tile when increase a Tile in list but DetailTile not selected',
        () {
      final tileToUpdate = Tile(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      listBloc.dispatch(IncreaseTile(tile: tileToUpdate));
    });

    test('emit Tile when increase a Tile in list and DetailTile is selected',
        () {
      final selectedTile = Tile(id: '8', color: '#2ecc71');
      final tileToUpdate = Tile(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
        DetailSelected(tile: selectedTile),
        DetailSelected(
            tile: tileToUpdate.copyWith(value: tileToUpdate.value + 1)),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      detailBloc.dispatch(SelectDetail(tile: selectedTile));
      listBloc.dispatch(IncreaseTile(tile: tileToUpdate));
    });
  });
}
