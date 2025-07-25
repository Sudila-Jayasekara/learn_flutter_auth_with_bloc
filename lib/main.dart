import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_auth_with_bloc/core/di/%20service_locator.dart';
import 'package:learn_flutter_auth_with_bloc/core/router/app_router.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/theme.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>()..add(AuthStatusChecked()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Global navigation based on auth state
        if (state is AuthAuthenticated) {
          AppRouter.router.go('/home');
        } else if (state is AuthUnauthenticated) {
          AppRouter.router.go('/signin');
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Auth App',
        theme: AppTheme.darkThemeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
