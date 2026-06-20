import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_status_chip.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('TicketStatusChip shows the status label', (tester) async {
    await pumpApp(
      tester,
      TicketStatusChip(
        status: TicketStatus.open,
        isSelected: false,
        onTap: () {},
      ),
    );

    expect(find.text('Open'), findsOneWidget);
  });

  testWidgets('TicketStatusChip calls onTap when tapped', (tester) async {
    var wasTapped = false;

    await pumpApp(
      tester,
      TicketStatusChip(
        status: TicketStatus.closed,
        isSelected: false,
        onTap: () => wasTapped = true,
      ),
    );

    await tester.tap(find.text('Closed'));
    await tester.pump();

    expect(wasTapped, isTrue);
  });

  testWidgets('TicketStatusChip shows selected icon when selected', (
    tester,
  ) async {
    await pumpApp(
      tester,
      TicketStatusChip(
        status: TicketStatus.inProgress,
        isSelected: true,
        onTap: () {},
      ),
    );

    expect(find.text('In Progress'), findsOneWidget);
    expect(find.byIcon(Icons.radio_button_checked), findsOneWidget);
  });
}
