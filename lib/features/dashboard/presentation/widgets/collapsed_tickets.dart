import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_piorty_container.dart';

class CollapsedTickets extends StatelessWidget {
  const CollapsedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: AppContainersStyle.ticketsPiorityContainerStyle(
        context,
        TicketsPiority.low,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("#SD-123456", style: AppTextStyles.bold16Secondary(context)),
              Spacer(),
              TicketsPiortyContainer(piority: TicketsPiority.low),
            ],
          ),
          SizedBox(height: 4),
          Text(
            "Server connection timeout in APAC",
            style: AppTextStyles.bold18Primary(context),
          ),
          SizedBox(height: 4),
          Text(
            "Users reporting 504 Gateway errors when…",
            style: AppTextStyles.medium14Secondary(context),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 4),
              Text("Mostafa", style: AppTextStyles.medium16Secondary(context)),
              Spacer(),
              Text(
                "15 Mins ago",
                style: AppTextStyles.medium16Secondary(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
