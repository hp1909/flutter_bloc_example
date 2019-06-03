import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/models/tile.dart';

main() {
  group('Tile', () {
    test('generate correctly Tile from Tile constructor', () {
      const tileId = '1';
      const tileValue = 10;
      const tileColor = '#123456';
      final tile = Tile(id: tileId, value: tileValue, color: tileColor);

      expect(tile.id, tileId);
      expect(tile.value, tileValue);
      expect(tile.color, tileColor);
    });

    test('return new Tile when use copyWith function', () {
      const tileId = '1';
      const tileValue = 10;
      const tileColor = '#123456';
      const newTileColor = '#123654';
      const newTileValue = 20;
      final tile = Tile(id: tileId, value: tileValue, color: tileColor);

      final newTile = tile.copyWith(color: newTileColor);
      expect(newTile.id, tileId);
      expect(newTile.value, tileValue);
      expect(newTile.color, newTileColor);

      final newTile2 = tile.copyWith(value: newTileValue);
      expect(newTile2.id, tileId);
      expect(newTile2.value, newTileValue);
      expect(newTile2.color, tileColor);
    });
  });
}
