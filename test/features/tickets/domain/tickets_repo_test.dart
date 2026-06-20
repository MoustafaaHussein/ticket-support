import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/data/repositories/ticket_repository_impl.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class MockTicketsLocalDataSource extends Mock
    implements TicketsLocalDataSource {}

void main() {
  late TicketRepositoryImpl repository;
  late MockTicketsLocalDataSource mockTicketsLocalDataSource;
  setUpAll(() {
    registerFallbackValue(
      TicketModel(
        id: 0,
        title: '',
        description: '',
        priority: TicketsPiority.low,
        status: TicketStatus.open,
        category: TicketCategory.general,
        createdAt: DateTime.now(),
      ),
    );
  });
  setUp(() {
    mockTicketsLocalDataSource = MockTicketsLocalDataSource();
    repository = TicketRepositoryImpl(
      ticketsLocalDataSource: mockTicketsLocalDataSource,
    );
  });
  test('should create a ticket via local data source', () async {
    final ticket = TicketModel(
      id: 0,
      title: 'New Ticket',
      description: 'New Description',
      priority: TicketsPiority.medium,
      status: TicketStatus.open,
      category: TicketCategory.technical,
      createdAt: DateTime.now(),
    );

    when(
      () => mockTicketsLocalDataSource.createTicket(any()),
    ).thenAnswer((_) async => 1);

    final result = await repository.createTicket(ticket);

    expect(result, 1);
    verify(() => mockTicketsLocalDataSource.createTicket(ticket)).called(1);
  });

  test('should update a ticket via local data source', () async {
    final ticket = TicketModel(
      id: 1,
      title: 'Updated Ticket',
      description: 'Updated Description',
      priority: TicketsPiority.high,
      status: TicketStatus.closed,
      category: TicketCategory.billing,
      createdAt: DateTime.now(),
    );

    when(
      () => mockTicketsLocalDataSource.updateTicket(any()),
    ).thenAnswer((_) async => 1);

    final result = await repository.updateTicket(ticket);

    expect(result, 1);
    verify(() => mockTicketsLocalDataSource.updateTicket(ticket)).called(1);
  });

  test('should delete a ticket via local data source', () async {
    when(
      () => mockTicketsLocalDataSource.deleteTicket(1),
    ).thenAnswer((_) async => 1);

    final result = await repository.deleteTicket(1);

    expect(result, 1);
    verify(() => mockTicketsLocalDataSource.deleteTicket(1)).called(1);
  });
}
