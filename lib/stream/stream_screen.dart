import 'dart:async';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final controller = StreamController<String>();
  final inCtrl = StreamController<int>();
  late final Stream<int> streamValue = inCtrl.stream;
  int increment =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Example')),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
              stream: getCounterStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Value: ${snapshot.data}',
                    style: TextStyle(fontSize: 24),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text('Stream finished');
                }
              },
            ),

            StreamBuilder<int>(
              stream: streamValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Value: ${snapshot.data}',
                    style: TextStyle(fontSize: 24),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text('Stream finished');
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                increment =increment + 1;
                inCtrl.sink.add(increment);
              },
              child: Text("Add"),
            ),
          ],
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
