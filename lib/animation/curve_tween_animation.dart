import 'package:flutter/material.dart';

class TweenCurvedAnimation extends StatefulWidget {
  const TweenCurvedAnimation({super.key});

  @override
  State<TweenCurvedAnimation> createState() => _TweenCurvedAnimationState();
}

class _TweenCurvedAnimationState extends State<TweenCurvedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    final curve =
    CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _sizeAnimation = Tween<double>(begin: 0, end: 200).animate(curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tween + Curved Animation")),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: Colors.teal,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animate,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
