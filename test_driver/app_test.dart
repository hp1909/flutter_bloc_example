import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'test_helper.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('App', () {
    final listFinder = find.byValueKey('__LIST_CARDS_KEY__');
    final emptyDetailFinder = find.byValueKey('__EMPTY_DETAIL_CARD_KEY__');
    final detailCardFinder = find.byValueKey('__DETAIL_CARD_KEY__');
    final firstCardFinder = find.byValueKey('__CARD_ITEM_8_KEY__');
    final firstCardTextFinder = find.byValueKey('__CARD_ITEM_8_TEXT_KEY__');

    test('should have empty detail widget when open app', () async {
      await driver.waitFor(listFinder);
      await driver.waitFor(emptyDetailFinder);
      await driver.waitForAbsent(detailCardFinder);
    });

    test('should show detail widget when tap on item on list of cards', () async {
      await driver.tap(firstCardFinder);
      await driver.waitFor(listFinder);
      await driver.waitFor(detailCardFinder);
      await driver.waitForAbsent(emptyDetailFinder);
    });

    test('should increase item on list of cards when tap on detail widget', () async {
      await driver.tap(firstCardFinder);
      expect(await driver.getText(firstCardTextFinder), '0');
      await driver.tap(detailCardFinder);
      await waitForSeconds(1);
      expect(await driver.getText(firstCardTextFinder), '1');
    });
  });
}
