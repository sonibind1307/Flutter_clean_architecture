import 'package:animation/stream/broadcast_stream.dart';
import 'package:animation/stream/stream_screen.dart';
import 'package:animation/testfile/unit_test_screen.dart';
import 'package:animation/testfile/widget_test_screen.dart';
import 'package:flutter/material.dart';
import 'animation/animation_with_mixin.dart';
import 'animation/curve_tween_animation.dart';
import 'animation/hero_animated.dart';
import 'animation/main_animation.dart';
import 'bloc/user_screen.dart';
import 'features/app/app.dart';
import 'features/report/presentation/report_screen.dart';
import 'isolate/isolate_screen.dart';
import 'lifeCycle/didupdate_widget.dart';
import 'lifeCycle/dispose_widget.dart';
import 'lifeCycle/theme_toggle_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'method_channel/method_channel.dart';


void main() {
  ///test unit test
  // test("description", () {
  //   Counter counter = Counter();
  //   counter.increment();
  //   expect(counter.value, 1);
  //   counter.increment();
  //   expect(counter.value, 1);
  // });

  /* ///widget test
  testWidgets('Counter increments when button is pressed', (
    WidgetTester tester,
  ) async {
    // Arrange: Load the widget into the test environment
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CounterWidget())));

    // Assert: Check initial state
    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    // Act: Tap the increment button
    await tester.tap(find.byKey(Key('incrementButton')));
    await tester.pump(); // Rebuild the widget
    await tester.tap(find.byKey(Key('incrementButton')));
    await tester.pump();
    // Assert: Should show incremented count
    expect(find.text('Count: 2'), findsOneWidget);
    expect(find.text('Count: 0'), findsNothing);
  });*/

  // runApp(MaterialApp(home: CreateBookingPage()));
  // runApp(MaterialApp(home: HomePage()));

  runApp(const MyApp());
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Mail Screen'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MultiAnimationExample()),
              );
            },
            child: ListTile(title: Text("Mixin Animation")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MethodChannelScreen()),
              );
            },
            child: ListTile(title: Text("Method Channel")),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const IsolateScreen()),
              );
            },
            child: ListTile(title: Text("Isolate")),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => const CounterWidget()),
              // );
            },
            child: ListTile(title: Text("Widget Test")),
          ),
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

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ParentWidget()),
              );
            },
            child: ListTile(title: Text("didUpdateWidget")),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimationMainApp()),
              );
            },
            child: ListTile(title: const Text('animation')),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TweenCurvedAnimation()),
              );
            },
            child: ListTile(title: const Text('tween')),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HeroFirstPage()),
              );
            },
            child: ListTile(title: const Text('hero')),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HeroFirstPage()),
              );
            },
            child: ListTile(title: const Text('Ticker Provider')),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserScreenList()),
              );
            },
            child: ListTile(title: const Text('Bloc List')),
          ),
        ],
      ),
    );
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
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
