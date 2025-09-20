import 'package:flutter/material.dart';

class AccidentsPage extends StatelessWidget {
  const AccidentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy accident data
    final List<Map<String, String>> accidents = [
      {
        "vehicle": "Toyota Corolla - ABX123",
        "date": "2025-08-12",
        "status": "Reported",
      },
      {
        "vehicle": "Ford Ranger - CDE456",
        "date": "2025-07-30",
        "status": "Resolved",
      },
      {
        "vehicle": "Honda Civic - FGH789",
        "date": "2025-07-18",
        "status": "Under Investigation",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accidents"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Report Accident tapped")),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: accidents.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final accident = accidents[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.warning, color: Colors.white),
            ),
            title: Text(accident["vehicle"]!),
            subtitle: Text("Date: ${accident["date"]}"),
            trailing: Text(
              accident["status"]!,
              style: TextStyle(
                color: accident["status"] == "Resolved"
                    ? Colors.green
                    : (accident["status"] == "Reported"
                          ? Colors.orange
                          : Colors.red),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Viewing ${accident["vehicle"]}")),
              );
            },
          );
        },
      ),
    );
  }
}
