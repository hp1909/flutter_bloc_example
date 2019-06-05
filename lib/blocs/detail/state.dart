import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/card.dart';

abstract class DetailState extends Equatable {
  DetailState([final props = const []]) : super(props);
}

class DetailUninitialized extends DetailState {}

class DetailSelected extends DetailState {
  final CardModel card;

  DetailSelected({this.card}) : super([card]);

  @override
  String toString() => 'DetailSelected';
}
