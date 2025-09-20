import 'package:flutter/material.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drivers")),
      body: const Center(child: Text("List of Drivers will appear here")),
    );
  }
}
