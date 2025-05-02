import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_device_id_platform_interface.dart';

/// An implementation of [FlutterDeviceIdPlatform] that uses method channels.
class MethodChannelFlutterDeviceId extends FlutterDeviceIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_device_id');

  @override
  Future<String?> getDeviceId() async {
    final version = await methodChannel.invokeMethod<String>('getDeviceId');
    return version;
  }
}
