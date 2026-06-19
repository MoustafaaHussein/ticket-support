class TicketsStatusModel {
  final String status;

  TicketsStatusModel({required this.status});
}

List<TicketsStatusModel> ticketsStatus = [
  TicketsStatusModel(status: 'All'),
  TicketsStatusModel(status: 'Open'),
  TicketsStatusModel(status: 'In Progress'),
  TicketsStatusModel(status: 'Closed'),
];
