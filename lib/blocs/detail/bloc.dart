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
  StreamSubscription _cardSubscription;

  DetailBloc({@required this.listBloc}) {
    _cardSubscription = listBloc.state.listen((state) {
      if (state is ListLoaded && currentState is DetailSelected) {
        final currentCard = (currentState as DetailSelected).card;
        final updatedCard =
            state.cards.firstWhere((card) => card.id == currentCard.id);
        dispatch(SelectDetail(card: updatedCard));
      }
    });
  }

  @override
  DetailState get initialState => DetailUninitialized();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is SelectDetail) {
      yield DetailSelected(card: event.card);
    }
  }

  @override
  void dispose() {
    _cardSubscription.cancel();
    super.dispose();
  }
}
