// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> users = [
      {"name": "John Doe", "role": "Admin", "isOnline": true},
      {"name": "Alice Smith", "role": "Driver", "isOnline": false},
      {"name": "Michael Brown", "role": "Fleet Manager", "isOnline": true},
      {"name": "Sarah Johnson", "role": "Mechanic", "isOnline": true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Add User tapped")));
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: users.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final user = users[index];
          final bool isOnline = user["isOnline"] ?? false;

          return ListTile(
            leading: Stack(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isOnline ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            title: Row(
              children: [
                Expanded(child: Text(user["name"]!)),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isOnline
                        ? Colors.green.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isOnline ? Colors.green : Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    isOnline ? "Online" : "Offline",
                    style: TextStyle(
                      fontSize: 12,
                      color: isOnline ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Text("Role: ${user["role"]}"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("${user["name"]} tapped")));
            },
          );
        },
      ),
    );
  }
}
