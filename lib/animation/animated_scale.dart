import 'package:flutter/material.dart';

class ScaleAnimationExample extends StatefulWidget {
  const ScaleAnimationExample({super.key});
  @override
  State<ScaleAnimationExample> createState() => _ScaleAnimationExampleState();
}

class _ScaleAnimationExampleState extends State<ScaleAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scale = Tween<double>(begin: 1.0, end: 1.5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _animate() {
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: _scale,
            child: const Icon(Icons.favorite, size: 100, color: Colors.pink),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _animate,
            child: const Icon(Icons.zoom_in),
          ),
        )
      ],
    );
  }
}
