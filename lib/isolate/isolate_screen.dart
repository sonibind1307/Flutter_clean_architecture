import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateScreen extends StatelessWidget {
  const IsolateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            runHeavyTaskInIsolate();
          },
          child: Text("Get"),
        ),
      ),
    );
  }

  Future<void> runHeavyTaskInIsolate() async {
    final ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(heavyTask, receivePort.sendPort);

    final result = await receivePort.first;
    print("Result from isolate: $result");
  }

  void heavyTask(SendPort sendPort) {
    // Simulate heavy computation
    int sum = 0;
    for (int i = 0; i < 100000000; i++) {
      sum += i;
    }

    sendPort.send(sum);
  }
}
