import 'package:equatable/equatable.dart';

import 'package:manabie_code_challenge/models/tile.dart';

abstract class ListState extends Equatable {
  ListState([final props = const []]) : super(props);
}

class ListLoading extends ListState {
  @override
  String toString() => 'ListLoading';
}

class ListLoaded extends ListState {
  final List<Tile> tiles;

  ListLoaded({this.tiles}) : super([tiles]);

  @override
  String toString() => 'ListLoaded';
}
