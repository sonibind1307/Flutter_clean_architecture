import 'package:animation/stream/broadcast_stream.dart';
import 'package:animation/stream/stream_screen.dart';
import 'package:animation/testfile/unit_test_screen.dart';
import 'package:flutter/material.dart';
import 'animation/curve_tween_animation.dart';
import 'animation/hero_animated.dart';
import 'animation/main_animation.dart';
import 'lifeCycle/didupdate_widget.dart';
import 'lifeCycle/dispose_widget.dart';
import 'lifeCycle/theme_toggle_screen.dart';
import 'package:test/test.dart';

void main() {

  test("description", (){
    Counter counter = Counter();
    counter.increment();
    expect(counter.value, 1);
    counter.increment();
    expect(counter.value, 1 );
  });
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mail Screen')),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UnitTestScreen()),
              );
            },
            child: ListTile(title: Text("Unit Test")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StreamScreen()),
              );
            },
            child: ListTile(title: Text("Stream")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BroadStreamScreen()),
              );
            },
            child: ListTile(title: Text("BroadCast Stream")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
            child: ListTile(title: Text("Dispose")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyApp()),
              );
            },
            child: ListTile(title: Text("DisdependenciesChange")),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ParentWidget()),
              );
            },
            child: const Text('didUpdateWidget'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimationMainApp()),
              );
            },
            child: const Text('animation'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TweenCurvedAnimation()),
              );
            },
            child: const Text('tween'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HeroFirstPage()),
              );
            },
            child: const Text('hero'),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Toggle Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      // Controlled by user
      home: ThemeToggleScreen(
        isDark: _themeMode == ThemeMode.dark,
        onToggle: toggleTheme,
      ),
    );
  }
}
