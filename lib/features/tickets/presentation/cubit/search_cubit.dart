import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/data/models/tickets_status_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/domain/repositories/ticket_repository.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required TicketRepository ticketRepository})
    : _ticketRepository = ticketRepository,
      super(SearchInitial());

  final TicketRepository _ticketRepository;
  StreamSubscription<List<TicketModel>>? _subscription;
  String _query = '';
  TicketStatus? _status;
  TicketCategory? _category;

  void startWatching() {
    _listenToTickets();
  }

  void updateQuery(String query) {
    _query = query;
    _listenToTickets();
  }

  void filterByStatus(TicketsStatusModel statusModel) {
    _status = statusModel.toTicketStatus;
    _listenToTickets();
  }

  void filterByCategory(TicketCategory? category) {
    _category = category;
    _listenToTickets();
  }

  void _listenToTickets() {
    _subscription?.cancel();
    emit(SearchLoading());

    _subscription = _ticketRepository
        .watchSearch(_query, status: _status, category: _category)
        .listen(
          (tickets) {
            if (tickets.isEmpty) {
              emit(
                SearchEmpty(
                  message: _emptyMessage,
                  query: _query,
                  status: _status,
                  category: _category,
                ),
              );
            } else {
              emit(
                SearchLoaded(
                  tickets: tickets,
                  query: _query,
                  status: _status,
                  category: _category,
                ),
              );
            }
          },
          onError: (Object error) {
            emit(SearchError(error: error.toString()));
          },
        );
  }

  String get _emptyMessage {
    final categoryLabel = _category?.displayName.toLowerCase();
    final statusLabel = _status?.displayName.toLowerCase();

    if (_query.isNotEmpty && statusLabel != null && categoryLabel != null) {
      return 'No $categoryLabel $statusLabel tickets match your search.';
    }
    if (_query.isNotEmpty && categoryLabel != null) {
      return 'No $categoryLabel tickets match your search.';
    }
    if (_query.isNotEmpty && statusLabel != null) {
      return 'No $statusLabel tickets match your search.';
    }
    if (_query.isNotEmpty) {
      return 'No tickets match your search.';
    }
    if (statusLabel != null && categoryLabel != null) {
      return 'No $categoryLabel $statusLabel tickets yet.';
    }
    if (categoryLabel != null) {
      return 'No $categoryLabel tickets yet.';
    }
    if (statusLabel != null) {
      return 'No $statusLabel tickets yet.';
    }
    return 'No tickets yet. Create your first ticket to get started.';
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
