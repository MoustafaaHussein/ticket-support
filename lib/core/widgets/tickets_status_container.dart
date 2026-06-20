import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class TicketsStatusContainer extends StatelessWidget {
  const TicketsStatusContainer({super.key, required this.status});
  final TicketStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(status.displayName, style: AppTextStyles.bold14Primary(context)),
        ],
      ),
    );
  }
}
