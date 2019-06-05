import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/card.dart';

abstract class ListState extends Equatable {
  ListState([final props = const []]) : super(props);
}

class ListLoading extends ListState {
  @override
  String toString() => 'ListLoading';
}

class ListLoaded extends ListState {
  final List<CardModel> cards;

  ListLoaded({this.cards}) : super([cards]);

  @override
  String toString() => 'ListLoaded';
}
