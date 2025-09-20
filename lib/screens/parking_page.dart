import 'package:flutter/material.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy parking slots
    final List<Map<String, String>> parkingSlots = [
      {"slot": "A1", "location": "Main Gate", "status": "Available"},
      {"slot": "A2", "location": "Main Gate", "status": "Occupied"},
      {"slot": "B1", "location": "North Wing", "status": "Reserved"},
      {"slot": "B2", "location": "North Wing", "status": "Available"},
      {"slot": "C1", "location": "South Wing", "status": "Occupied"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add Parking Slot tapped")),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: parkingSlots.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final slot = parkingSlots[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: slot["status"] == "Available"
                    ? Colors.green
                    : (slot["status"] == "Occupied"
                          ? Colors.red
                          : Colors.orange),
                child: const Icon(Icons.local_parking, color: Colors.white),
              ),
              title: Text("Slot: ${slot["slot"]}"),
              subtitle: Text("Location: ${slot["location"]}"),
              trailing: Text(
                slot["status"]!,
                style: TextStyle(
                  color: slot["status"] == "Available"
                      ? Colors.green
                      : (slot["status"] == "Occupied"
                            ? Colors.red
                            : Colors.orange),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Viewing slot ${slot["slot"]}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
