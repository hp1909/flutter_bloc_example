import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/tile.dart';

abstract class DetailState extends Equatable {
  DetailState([final props = const []]) : super(props);
}

class DetailUninitialized extends DetailState {}

class DetailSelected extends DetailState {
  final Tile tile;

  DetailSelected({this.tile}) : super([tile]);

  @override
  String toString() => 'DetailSelected';
}
