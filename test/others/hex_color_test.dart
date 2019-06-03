import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_code_challenge/utils/hex_color.dart';

main() {
  group('Hexcolor', () {
    test('generate correctly color from string with letter #', () {
      expect(
        HexColor('#123456').value,
        Color(0xFF123456).value,
      );
    });

    test('generate correctly color from string without letter #', () {
      expect(
        HexColor('123456').value,
        Color(0xFF123456).value,
      );
    });

    test('generate correctly color from 8 letters string', () {
      expect(
        HexColor('12345678').value,
        Color(0x12345678).value,
      );
    });
  });
}
