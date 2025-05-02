import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_device_id/flutter_device_id_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterDeviceId platform = MethodChannelFlutterDeviceId();
  const MethodChannel channel = MethodChannel('flutter_device_id');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getAndroidId') {
          return 'mocked-android-id-42';
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getAndroidId returns mocked value', () async {
    final androidId = await platform.getAndroidId();
    expect(androidId, 'mocked-android-id-42');
  });
}