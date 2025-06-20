import 'dart:async';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final controller = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Example')),
      body: Center(
        child: StreamBuilder<int>(
          stream: getCounterStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Value: ${snapshot.data}', style: TextStyle(fontSize: 24));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text('Stream finished');
            }
          },
        ),
      ),

    );
  }

  @override
  void initState() {
    controller.stream.listen((data) {
      print('Received: $data');
    });
  }

  Stream<int> getCounterStream() {
    return Stream.periodic(Duration(seconds: 1), (i) => i).take(10);
  }
}
