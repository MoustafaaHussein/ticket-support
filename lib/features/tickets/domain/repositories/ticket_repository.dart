import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

abstract class TicketRepository {
  Future<int> createTicket(TicketModel ticket);
  Future<int> updateTicket(TicketModel ticket);
  Future<int> deleteTicket(int id);
  Future<List<TicketModel>> getAllTickets();
}
