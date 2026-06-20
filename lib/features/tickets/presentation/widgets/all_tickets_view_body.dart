import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/core/widgets/new_ticket_button.dart';
import 'package:ticket_app/features/tickets/data/models/tickets_status_model.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_state.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/search_text_field.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/search_tickets_list.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/tickets_status_cards.dart';

class AllTicketsViewBody extends StatefulWidget {
  AllTicketsViewBody({super.key});

  @override
  State<AllTicketsViewBody> createState() => _AllTicketsViewBodyState();
}

class _AllTicketsViewBodyState extends State<AllTicketsViewBody> {
  TicketsStatusModel selectedStatus = ticketsStatus.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                onChanged: context.read<SearchCubit>().updateQuery,
              ),
              SizedBox(height: 12),
              Row(
                children: ticketsStatus.map((status) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: TicketsStatusCards(
                        status: status,
                        isSelected: selectedStatus == status,
                        onTap: () {
                          setState(() {
                            selectedStatus = status;
                          });
                          context.read<SearchCubit>().filterByStatus(status);
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final count = switch (state) {
                    SearchLoaded(:final tickets) => tickets.length,
                    SearchEmpty() => 0,
                    _ => null,
                  };

                  return Text(
                    count == null
                        ? 'Loading tickets...'
                        : '$count ticket${count == 1 ? '' : 's'} found',
                    style: AppTextStyles.semiBold16Secondary(context),
                  );
                },
              ),
              SizedBox(height: 20),
              Expanded(flex: 6, child: SearchTicketsList()),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 20,

            right: 0,
            child: NewTicketButton(
              title: 'New Ticket',
              icon: Icons.add,
              onPressed: () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRouter.kcreateTicketViewRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
