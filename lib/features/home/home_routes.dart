import 'package:go_router/go_router.dart';
import 'package:learn_flutter_auth_with_bloc/features/home/home_page.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    )
  ];
}