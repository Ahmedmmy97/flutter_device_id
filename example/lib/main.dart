import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_device_id/flutter_device_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceId = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceId;
    try {
      deviceId =
          await FlutterDeviceId.getDeviceId() ?? 'Unknown Device Id';
    } on PlatformException {
      deviceId = 'Failed to get Device Id.';
    }

    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Device ID: $_deviceId\n'),
        ),
      ),
    );
  }
}
