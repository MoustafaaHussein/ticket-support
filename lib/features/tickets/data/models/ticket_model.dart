// data/models/ticket_model.dart
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/domain/entities/tickets_entity.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class TicketModel extends TicketsEntity {
  TicketModel({
    required super.id,
    required super.title,
    required super.description,
    required super.priority,
    required super.status,
    required super.createdAt,
  });

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      priority: TicketsPiority.values.byName(map['priority'] as String),
      status: TicketStatus.values.byName(map['status'] as String),
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap({bool includeId = true}) {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'priority': priority.name,
      'status': status.name,
      'created_at': createdAt.toIso8601String(),
    };
    if (includeId) map['id'] = id;
    return map;
  }
}
