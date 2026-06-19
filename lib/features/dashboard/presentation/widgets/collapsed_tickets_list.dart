import 'package:flutter/material.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/collapsed_tickets.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

class CollapsedTicketsList extends StatelessWidget {
  const CollapsedTicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickets.length - 3,
      itemBuilder: (context, index) {
        return CollapsedTickets(ticket: tickets[index]);
      },
    );
  }
}
