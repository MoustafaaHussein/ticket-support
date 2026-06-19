import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/all_tickets_view_body.dart';

class AllTicketsView extends StatelessWidget {
  const AllTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text('All Tickets'),
      ),
      body: AllTicketsViewBody(),
    );
  }
}
