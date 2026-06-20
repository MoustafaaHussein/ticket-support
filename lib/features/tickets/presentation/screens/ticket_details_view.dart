import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_details_view_body.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: const Text('Ticket Details'),
      ),
      body: TicketDetailsViewBody(ticketModel: ticketModel),
    );
  }
}
