import 'package:flutter/material.dart';
import 'package:fleetflow/styles/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: icon != null ? Icon(icon, color: AppColors.primary) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // No border line
        ),
      ),
    );
  }
}
