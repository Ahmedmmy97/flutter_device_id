

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_device_id/flutter_device_id.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDeviceId test', (WidgetTester tester) async {
    final String? id = await FlutterDeviceId.getDeviceId();
    expect(id?.isNotEmpty, true);
  });
}
