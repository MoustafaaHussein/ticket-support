import 'package:sqflite/sqflite.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

abstract class TicketsLocalDataSource {
  Future<int> createTicket(TicketModel ticket);
  Future<int> updateTicket(TicketModel ticket);
  Future<int> deleteTicket(int id);
  Future<List<TicketModel>> getAllTickets();
}

class TicketsLocalDataSourceImpl implements TicketsLocalDataSource {
  final Database _database;

  TicketsLocalDataSourceImpl({required Database database})
    : _database = database;
  @override
  Future<int> createTicket(TicketModel ticket) async {
    return await _database.insert('tickets', ticket.toMap(includeId: false));
  }

  @override
  Future<int> deleteTicket(int id) async {
    return await _database.delete('tickets', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<TicketModel>> getAllTickets() async {
    final maps = await _database.query('tickets');
    return maps.map((map) => TicketModel.fromMap(map)).toList();
  }

  @override
  Future<int> updateTicket(TicketModel ticket) => _database.update(
    'tickets',
    ticket.toMap(),
    where: 'id = ?',
    whereArgs: [ticket.id],
  );
}
