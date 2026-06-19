import 'package:flutter/material.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/swipeable_ticket_item.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

class TicketsList extends StatefulWidget {
  const TicketsList({super.key});

  @override
  State<TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  late List<TicketModel> _tickets;

  @override
  void initState() {
    super.initState();
    _tickets = List<TicketModel>.from(tickets);
  }

  void _deleteTicket(String ticketId) {
    setState(() {
      _tickets.removeWhere((ticket) => ticket.id == ticketId);
      tickets.removeWhere((ticket) => ticket.id == ticketId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tickets.length,
      itemBuilder: (context, index) {
        final ticket = _tickets[index];
        return SwipeableTicketItem(
          key: ValueKey(ticket.id),
          ticket: ticket,
          onDelete: _deleteTicket,
        );
      },
    );
  }
}
