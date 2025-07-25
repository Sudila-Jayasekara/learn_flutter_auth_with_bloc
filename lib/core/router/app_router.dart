import 'package:go_router/go_router.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/presentation/routers/auth_routes.dart';
import 'package:learn_flutter_auth_with_bloc/features/home/home_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/signin',
    routes: [
      ...AuthRoutes.routes,
      ...HomeRoutes.routes,

    ]
  );
}