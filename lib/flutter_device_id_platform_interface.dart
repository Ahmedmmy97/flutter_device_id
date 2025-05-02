import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_device_id_method_channel.dart';

abstract class FlutterDeviceIdPlatform extends PlatformInterface {
  /// Constructs a FlutterDeviceIdPlatform.
  FlutterDeviceIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDeviceIdPlatform _instance = MethodChannelFlutterDeviceId();

  /// The default instance of [FlutterDeviceIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDeviceId].
  static FlutterDeviceIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDeviceIdPlatform] when
  /// they register themselves.
  static set instance(FlutterDeviceIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getDeviceId() {
    throw UnimplementedError('deviceId() has not been implemented.');
  }
}
