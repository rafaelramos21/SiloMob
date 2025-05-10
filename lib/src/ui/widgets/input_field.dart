import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function(String) onChanged;

  InputField({required this.label, this.obscureText = false, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }
}