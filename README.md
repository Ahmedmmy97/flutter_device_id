# flutter_device_id

A Flutter plugin to retrieve a unique device identifier on Android and iOS.

## Features
- Retrieve a unique device ID for Android and iOS platforms.
- Simple API for cross-platform usage.

## Usage

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_device_id: <latest_version>
```

Import the package:

```dart
import 'package:flutter_device_id/flutter_device_id.dart';
```

Get the device ID:

```dart
String? deviceId = await FlutterDeviceId.getDeviceId();
```

## Platform-specific Notes

### Android
- This plugin uses the `Settings.Secure.ANDROID_ID` as the device identifier.
- **Limitations:**
  - The value of ANDROID_ID may change if the device is factory reset.
  - On devices running Android 8.0 (Oreo) and above, the value is unique per app signing key, user, and device.
  - On some older devices, ANDROID_ID may not be unique or may be unreliable.
  - Do not use ANDROID_ID as a secure identifier for sensitive use cases.

### iOS
- Uses `identifierForVendor` as the device identifier.
- The value may change if all apps from the same vendor are uninstalled and then reinstalled.

## Example

See the [example](example/) directory for a complete sample app.

## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

