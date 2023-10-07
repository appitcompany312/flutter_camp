import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    await driver.waitUntilFirstFrameRasterized();
  });

  group('Login Page', () {
    test('Check Login Page', () async {
      await driver.waitFor(find.byValueKey('Login-AppBar'));
    });

    test('Incorrect account', () async {
      await driver.tap(find.byValueKey('login-email-feild'));
      await driver.enterText('app_company@gmail.com');

      await driver.tap(find.byValueKey('login-password-feild'));
      await driver.enterText('123456');

      await driver.tap(find.byValueKey('login-button'));

      await driver.waitFor(find.byValueKey('account-incorrect-dialog'));
      await driver.tap(find.byValueKey('login-again-bitton'));
    });

    test('Correct account', () async {
      await driver.tap(find.byValueKey('login-email-feild'));
      await driver.enterText('it_app@gmail.com');

      await driver.tap(find.byValueKey('login-password-feild'));
      await driver.enterText('it2023.bishkek');

      await driver.tap(find.byValueKey('login-button'));

      await driver.waitFor(find.byValueKey('HomePage-AppBar'));
    });

    test('Increment counter', () async {
      await driver.waitFor(find.byValueKey('counter-increment-button'));
      await driver.waitFor(find.text('0'));

      await driver.tap(find.byValueKey('counter-increment-button'));
      await driver.waitFor(find.text('1'));

      await driver.tap(find.byValueKey('counter-increment-button'));
      await driver.waitFor(find.text('2'));

      await driver.tap(find.byValueKey('counter-increment-button'));
      await driver.waitFor(find.text('3'));
    });
  });

  tearDownAll(() async => driver.close());
}
