import 'package:equatable/equatable.dart';
import 'package:manabie_code_challenge/models/tile.dart';

abstract class ListEvent extends Equatable {
  ListEvent([List props = const []]) : super(props);
}

class InitList extends ListEvent {
  @override
  String toString() => 'InitList';
}

class IncreaseTile extends ListEvent {
  final Tile tile;

  IncreaseTile({this.tile}) : super([tile]);
}

class TapListItem extends ListEvent {
  final Tile tile;

  TapListItem({this.tile}) : super([tile]);

  @override
  String toString() => 'TapListItem';
}
