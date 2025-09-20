import 'package:flutter/material.dart';

class LiveTrackingPage extends StatelessWidget {
  const LiveTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy live tracking data
    final List<Map<String, String>> vehicles = [
      {
        "vehicle": "Toyota Corolla - ABX123",
        "driver": "John Doe",
        "location": "Downtown",
        "status": "On Route",
      },
      {
        "vehicle": "Ford Ranger - CDE456",
        "driver": "Alice Smith",
        "location": "City Center",
        "status": "Idle",
      },
      {
        "vehicle": "Honda Civic - FGH789",
        "driver": "Michael Brown",
        "location": "Airport",
        "status": "On Route",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Tracking"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Refreshing live data...")),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: vehicles.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          Color statusColor = vehicle["status"] == "On Route"
              ? Colors.green
              : Colors.orange;

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.directions_car, color: Colors.white),
              ),
              title: Text(vehicle["vehicle"]!),
              subtitle: Text(
                "Driver: ${vehicle["driver"]}\nLocation: ${vehicle["location"]}",
              ),
              isThreeLine: true,
              trailing: Text(
                vehicle["status"]!,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Tracking ${vehicle["vehicle"]}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
