import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final String? Function(String?)? validator;

  const AuthField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      validator: validator ?? (value) {
        if (value == null || value.trim().isEmpty) {
          return '$hintText is missing!';
        }
        return null;
      },
      obscureText: isObscureText,
      obscuringCharacter: '*',
    );
  }
}