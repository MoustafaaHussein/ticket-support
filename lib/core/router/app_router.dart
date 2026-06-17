import 'package:go_router/go_router.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/home_view.dart';

class AppRouter {
  static const String khomeViewRoute = '/home';
  static const String ticketsRoute = '/tickets';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    ],
  );
}
