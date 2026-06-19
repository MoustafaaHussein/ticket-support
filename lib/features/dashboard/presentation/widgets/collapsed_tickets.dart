import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_piorty_container.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

class CollapsedTickets extends StatelessWidget {
  const CollapsedTickets({
    super.key,
    required this.ticket,
    this.includeBottomMargin = true,
  });

  final TicketModel ticket;
  final bool includeBottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: includeBottomMargin ? const EdgeInsets.only(bottom: 16) : null,
      padding: const EdgeInsets.all(16),
      decoration: AppContainersStyle.ticketsPiorityContainerStyle(
        context,
        ticket.priority,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(ticket.id, style: AppTextStyles.bold16Secondary(context)),
              const Spacer(),
              TicketsPiortyContainer(piority: ticket.priority),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            ticket.title,
            style: AppTextStyles.bold18Primary(context),
          ),
          const SizedBox(height: 4),
          Text(
            ticket.description,
            style: AppTextStyles.medium14Secondary(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 4),
              Text("Mostafa", style: AppTextStyles.medium16Secondary(context)),
              Spacer(),
              Text(
                "15 Mins ago",
                style: AppTextStyles.medium16Secondary(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
