import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_status_chip.dart';

class TicketStatesWidget extends StatelessWidget {
  const TicketStatesWidget({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
    this.showContainer = true,
  });

  final TicketStatus selectedStatus;
  final ValueChanged<TicketStatus> onStatusSelected;
  final bool showContainer;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status', style: AppTextStyles.semiBold18Secondary(context)),
        const SizedBox(height: 12),
        ...TicketStatus.values.map(
          (status) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TicketStatusChip(
              status: status,
              isSelected: selectedStatus == status,
              onTap: () => onStatusSelected(status),
            ),
          ),
        ),
      ],
    );

    if (!showContainer) return content;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppContainersStyle.newTicketsContainer(context),
      child: content,
    );
  }
}
