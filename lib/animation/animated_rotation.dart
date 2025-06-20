import 'package:flutter/material.dart';

class AnimatedRotationExample extends StatefulWidget {
  const AnimatedRotationExample({super.key});
  @override
  State<AnimatedRotationExample> createState() => _AnimatedRotationExampleState();
}
class _AnimatedRotationExampleState extends State<AnimatedRotationExample> {
  double _turns = 0;

  void _rotate() {
    setState(() {
      _turns += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedRotation(
            turns: _turns,
            duration: const Duration(seconds: 1),
            child: const Icon(Icons.refresh, size: 100),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _rotate,
            child: const Icon(Icons.rotate_right),
          ),
        )
      ],
    );
  }
}
