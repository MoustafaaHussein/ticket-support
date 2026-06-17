import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';

class NewTicketButton extends StatelessWidget {
  const NewTicketButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: colors.primary,
      borderRadius: BorderRadius.circular(100),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: colors.onPrimary, size: 20),
              const SizedBox(width: 8),
              Text(
                'New Ticket',
                style: AppTextStyles.semiBold16Primary(context).copyWith(
                  color: colors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
