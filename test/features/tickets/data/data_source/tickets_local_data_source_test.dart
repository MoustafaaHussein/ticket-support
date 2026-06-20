import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

void main() {
  late TicketsLocalDataSource dataSource;
  late Database database;
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  setUp(() async {
    database = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await database.execute('''
   CREATE TABLE tickets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    priority TEXT NOT NULL,
    status TEXT NOT NULL,
    category TEXT NOT NULL DEFAULT 'general',
    created_at TEXT NOT NULL
   );
   ''');
    dataSource = TicketsLocalDataSourceImpl(database: database);
  });
  tearDown(() async {
    await database.close();
  });

  TicketModel buildTicket({
    int id = 1,
    String title = 'Test Ticket',
    TicketCategory category = TicketCategory.general,
    TicketStatus status = TicketStatus.open,
  }) {
    return TicketModel(
      id: id,
      title: title,
      description: 'Test Description',
      priority: TicketsPiority.low,
      status: status,
      category: category,
      createdAt: DateTime.now(),
    );
  }

  group('Tickets Local Data Source Tests', () {
    test('should delete a ticket', () async {
      final ticket = buildTicket();
      final id = await dataSource.createTicket(ticket);
      expect(id, greaterThan(0));

      final deletedCount = await dataSource.deleteTicket(id);
      expect(deletedCount, 1);

      final remaining = await dataSource.getAllTickets();
      expect(remaining, isEmpty);
    });
    test('should return all tickets', () async {
      final tickets = List<TicketModel>.generate(
        10,
        (index) => buildTicket(
          id: index + 1,
          title: 'Test Ticket $index',
        ),
      );
      for (var ticket in tickets) {
        await dataSource.createTicket(ticket);
      }
      final result = await dataSource.getAllTickets();
      expect(result.length, 10);
      expect(result.first.title, 'Test Ticket 0');
      expect(result.first.description, 'Test Description');
      expect(result.first.priority, TicketsPiority.low);
      expect(result.first.status, TicketStatus.open);
      expect(result.first.category, TicketCategory.general);
      expect(result.first.createdAt, isA<DateTime>());
    });
    test('should create a ticket', () async {
      final ticket = buildTicket(title: 'Test Ticket');

      final id = await dataSource.createTicket(ticket);

      expect(id, greaterThan(0));

      final all = await dataSource.getAllTickets();
      expect(all.length, 1);
      expect(all.first.title, 'Test Ticket');
      expect(all.first.category, TicketCategory.general);
    });
    test('should update a ticket', () async {
      final ticket = buildTicket();
      final id = await dataSource.createTicket(ticket);
      expect(id, greaterThan(0));

      final updatedTicket = ticket.copyWith(title: 'Updated Ticket');
      final updatedId = await dataSource.updateTicket(updatedTicket);
      expect(updatedId, greaterThan(0));

      final all = await dataSource.getAllTickets();
      expect(all.length, 1);
      expect(all.first.title, 'Updated Ticket');
    });
    test('should filter tickets by category', () async {
      await dataSource.createTicket(
        buildTicket(title: 'Technical ticket', category: TicketCategory.technical),
      );
      await dataSource.createTicket(
        buildTicket(title: 'Billing ticket', category: TicketCategory.billing),
      );

      final technicalTickets = await dataSource.searchTickets(
        '',
        category: TicketCategory.technical,
      );

      expect(technicalTickets, hasLength(1));
      expect(technicalTickets.first.title, 'Technical ticket');
    });
  });
}
