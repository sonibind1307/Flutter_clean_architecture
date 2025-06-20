import 'dart:async';

import 'package:flutter/material.dart';

class BroadStreamScreen extends StatefulWidget {
  const BroadStreamScreen({super.key});

  @override
  _CreateBroadCastState createState() => _CreateBroadCastState();
}

class _CreateBroadCastState extends State<BroadStreamScreen> {
  StreamController<int> controller = StreamController<int>.broadcast();

  Stream<int> get valueInt => controller.stream;
  int increment = 0;


  @override
  void initState() {
    controller.stream.listen((onData){
      print("onData-$onData");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: valueInt,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),

          StreamBuilder(
            stream: valueInt,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              increment =increment + 1;
              controller.sink.add(increment);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
