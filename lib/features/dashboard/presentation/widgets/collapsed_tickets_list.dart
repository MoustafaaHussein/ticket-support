import 'package:flutter/material.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/collapsed_tickets.dart';

class CollapsedTicketsList extends StatelessWidget {
  const CollapsedTicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CollapsedTickets();
      },
    );
  }
}
