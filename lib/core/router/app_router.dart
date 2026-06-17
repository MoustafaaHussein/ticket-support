import 'package:go_router/go_router.dart';
import 'package:ticket_app/features/dashboard/presentation/screens/home_view.dart';

class AppRouter {
  static const String khomeViewRoute = '/';
  static const String ticketsRoute = '/tickets';

  static final GoRouter router = GoRouter(
    initialLocation: khomeViewRoute,
    routes: [
      GoRoute(
        path: khomeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
