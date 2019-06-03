import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';

import 'package:manabie_code_challenge/blocs/list/state.dart';
import 'package:manabie_code_challenge/blocs/detail/event.dart';
import 'package:manabie_code_challenge/blocs/detail/state.dart';
import 'package:manabie_code_challenge/blocs/list/bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ListBloc listBloc;
  StreamSubscription _tileSubscription;

  DetailBloc({@required this.listBloc}) {
    _tileSubscription = listBloc.state.listen((state) {
      if (state is ListLoaded && currentState is DetailSelected) {
        final currentTile = (currentState as DetailSelected).tile;
        final updatedTile =
            state.tiles.firstWhere((tile) => tile.id == currentTile.id);
        dispatch(SelectDetail(tile: updatedTile));
      }
    });
  }

  @override
  DetailState get initialState => DetailUninitialized();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is SelectDetail) {
      yield DetailSelected(tile: event.tile);
    }
  }

  @override
  void dispose() {
    _tileSubscription.cancel();
    super.dispose();
  }
}
