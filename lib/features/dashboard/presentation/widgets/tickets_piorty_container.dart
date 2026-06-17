import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';

class TicketsPiortyContainer extends StatelessWidget {
  const TicketsPiortyContainer({super.key, required this.piority});
  final TicketsPiority piority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: piority.color,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          Text(piority.name, style: AppTextStyles.bold14Primary(context)),
        ],
      ),
    );
  }
}
