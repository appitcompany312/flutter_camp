import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'extensions/screenshot_driver.dart';

void main() async {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();

    await driver.waitUntilFirstFrameRasterized();
  });

  test('check screens', () async {
    await driver.waitFor(find.byValueKey('home-page-view'));
    await driver.takeScreenshot('home-count-0');

    await driver.tap(find.byValueKey('increment-button'));
    await driver.takeScreenshot('home-count-1');
  });

  tearDownAll(() async {
    await driver.close();
  });
}
