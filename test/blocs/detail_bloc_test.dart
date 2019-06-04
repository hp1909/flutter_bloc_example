import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import 'package:manabie_code_challenge/blocs/list/list.dart';
import 'package:manabie_code_challenge/blocs/detail/detail.dart';
import '../helpers/mock_repositories.dart';

main() {
  registerMockDataRepository();
  ListBloc listBloc;
  DetailBloc detailBloc;
  List<Tile> tiles = [
    Tile(id: '8', color: '#2ecc71'),
    Tile(id: '9', color: '#2ecc71'),
    Tile(id: '10', color: '#2ecc71'),
  ];

  setUp(() {
    listBloc = ListBloc(dataRepository: getIt<DataRepository>());
    detailBloc = DetailBloc(listBloc: listBloc);

    when(getIt<DataRepository>().initTiles()).thenAnswer((_) => Future.value(tiles));
  });

  group('DetailBloc', () {
    test('should init correct state', () {
      expect(detailBloc.initialState, DetailUninitialized());
    });

    test('should not emit new states when dispose', () {
      expect(detailBloc.state, emitsInOrder([]));

      detailBloc.dispose();
    });

    test('should emit a Tile when dispatch SelectDetail event', () {
      final selectedTile = Tile(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
        DetailSelected(tile: selectedTile),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));
      detailBloc.dispatch(SelectDetail(tile: selectedTile));
    });

    test(
        'should not emit DetailSelected when increase a Tile in list but DetailTile not selected',
        () {
      final tileToUpdate = Tile(id: '8', color: '#2ecc71');
      final expectedResponses = [
        DetailUninitialized(),
      ];

      expectLater(detailBloc.state, emitsInOrder(expectedResponses));

      listBloc.dispatch(InitList());
      listBloc.dispatch(IncreaseTile(tile: tileToUpdate));
    });

    test('should emit DetailSelected when increase a Tile in list and DetailTile is selected',
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

  tearDown(() {
    detailBloc.dispose();
    listBloc.dispose();
  });
}
