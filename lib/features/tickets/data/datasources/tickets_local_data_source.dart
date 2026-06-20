import 'package:sqflite/sqflite.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

abstract class TicketsLocalDataSource {
  Future<int> createTicket(TicketModel ticket);
  Future<int> updateTicket(TicketModel ticket);
  Future<int> deleteTicket(int id);
  Future<List<TicketModel>> getAllTickets();
  Future<List<TicketModel>> searchTickets(
    String query, {
    TicketStatus? status,
  });
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

  @override
  Future<List<TicketModel>> searchTickets(
    String query, {
    TicketStatus? status,
  }) async {
    final q = query.trim();
    final whereClauses = <String>[];
    final whereArgs = <Object?>[];

    if (q.isNotEmpty) {
      whereClauses.add(
        '(title LIKE ? OR description LIKE ? OR CAST(id AS TEXT) LIKE ?)',
      );
      whereArgs.addAll(['$q%', '$q%', '$q%']);
    }

    if (status != null) {
      whereClauses.add('status = ?');
      whereArgs.add(status.name);
    }

    final maps = await _database.query(
      'tickets',
      where: whereClauses.isEmpty ? null : whereClauses.join(' AND '),
      whereArgs: whereArgs.isEmpty ? null : whereArgs,
    );
    return maps.map((map) => TicketModel.fromMap(map)).toList();
  }
}
