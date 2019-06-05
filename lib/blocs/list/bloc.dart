import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:manabie_code_challenge/blocs/list/event.dart';
import 'package:manabie_code_challenge/blocs/list/state.dart';
import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/repositories/data_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final DataRepository dataRepository;

  ListBloc({@required this.dataRepository}) : assert(dataRepository != null);

  @override
  ListState get initialState => ListLoading();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is InitList && currentState is ListLoading) {
      final cards = await dataRepository.initCards();
      yield ListLoaded(cards: cards);
    }

    if (event is IncreaseCard) {
      yield* _mapIncreaseCardToEvent(event: event);
    }
  }

  Stream<ListState> _mapIncreaseCardToEvent({IncreaseCard event}) async* {
    if (currentState is ListLoaded) {
      final increasedCard = event.card.copyWith(value: event.card.value + 1);
      final List<CardModel> updatedCards =
          (currentState as ListLoaded).cards.map((card) {
        return card.id == increasedCard.id ? increasedCard : card;
      }).toList();
      yield ListLoaded(cards: updatedCards);
    }
  }
}
