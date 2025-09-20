import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'New Trip Assigned',
      'body': 'A new trip has been assigned to driver John Smith.',
      'time': 'Just now',
      'icon': Icons.local_shipping,
      'color': Colors.blue,
    },
    {
      'title': 'Low Fuel Alert',
      'body': 'Vehicle CAR-001 has less than 10% fuel. Please refuel.',
      'time': '5 minutes ago',
      'icon': Icons.gas_meter,
      'color': Colors.orange,
    },
    {
      'title': 'Scheduled Maintenance',
      'body': 'Maintenance for VAN-042 is scheduled for tomorrow.',
      'time': '1 hour ago',
      'icon': Icons.build,
      'color': Colors.red,
    },
    {
      'title': 'Vehicle Status Change',
      'body': 'Vehicle TRUCK-101 status changed to "Idle".',
      'time': '3 hours ago',
      'icon': Icons.directions_car,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                notification['icon'],
                color: notification['color'],
                size: 32,
              ),
              title: Text(
                notification['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${notification['body']}\n${notification['time']}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              isThreeLine: true,
              onTap: () {
                // Handle notification tap, e.g., navigate to a specific detail page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped on: ${notification['title']}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
