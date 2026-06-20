import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

abstract class TicketRepository {
  Future<int> createTicket(TicketModel ticket);
  Future<int> updateTicket(TicketModel ticket);
  Future<int> deleteTicket(int id);
  Future<List<TicketModel>> getAllTickets();
  Stream<List<TicketModel>> watchSearch(
    String query, {
    TicketStatus? status,
  });
}
