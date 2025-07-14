import 'package:flutter/material.dart';
import 'scale_animation_mixin.dart'; // If it's in a separate file

class MultiAnimationExample extends StatefulWidget {
  const MultiAnimationExample({super.key});

  @override
  _MultiAnimationExampleState createState() => _MultiAnimationExampleState();
}

class _MultiAnimationExampleState extends State<MultiAnimationExample>
    with SingleTickerProviderStateMixin, MultiAnimationMixin {
  @override
  void initState() {
    super.initState();
    initMultiAnimations();
  }

  @override
  void dispose() {
    disposeAnimations();
    super.dispose();
  }

  bool toggled = false;

  void _toggleAnimations() {
    if (toggled) {
      playReverse();
    } else {
      playForward();
    }
    toggled = !toggled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Combined Animation Mixin')),
      body: Center(
        child: SlideTransition(
          position: slideAnimation,
          child: RotationTransition(
            turns: rotateAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Container(width: 100, height: 100, color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimations,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
