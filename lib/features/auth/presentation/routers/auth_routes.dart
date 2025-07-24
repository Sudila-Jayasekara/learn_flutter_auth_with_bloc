import 'package:go_router/go_router.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/pages/signin_page.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/pages/signup_page.dart';

class AuthRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const SigninPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupPage(),
    ),
  ];
}