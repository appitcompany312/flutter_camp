import 'package:flutter_driver/driver_extension.dart';
import 'package:example_project/main.dart' as app;

// flutter drive --target=test_driver/app.dart

Future<void> main() async {
  enableFlutterDriverExtension();

  app.main();
}
