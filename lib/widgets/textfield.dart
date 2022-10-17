import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.hint, required this.label});
  final String? hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }
}
