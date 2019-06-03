import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:manabie_code_challenge/blocs/list/event.dart';
import 'package:manabie_code_challenge/blocs/list/state.dart';
import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final DataRepository dataRepository;

  ListBloc({@required this.dataRepository}) : assert(dataRepository != null);

  @override
  ListState get initialState => ListLoading();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is InitList && currentState is ListLoading) {
      final tiles = await dataRepository.initTiles();
      yield ListLoaded(tiles: tiles);
    }

    if (event is IncreaseTile) {
      yield* _mapIncreaseTileToEvent(event: event);
    }
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
