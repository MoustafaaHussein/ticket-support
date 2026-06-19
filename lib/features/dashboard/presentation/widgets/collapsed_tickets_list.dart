import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/collapsed_tickets.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';

class CollapsedTicketsList extends StatefulWidget {
  const CollapsedTicketsList({super.key});

  @override
  State<CollapsedTicketsList> createState() => _CollapsedTicketsListState();
}

class _CollapsedTicketsListState extends State<CollapsedTicketsList> {
  @override
  void initState() {
    super.initState();
    context.read<TicketCubit>().loadTickets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(
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

        final recentTickets = List.of(state.tickets)
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        final visibleTickets = recentTickets.take(3).toList();

        return ListView.builder(
          itemCount: recentTickets.length,
          itemBuilder: (context, index) {
            return CollapsedTickets(ticket: visibleTickets[index]);
          },
        );
      },
    );
  }
}
