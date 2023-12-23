import 'package:flutter_driver/flutter_driver.dart';

import '../extensions/screenshot_driver.dart';
import '../extensions/screenshot_name.dart';
// import '../../lib/mdc_keys/mdc_keys.dart';

Future<void> checkHomeVew(FlutterDriver driver) async {
  await driver.waitFor(find.byValueKey('home-page-view'));
  await driver.tap(find.byValueKey('home-page-view'));
  await driver.takeScreenshot(ScreenshotConstants.homePage);

  // await driver.waitFor(find.byValueKey(MdcKeys.checkSecondpage));
  // await driver.takeScreenshot(ScreenshotConstants.secondPage);
}
