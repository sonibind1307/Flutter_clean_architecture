import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class UnitTestScreen extends StatefulWidget {
  const UnitTestScreen({super.key});

  @override
  _UnitTestState createState() => _UnitTestState();
}

class _UnitTestState extends State<UnitTestScreen> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {

  }
}

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
