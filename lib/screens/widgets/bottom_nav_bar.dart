import 'package:flutter/material.dart';
import 'package:fleetflow/styles/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10.0, spreadRadius: 2.0),
        ],
      ),
      height: 70,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: null, // Add your navigation logic here
            icon: Icon(Icons.home_outlined, color: AppColors.primary),
          ),
          IconButton(
            onPressed: null, // Add your navigation logic here
            icon: Icon(Icons.car_rental_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: null, // Add your navigation logic here
            icon: Icon(Icons.settings_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: null, // Add your navigation logic here
            icon: Icon(Icons.person_outline, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
