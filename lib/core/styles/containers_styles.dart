import 'package:flutter/material.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';

abstract class AppContainersStyle {
  static ShapeDecoration ticketsStatusContainerStyle(BuildContext context) =>
      ShapeDecoration(
        color: context.colors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );
  static BoxDecoration ticketsPiorityContainerStyle(
    BuildContext context,
    TicketsPiority piority,
  ) => BoxDecoration(
    color: context.colors.onPrimary,
    borderRadius: BorderRadius.circular(16),
    border: Border(left: BorderSide(color: piority.color, width: 3)),
  );
  static ShapeDecoration newTicketsContainer(BuildContext context) =>
      ShapeDecoration(
        color: context.colors.surfaceBright,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );
}
