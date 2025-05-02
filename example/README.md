# flutter_device_id_example

Demonstrates how to use the flutter_device_id plugin to get the device ID.

## Getting Started

```dart
import 'package:flutter_device_id/flutter_device_id.dart';

Future<void> getDeviceId() async {
  String? deviceId = await FlutterDeviceId.getDeviceId();
  print('Device ID: $deviceId');
}
```

