import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/models/tile.dart';

main() {
  group('Tile', () {
    test('should generate correctly Tile from Tile constructor', () {
      const tileId = '1';
      const tileValue = 10;
      const tileColor = '#123456';
      final tile = Tile(id: tileId, value: tileValue, color: tileColor);

      expect(tile.id, tileId);
      expect(tile.value, tileValue);
      expect(tile.color, tileColor);
    });

    test('should return new Tile when use copyWith function', () {
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

    test('should return correctly when using ==', () {
      final tile1 = Tile(id: '1', color: '#123456', value: 1);
      final tile2 = Tile(id: '1', color: '#123456', value: 1);
      final tile3 = Tile(id: '1', color: '#123456', value: 2);

      expect(tile1, tile2);
      expect(tile1, isNot(equals(tile3)));
    });
  });
}
