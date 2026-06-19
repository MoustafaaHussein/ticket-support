import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';

class DeleteTicketDialog extends StatelessWidget {
  const DeleteTicketDialog({
    super.key,
    required this.ticketId,
  });

  final String ticketId;

  static Future<bool> show(
    BuildContext context, {
    required String ticketId,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => DeleteTicketDialog(ticketId: ticketId),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Dialog(
      backgroundColor: colors.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colors.errorContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: colors.error,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Delete Ticket?',
              style: AppTextStyles.bold20Primary(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.medium16Secondary(context),
                children: [
                  const TextSpan(text: 'Ticket '),
                  TextSpan(
                    text: ticketId,
                    style: AppTextStyles.bold16Primary(context),
                  ),
                  const TextSpan(
                    text:
                        ' will be permanently deleted. This action cannot be undone.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: colors.error,
                  foregroundColor: colors.onError,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Yes, Delete',
                  style: AppTextStyles.semiBold18Primary(
                    context,
                  ).copyWith(color: colors.onError),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.primaryText,
                  side: BorderSide(color: colors.outline),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.semiBold18Primary(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
