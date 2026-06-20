import 'dart:async';

import 'package:ticket_app/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  TicketRepositoryImpl({required TicketsLocalDataSource ticketsLocalDataSource})
    : _ticketsLocalDataSource = ticketsLocalDataSource;

  final TicketsLocalDataSource _ticketsLocalDataSource;
  final _ticketsChanged = StreamController<void>.broadcast();

  void _notifyTicketsChanged() {
    if (!_ticketsChanged.isClosed) {
      _ticketsChanged.add(null);
    }
  }

  @override
  Future<int> createTicket(TicketModel ticket) async {
    final id = await _ticketsLocalDataSource.createTicket(ticket);
    _notifyTicketsChanged();
    return id;
  }

  @override
  Future<int> deleteTicket(int id) async {
    final result = await _ticketsLocalDataSource.deleteTicket(id);
    _notifyTicketsChanged();
    return result;
  }

  @override
  Future<List<TicketModel>> getAllTickets() async {
    return await _ticketsLocalDataSource.getAllTickets();
  }

  @override
  Future<int> updateTicket(TicketModel ticket) async {
    final result = await _ticketsLocalDataSource.updateTicket(ticket);
    _notifyTicketsChanged();
    return result;
  }

  @override
  Stream<List<TicketModel>> watchSearch(
    String query, {
    TicketStatus? status,
    TicketCategory? category,
  }) async* {
    yield await _ticketsLocalDataSource.searchTickets(
      query,
      status: status,
      category: category,
    );
    await for (final _ in _ticketsChanged.stream) {
      yield await _ticketsLocalDataSource.searchTickets(
        query,
        status: status,
        category: category,
      );
    }
  }
}
