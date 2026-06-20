import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class TicketsStatusModel {
  final String status;

  TicketsStatusModel({required this.status});
}

extension TicketsStatusModelX on TicketsStatusModel {
  TicketStatus? get toTicketStatus => switch (status) {
    'Open' => TicketStatus.open,
    'In Progress' => TicketStatus.inProgress,
    'Closed' => TicketStatus.closed,
    _ => null,
  };
}

List<TicketsStatusModel> ticketsStatus = [
  TicketsStatusModel(status: 'All'),
  TicketsStatusModel(status: 'Open'),
  TicketsStatusModel(status: 'In Progress'),
  TicketsStatusModel(status: 'Closed'),
];
