import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String name = 'Soni';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('didUpdateWidget Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChildWidget(name: name),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = name == 'Soni' ? 'Bind' : 'Soni';
              });
            },
            child: const Text('Change Name'),
          ),
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final String name;
  const ChildWidget({super.key, required this.name});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 👇 Compare old and new values
    if (oldWidget.name != widget.name) {
      print("🔄 Name updated: ${oldWidget.name} ➡️ ${widget.name}");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build method");
    return Center(
      child: Text(
        'Hello, ${widget.name}!',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
