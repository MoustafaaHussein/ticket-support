import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';

class RecentTicketsBar extends StatelessWidget {
  const RecentTicketsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recent Tickets', style: AppTextStyles.bold18Primary(context)),

          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kallTicketsViewRoute);
            },
            child: Text(
              'View All Tickets ->',
              style: AppTextStyles.medium18Primary(
                context,
              ).copyWith(color: context.colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
