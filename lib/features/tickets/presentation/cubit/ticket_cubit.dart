import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/repositories/ticket_repository.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit({required TicketRepository ticketRepository})
    : _ticketRepository = ticketRepository,
      super(TicketInitial());

  final TicketRepository _ticketRepository;

  static const _emptyMessage =
      'No tickets yet. Create your first ticket to get started.';

  Future<void> loadTickets() async {
    emit(TicketLoading());
    await _fetchTickets();
  }

  Future<void> createTicket(TicketModel ticket) async {
    try {
      emit(TicketLoading());
      final id = await _ticketRepository.createTicket(ticket);
      emit(TicketCreated(id: id));
    } catch (e) {
      emit(TicketError(error: e.toString()));
    }
  }

  Future<void> updateTicket(TicketModel ticket) async {
    try {
      emit(TicketLoading());
      final id = await _ticketRepository.updateTicket(ticket);
      emit(TicketUpdated(id: id));
      await _fetchTickets();
    } catch (e) {
      emit(TicketError(error: e.toString()));
    }
  }

  Future<void> deleteTicket(int id) async {
    try {
      emit(TicketLoading());
      await _ticketRepository.deleteTicket(id);
      emit(TicketDeleted(id: id));
      await _fetchTickets();
    } catch (e) {
      emit(TicketError(error: e.toString()));
    }
  }

  Future<void> _fetchTickets() async {
    try {
      final tickets = await _ticketRepository.getAllTickets();
      if (tickets.isEmpty) {
        emit(TicketsEmpty(message: _emptyMessage));
      } else {
        emit(TicketLoaded(tickets: tickets));
      }
    } catch (e) {
      emit(TicketError(error: e.toString()));
    }
  }
}
