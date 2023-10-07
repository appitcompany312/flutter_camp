import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_integration_test_example/main.dart' as app;

// flutter drive --target=test_driver/app.dart

void main() {
  enableFlutterDriverExtension();
  app.main();
}
