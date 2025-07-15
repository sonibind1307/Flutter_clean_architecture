import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final String currentRoute;

  const Sidebar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final List<SidebarItem> items = [
      SidebarItem(Icons.book, 'Bookings', '/bookings'),
      SidebarItem(Icons.insert_chart, 'Reports', '/reports'),
      SidebarItem(Icons.add, 'Create Booking', '/create-booking'),
    ];

    return Container(
      width: 200,
      color: const Color(0xFF002D72),
      child: Column(
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: const Text(
              'Pluto\nSOFTWARE',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                final selected = currentRoute == item.route;

                return Container(
                  color: selected ? Colors.orange : Colors.transparent,
                  child: ListTile(
                    leading: Icon(item.icon, color: Colors.white),
                    title: Text(item.label, style: const TextStyle(color: Colors.white)),
                    onTap: () => context.go(item.route),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem {
  final IconData icon;
  final String label;
  final String route;

  SidebarItem(this.icon, this.label, this.route);
}
