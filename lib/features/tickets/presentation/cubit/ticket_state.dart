import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final List<TicketModel> tickets;
  TicketLoaded({required this.tickets});
}

class TicketError extends TicketState {
  final String error;
  TicketError({required this.error});
}

class TicketCreated extends TicketState {
  final int id;
  TicketCreated({required this.id});
}

class TicketUpdated extends TicketState {
  final int id;
  TicketUpdated({required this.id});
}

class TicketDeleted extends TicketState {
  final int id;
  TicketDeleted({required this.id});
}

class TicketsEmpty extends TicketState {
  final String message;
  TicketsEmpty({required this.message});
}
