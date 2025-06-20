import 'package:flutter/material.dart';

class ThemeToggleScreen extends StatefulWidget {
  final bool isDark;
  final Function(bool) onToggle;

  const ThemeToggleScreen({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

  @override
  State<ThemeToggleScreen> createState() => _ThemeToggleScreenState();
}

class _ThemeToggleScreenState extends State<ThemeToggleScreen>
    with SingleTickerProviderStateMixin {
  late Brightness brightness;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    brightness = Brightness.light;

    // 🎞️ Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentBrightness = MediaQuery.of(context).platformBrightness;

    if (brightness != currentBrightness) {
      brightness = currentBrightness;
      print("📱 System Theme changed to: ${brightness == Brightness.dark ? 'Dark' : 'Light'}");

      // Start animation
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Theme')),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDark ? Icons.nightlight_round : Icons.wb_sunny,
                size: 60,
                color: isDark ? Colors.amber : Colors.blueAccent,
              ),
              const SizedBox(height: 16),
              Text(
                'Current Theme: ${isDark ? "Dark" : "Light"}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Switch(
                value: widget.isDark,
                onChanged: (val) {
                  widget.onToggle(val);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
