import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/widgets/new_ticket_button.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/collapsed_tickets_list.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/recent_tickets_bar.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_status_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back Mostafa',
                style: AppTextStyles.bold24Primary(context),
              ),
              SizedBox(height: 7),
              Text(
                'Here are the tickets that you have opened',
                style: AppTextStyles.medium18Secondary(context),
              ),
              SizedBox(height: 16),
              Expanded(flex: 2, child: TicketsStatusGrid()),
              SizedBox(height: 8),
              RecentTicketsBar(),
              Expanded(flex: 3, child: CollapsedTicketsList()),
              SizedBox(height: 16),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: NewTicketButton(onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
