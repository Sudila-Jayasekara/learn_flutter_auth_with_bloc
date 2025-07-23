import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  const AuthButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonText),
    );
  }
}
