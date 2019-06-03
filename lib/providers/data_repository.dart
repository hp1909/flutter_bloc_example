import 'package:manabie_code_challenge/models/tile.dart';

class DataRepository {
  Future<List<Tile>> initTiles() async {
    List<Tile> tiles = [
      Tile(id: '1', color: '#2ecc71'),
      Tile(id: '2', color: '#2ecc71', value: 1),
      Tile(id: '3', color: '#2ecc71', value: 2),
      Tile(id: '4', color: '#2ecc71'),
      Tile(id: '5', color: '#2ecc71'),
      Tile(id: '6', color: '#2ecc71'),
      Tile(id: '7', color: '#2ecc71'),
      Tile(id: '8', color: '#2ecc71'),
      Tile(id: '9', color: '#2ecc71'),
      Tile(id: '10', color: '#2ecc71'),
    ];
    return Future.delayed(
      Duration(seconds: 1),
      () => tiles,
    );
  }
}
