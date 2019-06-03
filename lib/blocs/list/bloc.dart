import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:manabie_code_challenge/blocs/list/event.dart';
import 'package:manabie_code_challenge/blocs/list/state.dart';
import 'package:manabie_code_challenge/models/tile.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  @override
  ListState get initialState => ListLoading();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is InitList && currentState is ListLoading) {
      final tiles = await _initTiles();
      yield ListLoaded(tiles: tiles);
    }

    if (event is IncreaseTile) {
      yield* _mapIncreaseTileToEvent(event: event);
    }
  }

  Future<List<Tile>> _initTiles() async {
    List<Tile> tiles = [
      Tile(id: '1', color: '#2ecc71'),
      Tile(id: '2', color: '#2ecc71', value: 1),
      Tile(id: '3', color: '#2ecc71', value: 2),
      Tile(id: '4', color: '#2ecc71'),
      Tile(id: '5', color: '#2ecc71'),
      Tile(id: '6', color: '#2ecc71'),
      Tile(id: '7', color: '#2ecc71'),
      Tile(id: '8', color: '#2ecc71'),
      Tile(id: '9', color: '#2ecc71'),
      Tile(id: '10', color: '#2ecc71'),
    ];
    return Future.delayed(
      Duration(seconds: 1),
      () => tiles,
    );
  }

  Stream<ListState> _mapIncreaseTileToEvent({IncreaseTile event}) async* {
    if (currentState is ListLoaded) {
      final increasedTile = event.tile.copyWith(value: event.tile.value + 1);
      final List<Tile> updatedTiles =
          (currentState as ListLoaded).tiles.map((tile) {
        return tile.id == increasedTile.id ? increasedTile : tile;
      }).toList();
      yield ListLoaded(tiles: updatedTiles);
    }
  }
}
