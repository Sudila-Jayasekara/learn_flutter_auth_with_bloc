import 'package:flutter/material.dart';
import 'package:learn_flutter_auth_with_bloc/core/router/app_router.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: AppTheme.darkThemeMode,
      routerConfig: AppRouter.router,
    );
  }
}