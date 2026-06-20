import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<TicketModel> tickets;
  final String query;
  final TicketStatus? status;

  SearchLoaded({
    required this.tickets,
    required this.query,
    this.status,
  });
}

class SearchEmpty extends SearchState {
  final String message;
  final String query;
  final TicketStatus? status;

  SearchEmpty({
    required this.message,
    required this.query,
    this.status,
  });
}

class SearchError extends SearchState {
  final String error;

  SearchError({required this.error});
}
