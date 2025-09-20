import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy trip data
    final List<Map<String, String>> trips = [
      {
        "vehicle": "Toyota Corolla - ABX123",
        "driver": "John Doe",
        "route": "Downtown → Airport",
        "date": "2025-09-01",
        "status": "Ongoing",
      },
      {
        "vehicle": "Ford Ranger - CDE456",
        "driver": "Alice Smith",
        "route": "University → City Center",
        "date": "2025-08-30",
        "status": "Completed",
      },
      {
        "vehicle": "Honda Civic - FGH789",
        "driver": "Michael Brown",
        "route": "Industrial Area → Suburbs",
        "date": "2025-08-28",
        "status": "Cancelled",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trips"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Add Trip tapped")));
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: trips.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final trip = trips[index];
          Color statusColor;
          switch (trip["status"]) {
            case "Completed":
              statusColor = Colors.green;
              break;
            case "Ongoing":
              statusColor = Colors.blue;
              break;
            case "Cancelled":
              statusColor = Colors.red;
              break;
            default:
              statusColor = Colors.grey;
          }

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Icon(Icons.alt_route, color: Colors.white),
              ),
              title: Text("${trip["vehicle"]}"),
              subtitle: Text(
                "Driver: ${trip["driver"]}\nRoute: ${trip["route"]}\nDate: ${trip["date"]}",
              ),
              isThreeLine: true,
              trailing: Text(
                trip["status"]!,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Viewing trip ${trip["vehicle"]}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
