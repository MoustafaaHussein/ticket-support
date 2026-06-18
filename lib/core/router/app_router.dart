import 'package:go_router/go_router.dart';
import 'package:ticket_app/features/dashboard/presentation/screens/home_view.dart';
import 'package:ticket_app/features/tickets/presentation/screens/create_ticket_view.dart';

class AppRouter {
  static const String khomeViewRoute = '/';
  static const String kcreateTicketViewRoute = '/create-ticket';

  static final GoRouter router = GoRouter(
    initialLocation: khomeViewRoute,
    routes: [
      GoRoute(
        path: khomeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kcreateTicketViewRoute,
        builder: (context, state) => const CreateTicketView(),
      ),
    ],
  );
}
