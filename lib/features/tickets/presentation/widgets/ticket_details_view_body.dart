import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/core/widgets/success_dialog.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';
import 'package:ticket_app/features/tickets/presentation/utils/ticket_clipboard.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_info_container.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/update_ticket_dialog.dart';

class TicketDetailsViewBody extends StatefulWidget {
  const TicketDetailsViewBody({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  State<TicketDetailsViewBody> createState() => _TicketDetailsViewBodyState();
}

class _TicketDetailsViewBodyState extends State<TicketDetailsViewBody> {
  late TicketModel _editedTicket;

  @override
  void initState() {
    super.initState();
    _editedTicket = widget.ticketModel;
  }

  Future<void> _openEditDialog() async {
    final updatedTicket = await UpdateTicketDialog.show(
      context,
      ticket: _editedTicket,
    );

    if (updatedTicket != null && mounted) {
      setState(() => _editedTicket = updatedTicket);
      context.read<TicketCubit>().updateTicket(updatedTicket);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketCubit, TicketState>(
      listenWhen: (previous, current) =>
          current is TicketUpdated || current is TicketError,
      listener: (context, state) async {
        if (state is TicketUpdated) {
          await SuccessDialog.show(
            context,
            title: 'Ticket Updated!',
            message: 'Your ticket changes have been saved successfully.',
            buttonText: 'Done',
          );
        } else if (state is TicketError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          final isSubmitting = state is TicketLoading;

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TicketInfoContainer(ticketModel: _editedTicket),
                    const SizedBox(height: 20),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
              Positioned(
                right: 12,
                bottom: 24,
                child: FloatingActionButton.small(
                  heroTag: 'edit_ticket_fab',
                  backgroundColor: context.colors.primaryContainer,
                  foregroundColor: context.colors.onPrimary,
                  onPressed: isSubmitting ? null : _openEditDialog,
                  child: const Icon(Icons.edit_outlined, size: 20),
                ),
              ),
              Positioned(
                left: 18,
                bottom: 24,
                child: FloatingActionButton.small(
                  heroTag: 'copy_ticket_fab',
                  backgroundColor: context.colors.primaryContainer,
                  foregroundColor: context.colors.onPrimary,
                  onPressed: () async {
                    await copyTicketToClipboard(_editedTicket);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ticket copied as JSON')),
                    );
                  },
                  child: const Icon(Icons.copy, size: 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
