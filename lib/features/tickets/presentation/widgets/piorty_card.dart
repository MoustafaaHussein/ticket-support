import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';

class PiortyChipCard extends StatelessWidget {
  const PiortyChipCard({
    super.key,
    required this.ticketsPiority,
    required this.isSelected,
    required this.onTap,
  });

  final TicketsPiority ticketsPiority;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? ticketsPiority.color : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Center(
          child: Text(
            ticketsPiority.name.toUpperCase(),
            style: AppTextStyles.bold16Primary(context),
          ),
        ),
      ),
    );
  }
}
