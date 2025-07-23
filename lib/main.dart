import 'package:flutter/material.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/theme.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/pages/signin_page.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: AppTheme.darkThemeMode,
      home: const SigninPage()
    );
  }
}