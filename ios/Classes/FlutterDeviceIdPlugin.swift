import Flutter
import UIKit

public class FlutterDeviceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_id", binaryMessenger: registrar.messenger())
    let instance = FlutterDeviceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getDeviceId" {
      result(getDeviceId())
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func getDeviceId() -> String {
    if let id = UIDevice.current.identifierForVendor?.uuidString {
      return id
    }
    return "unknown"
  }
}