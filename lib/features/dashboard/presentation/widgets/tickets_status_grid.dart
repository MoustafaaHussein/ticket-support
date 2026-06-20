import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_status.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';

class _TicketStat {
  const _TicketStat({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.count,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final int count;
}

class TicketsStatusGrid extends StatelessWidget {
  const TicketsStatusGrid({super.key});

  List<TicketModel> _ticketsFromState(TicketState state) {
    if (state is TicketLoaded) return state.tickets;
    return const [];
  }

  List<_TicketStat> _buildStats(BuildContext context, List<TicketModel> tickets) {
    final openCount =
        tickets.where((ticket) => ticket.status == TicketStatus.open).length;
    final inProgressCount = tickets
        .where((ticket) => ticket.status == TicketStatus.inProgress)
        .length;
    final closedCount =
        tickets.where((ticket) => ticket.status == TicketStatus.closed).length;

    return [
      _TicketStat(
        icon: Icons.confirmation_number_outlined,
        iconColor: context.colors.primary,
        label: 'Total Tickets',
        count: tickets.length,
      ),
      _TicketStat(
        icon: Icons.error_outline,
        iconColor: const Color(0xFFB22222),
        label: 'Open',
        count: openCount,
      ),
      _TicketStat(
        icon: Icons.access_time,
        iconColor: const Color(0xFF7B3F21),
        label: 'In Progress',
        count: inProgressCount,
      ),
      _TicketStat(
        icon: Icons.check_circle_outline,
        iconColor: const Color(0xFF7B3F21),
        label: 'Closed',
        count: closedCount,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(
      builder: (context, state) {
        final stats = _buildStats(context, _ticketsFromState(state));

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index];
            return TicketsStatus(
              icon: stat.icon,
              iconColor: stat.iconColor,
              count: stat.count,
              label: stat.label,
            );
          },
        );
      },
    );
  }
}
