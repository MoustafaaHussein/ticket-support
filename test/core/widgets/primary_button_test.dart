import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_app/core/widgets/primary_button.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('PrimaryButton shows its title', (tester) async {
    await pumpApp(
      tester,
      PrimaryButton(
        title: 'Create Ticket',
        onPressed: () {},
      ),
    );

    expect(find.text('Create Ticket'), findsOneWidget);
  });

  testWidgets('PrimaryButton calls onPressed when tapped', (tester) async {
    var wasPressed = false;

    await pumpApp(
      tester,
      PrimaryButton(
        title: 'Save',
        onPressed: () => wasPressed = true,
      ),
    );

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });

  testWidgets('PrimaryButton shows an icon when provided', (tester) async {
    await pumpApp(
      tester,
      PrimaryButton(
        title: 'Add',
        icon: Icons.add,
        onPressed: () {},
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
