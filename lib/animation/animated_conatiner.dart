import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});
  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}
class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _size = 100;
  Color _color = Colors.blue;

  void _animate() {
    setState(() {
      _size = _size == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedContainer(
            width: _size,
            height: _size,
            color: _color,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _animate,
            child: const Icon(Icons.play_arrow),
          ),
        )
      ],
    );
  }
}
