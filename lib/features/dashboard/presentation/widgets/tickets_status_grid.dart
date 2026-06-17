import 'package:flutter/material.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_status.dart';

class TicketsStatusGrid extends StatelessWidget {
  const TicketsStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return TicketsStatus();
      },
    );
  }
}
