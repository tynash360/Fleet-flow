import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy maintenance data
    final List<Map<String, String>> maintenanceList = [
      {
        "vehicle": "Toyota Corolla - ABX123",
        "driver": "John Doe",
        "type": "Oil Change",
        "date": "2025-09-05",
        "status": "Scheduled",
      },
      {
        "vehicle": "Ford Ranger - CDE456",
        "driver": "Alice Smith",
        "type": "Brake Check",
        "date": "2025-09-01",
        "status": "Completed",
      },
      {
        "vehicle": "Honda Civic - FGH789",
        "driver": "Michael Brown",
        "type": "Tire Replacement",
        "date": "2025-09-03",
        "status": "In Progress",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maintenance"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add Maintenance tapped")),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: maintenanceList.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = maintenanceList[index];
          Color statusColor;
          switch (item["status"]) {
            case "Completed":
              statusColor = Colors.green;
              break;
            case "Scheduled":
              statusColor = Colors.orange;
              break;
            case "In Progress":
              statusColor = Colors.blue;
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
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.build, color: Colors.white),
              ),
              title: Text(item["vehicle"]!),
              subtitle: Text(
                "Driver: ${item["driver"]}\nType: ${item["type"]}\nDate: ${item["date"]}",
              ),
              isThreeLine: true,
              trailing: Text(
                item["status"]!,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Viewing maintenance for ${item["vehicle"]}"),
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
