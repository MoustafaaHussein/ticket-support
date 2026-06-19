import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/models/tickets_status_model.dart';

class TicketModel {
  final String id;
  final String title;
  final String description;
  final TicketsStatusModel status;
  final TicketsPiority priority;
  final DateTime createdAt;

  TicketModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.createdAt,
  });
}

List<TicketModel> tickets = [
  TicketModel(
    id: 'SD-#123456',
    title: 'Api connection timeout',
    description:
        'I am getting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Open'),
    priority: TicketsPiority.low,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123457',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'In Progress'),
    priority: TicketsPiority.medium,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123458',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Closed'),
    priority: TicketsPiority.high,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123459',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Open'),
    priority: TicketsPiority.low,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123460',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'In Progress'),
    priority: TicketsPiority.medium,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123461',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Closed'),
    priority: TicketsPiority.high,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123462',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Open'),
    priority: TicketsPiority.low,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123463',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'In Progress'),
    priority: TicketsPiority.medium,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123464',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Closed'),
    priority: TicketsPiority.high,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123465',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Open'),
    priority: TicketsPiority.low,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123466',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'In Progress'),
    priority: TicketsPiority.medium,
    createdAt: DateTime.now(),
  ),
  TicketModel(
    id: 'SD-#123467',
    title: 'Server connection timeout in APAC',
    description:
        'Users reporting 504 Gateway errors when trying to connect to the API',
    status: TicketsStatusModel(status: 'Closed'),
    priority: TicketsPiority.high,
    createdAt: DateTime.now(),
  ),
];
