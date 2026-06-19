enum TicketStatus { open, inProgress, closed }

extension TicketStatusExtension on TicketStatus {
  String get displayName => switch (this) {
    TicketStatus.open => 'Open',
    TicketStatus.inProgress => 'In Progress',
    TicketStatus.closed => 'Closed',
  };
}
