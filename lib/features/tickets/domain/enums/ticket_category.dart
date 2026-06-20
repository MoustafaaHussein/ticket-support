enum TicketCategory { technical, billing, general }

extension TicketCategoryExtension on TicketCategory {
  String get displayName => switch (this) {
    TicketCategory.technical => 'Technical',
    TicketCategory.billing => 'Billing',
    TicketCategory.general => 'General',
  };
}
