import 'package:equatable/equatable.dart';
import 'package:manabie_code_challenge/models/card.dart';

abstract class ListEvent extends Equatable {
  ListEvent([List props = const []]) : super(props);
}

class InitList extends ListEvent {
  @override
  String toString() => 'InitList';
}

class IncreaseCard extends ListEvent {
  final CardModel card;

  IncreaseCard({this.card}) : super([card]);

  @override
  String toString() => 'IncreaseCard';
}
