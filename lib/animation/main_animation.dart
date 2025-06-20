import 'package:flutter/material.dart';

import 'animated_conatiner.dart';
import 'animated_opacity.dart';
import 'animated_rotation.dart';
import 'animated_scale.dart';
import 'curve_tween_animation.dart';
import 'hero_animated.dart';



class AnimationMainApp extends StatefulWidget {
  const AnimationMainApp({super.key});

  @override
  State<AnimationMainApp> createState() => _AnimationMainAppState();
}

class _AnimationMainAppState extends State<AnimationMainApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AnimatedContainerExample(),
    const AnimatedOpacityExample(),
    const AnimatedRotationExample(),
    const ScaleAnimationExample(),
    const TweenCurvedAnimation(),
    const HeroFirstPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> _titles = [
    "Container",
    "Opacity",
    "Rotation",
    "Scale"
    "tween"
    "hero"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation: ${_titles[_selectedIndex]}")),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.crop_square), label: 'Container'),
          BottomNavigationBarItem(icon: Icon(Icons.opacity), label: 'Opacity'),
          BottomNavigationBarItem(icon: Icon(Icons.rotate_right), label: 'Rotation'),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out_map), label: 'Scale'),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out_map), label: 'curve+twee'),
          BottomNavigationBarItem(icon: Icon(Icons.zoom_out_map), label: 'hero'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
