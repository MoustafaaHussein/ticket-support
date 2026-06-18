class TicketCategoryModel {
  final String id;
  final String name;

  TicketCategoryModel({required this.id, required this.name});
}

List<TicketCategoryModel> ticketCategories = [
  TicketCategoryModel(id: '1', name: 'Technical'),
  TicketCategoryModel(id: '2', name: 'Billing'),
  TicketCategoryModel(id: '3', name: 'General'),
];
