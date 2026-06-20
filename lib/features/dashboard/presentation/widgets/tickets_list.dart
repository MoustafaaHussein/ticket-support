import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/swipeable_ticket_item.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';

class TicketsList extends StatefulWidget {
  const TicketsList({super.key});

  @override
  State<TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  @override
  void initState() {
    super.initState();
    context.read<TicketCubit>().loadTickets();
  }

  void _deleteTicket(int ticketId) {
    context.read<TicketCubit>().deleteTicket(ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listenWhen: (previous, current) => current is TicketError,
      listener: (context, state) {
        if (state is TicketError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is TicketLoading || state is TicketInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TicketError) {
          return Center(
            child: Text(
              state.error,
              style: AppTextStyles.medium16Secondary(context),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is TicketsEmpty) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.medium16Secondary(context),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is! TicketLoaded) {
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
                onDelete: _deleteTicket,
              ),
            );
          },
        );
      },
    );
  }
}
