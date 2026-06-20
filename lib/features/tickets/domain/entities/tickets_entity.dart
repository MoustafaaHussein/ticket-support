import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class TicketsEntity {
  final int id;
  final String title;
  final String description;
  final TicketsPiority priority;
  final TicketStatus status;
  final TicketCategory category;
  final DateTime createdAt;

  TicketsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.category,
    required this.createdAt,
  });
}
