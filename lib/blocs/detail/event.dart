import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/card.dart';

abstract class DetailEvent extends Equatable {
  DetailEvent([final props = const []]) : super(props);
}

class SelectDetail extends DetailEvent {
  final CardModel card;

  SelectDetail({this.card}) : super([card]);

  @override
  String toString() => 'SelectDetail';
}
