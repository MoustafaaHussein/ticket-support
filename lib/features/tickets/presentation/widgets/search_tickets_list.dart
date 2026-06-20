import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/swipeable_ticket_item.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_state.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';

class SearchTicketsList extends StatelessWidget {
  const SearchTicketsList({super.key});

  void _deleteTicket(BuildContext context, int ticketId) {
    context.read<TicketCubit>().deleteTicket(ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (previous, current) => current is SearchError,
      listener: (context, state) {
        if (state is SearchError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is SearchLoading || state is SearchInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchError) {
          return Center(
            child: Text(
              state.error,
              style: AppTextStyles.medium16Secondary(context),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is SearchEmpty) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.medium16Secondary(context),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is! SearchLoaded) {
          return const SizedBox.shrink();
        }

        final tickets = List.of(state.tickets)
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            final ticket = tickets[index];
            return GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.kticketDetailsViewRoute, extra: ticket);
              },
              child: SwipeableTicketItem(
                key: ValueKey(ticket.id),
                ticket: ticket,
                onDelete: (id) => _deleteTicket(context, id),
              ),
            );
          },
        );
      },
    );
  }
}
