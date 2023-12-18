import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app/home_page.dart';
import 'helpers/add_delay.dart';
// import 'helpers/helpers.dart';

void main() async {
  late FlutterDriver driver;

  group('My DataCoin App Integration Test', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();

      await driver.waitUntilFirstFrameRasterized();
    });
  });

  group('Home', () {
    test('check screens', () async {
      await checkHomeVew(driver);
    });
  });

  tearDownAll(() async {
    await addDelay(300);
    await driver.close();
  });
}
