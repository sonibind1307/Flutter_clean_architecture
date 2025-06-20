import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: DeactivatingWidget()),
    );
  }
}

class DeactivatingWidget extends StatefulWidget {
  const DeactivatingWidget({super.key});

  @override
  State<DeactivatingWidget> createState() => _DeactivatingWidgetState();
}

class _DeactivatingWidgetState extends State<DeactivatingWidget> {
  @override
  void initState() {
    super.initState();
    print("✅ Widget initialized");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("🔌 Widget deactivated");
  }

  @override
  void dispose() {
    super.dispose();
    print("🗑️ Widget disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This is a stateful widget'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SecondScreen()));
          },
          child: const Text('Go to Second Screen'),
        ),
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
