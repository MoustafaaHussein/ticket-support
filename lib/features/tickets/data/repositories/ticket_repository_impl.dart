import 'package:ticket_app/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketsLocalDataSource _ticketsLocalDataSource;

  TicketRepositoryImpl({required TicketsLocalDataSource ticketsLocalDataSource})
    : _ticketsLocalDataSource = ticketsLocalDataSource;

  @override
  Future<int> createTicket(TicketModel ticket) async {
    return await _ticketsLocalDataSource.createTicket(ticket);
  }

  @override
  Future<int> deleteTicket(int id) async {
    return await _ticketsLocalDataSource.deleteTicket(id);
  }

  @override
  Future<List<TicketModel>> getAllTickets() async {
    return await _ticketsLocalDataSource.getAllTickets();
  }

  @override
  Future<int> updateTicket(TicketModel ticket) async {
    return await _ticketsLocalDataSource.updateTicket(ticket);
  }
}
