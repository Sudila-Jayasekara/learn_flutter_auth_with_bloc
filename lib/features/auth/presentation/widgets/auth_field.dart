import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
    );
  }
}
