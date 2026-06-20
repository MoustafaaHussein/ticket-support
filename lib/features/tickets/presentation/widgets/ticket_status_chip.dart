import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';

class TicketStatusChip extends StatelessWidget {
  const TicketStatusChip({
    super.key,
    required this.status,
    required this.isSelected,
    required this.onTap,
  });

  final TicketStatus status;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colors.primary;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryColor : context.colors.outline,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? primaryColor : context.colors.secondaryText,
            ),
            const SizedBox(width: 10),
            Text(
              status.displayName,
              style:
                  (isSelected
                          ? AppTextStyles.bold16Primary(context)
                          : AppTextStyles.semiBold18Secondary(context))
                      .copyWith(
                        color: isSelected
                            ? primaryColor
                            : context.colors.secondaryText,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
