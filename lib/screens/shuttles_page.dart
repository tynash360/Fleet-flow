import 'package:flutter/material.dart';

class ShuttlesPage extends StatelessWidget {
  const ShuttlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy shuttle data
    final List<Map<String, String>> shuttles = [
      {
        "name": "Shuttle 1",
        "route": "Downtown → Airport",
        "capacity": "15",
        "status": "Active",
      },
      {
        "name": "Shuttle 2",
        "route": "University → City Center",
        "capacity": "20",
        "status": "In Service",
      },
      {
        "name": "Shuttle 3",
        "route": "Industrial Area → Suburbs",
        "capacity": "12",
        "status": "Under Maintenance",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shuttles"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add Shuttle tapped")),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: shuttles.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final shuttle = shuttles[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.directions_bus, color: Colors.white),
              ),
              title: Text(shuttle["name"]!),
              subtitle: Text(
                "${shuttle["route"]}\nCapacity: ${shuttle["capacity"]} seats",
              ),
              isThreeLine: true,
              trailing: Text(
                shuttle["status"]!,
                style: TextStyle(
                  color: shuttle["status"] == "Active"
                      ? Colors.green
                      : (shuttle["status"] == "In Service"
                            ? Colors.blue
                            : Colors.red),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Viewing ${shuttle["name"]}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
