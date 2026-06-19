import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/tickets/data/models/tickets_status_model.dart';

class TicketsStatusCards extends StatelessWidget {
  const TicketsStatusCards({
    super.key,
    required this.status,
    required this.isSelected,
    required this.onTap,
  });

  final TicketsStatusModel status;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.primaryContainer
              : context.colors.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              status.status,
              style: AppTextStyles.semiBold14Primary(context),
            ),
          ),
        ),
      ),
    );
  }
}
