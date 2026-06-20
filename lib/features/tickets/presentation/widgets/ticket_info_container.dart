import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/core/widgets/tickets_status_container.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/tickets_piorty_container.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';

class TicketInfoContainer extends StatelessWidget {
  const TicketInfoContainer({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppContainersStyle.ticketsPiorityContainerStyle(
            context,
            ticketModel.priority,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Ticket ID #${ticketModel.id.toString()}",
                    style: AppTextStyles.bold16Secondary(context),
                  ),
                  const Spacer(),
                  TicketsStatusContainer(status: ticketModel.status),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                ticketModel.title,
                style: AppTextStyles.bold18Primary(context),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 10),
                  Text(
                    " Created on ${ticketModel.createdAt.toString().trimRight().split(' ')[0]} ",
                    style: AppTextStyles.medium14Secondary(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppContainersStyle.newTicketsContainer(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: AppTextStyles.bold24Secondary(context),
              ),
              const SizedBox(height: 10),
              Text(
                ticketModel.description,
                style: AppTextStyles.semiBold18Secondary(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppContainersStyle.newTicketsContainer(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category:',
                style: AppTextStyles.semiBold18Secondary(context),
              ),
              Text(
                ticketModel.category.displayName,
                style: AppTextStyles.semiBold18Secondary(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppContainersStyle.newTicketsContainer(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Priority:',
                style: AppTextStyles.semiBold18Secondary(context),
              ),
              const SizedBox(width: 10),
              TicketsPiortyContainer(piority: ticketModel.priority),
            ],
          ),
        ),
      ],
    );
  }
}
