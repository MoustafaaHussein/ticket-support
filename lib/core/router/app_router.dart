import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/utils/service_locator.dart';
import 'package:ticket_app/features/dashboard/presentation/screens/home_view.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/screens/all_tickets_view.dart';
import 'package:ticket_app/features/tickets/presentation/screens/create_ticket_view.dart';
import 'package:ticket_app/features/tickets/presentation/screens/ticket_details_view.dart';

class AppRouter {
  static const String khomeViewRoute = '/';
  static const String kcreateTicketViewRoute = '/create_ticket';
  static const String kallTicketsViewRoute = '/all_tickets';
  static const String kticketDetailsViewRoute = '/ticket_details';

  static final GoRouter router = GoRouter(
    initialLocation: khomeViewRoute,
    routes: [
      GoRoute(
        path: khomeViewRoute,
        builder: (context, state) => BlocProvider<TicketCubit>.value(
          value: sl<TicketCubit>(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kcreateTicketViewRoute,
        builder: (context, state) => BlocProvider<TicketCubit>.value(
          value: sl<TicketCubit>(),
          child: const CreateTicketView(),
        ),
      ),
      GoRoute(
        path: kallTicketsViewRoute,
        builder: (context, state) => BlocProvider<TicketCubit>.value(
          value: sl<TicketCubit>(),
          child: const AllTicketsView(),
        ),
      ),
      GoRoute(
        path: kticketDetailsViewRoute,
        builder: (context, state) => BlocProvider<TicketCubit>.value(
          value: sl<TicketCubit>(),
          child: TicketDetailsView(ticketModel: state.extra as TicketModel),
        ),
      ),
    ],
  );
}
