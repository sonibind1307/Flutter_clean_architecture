import 'package:flutter/material.dart';

import 'sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  final String location;

  const DashboardLayout({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(currentRoute: location),
          Expanded(child: child),
        ],
      ),
    );
  }
}
