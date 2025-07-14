import 'package:flutter/material.dart';

mixin MultiAnimationMixin<T extends StatefulWidget> on State<T>, SingleTickerProviderStateMixin<T> {
  late AnimationController animationController;

  // Scale
  late Animation<double> scaleAnimation;

  // Fade
  late Animation<double> fadeAnimation;

  // Slide
  late Animation<Offset> slideAnimation;

  // Rotate
  late Animation<double> rotateAnimation;

  void initMultiAnimations({
    Duration duration = const Duration(milliseconds: 800),
    double scaleBegin = 1.0,
    double scaleEnd = 1.5,
    double fadeBegin = 0.0,
    double fadeEnd = 1.0,
    Offset slideBegin = const Offset(-1, 0),
    Offset slideEnd = Offset.zero,
    double rotateBegin = 0.0,
    double rotateEnd = 1.0,
  }) {
    animationController = AnimationController(vsync: this, duration: duration);

    scaleAnimation = Tween<double>(begin: scaleBegin, end: scaleEnd).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    fadeAnimation = Tween<double>(begin: fadeBegin, end: fadeEnd).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(begin: slideBegin, end: slideEnd).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    rotateAnimation = Tween<double>(begin: rotateBegin, end: rotateEnd).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );
  }

  void playForward() => animationController.forward();
  void playReverse() => animationController.reverse();
  void repeat() => animationController.repeat();
  void stop() => animationController.stop();

  void disposeAnimations() => animationController.dispose();
}
