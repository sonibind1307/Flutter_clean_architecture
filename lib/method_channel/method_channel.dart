import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreen extends StatelessWidget {
  MethodChannelScreen({super.key});

  NativeBridge nativeBridge = NativeBridge();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            nativeBridge.getBatteryLevel();
          },
          child: Text("Get"),
        ),
      ),
    );
  }
}

class NativeBridge {
  static const platform = MethodChannel('com.example.myapp/channel');

  Future<String> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      return 'Battery level is $result%.';
    } on PlatformException catch (e) {
      return "Failed to get battery level: '${e.message}'.";
    }
  }
}
