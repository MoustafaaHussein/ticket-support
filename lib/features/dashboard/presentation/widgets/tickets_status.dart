import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';

class TicketsStatus extends StatelessWidget {
  const TicketsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: AppContainersStyle.ticketsStatusContainerStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.airplane_ticket),
          SizedBox(height: 8),
          Text('48', style: AppTextStyles.bold24Secondary(context)),
          SizedBox(height: 8),
          Text(
            'Total Tickets',
            style: AppTextStyles.medium14Secondary(context),
          ),
        ],
      ),
    );
  }
}
