import 'package:flutter/services.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

Future<void> copyTicketToClipboard(TicketModel ticket) async {
  await Clipboard.setData(ClipboardData(text: ticket.TickettoJson(ticket)));
}
