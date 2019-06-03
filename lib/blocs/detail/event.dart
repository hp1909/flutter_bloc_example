import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/tile.dart';

abstract class DetailEvent extends Equatable {
  DetailEvent([final props = const []]) : super(props);
}

class SelectDetail extends DetailEvent {
  final Tile tile;

  SelectDetail({this.tile}) : super([tile]);

  @override
  String toString() => 'SelectDetail';
}
