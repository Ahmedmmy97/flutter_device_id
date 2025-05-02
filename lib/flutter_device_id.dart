import 'package:flutter_device_id/flutter_device_id_method_channel.dart';
import 'flutter_device_id_platform_interface.dart';

class FlutterDeviceId {
  static FlutterDeviceIdPlatform _platform = MethodChannelFlutterDeviceId();

  static set platform(FlutterDeviceIdPlatform platform) {
    _platform = platform;
  }

  static Future<String?> getAndroidId() {
    return _platform.getAndroidId();
  }
}