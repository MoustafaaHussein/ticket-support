import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/core/widgets/custom_text_field.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/piorty_card.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_states_widget.dart';

class UpdateTicketDialog extends StatefulWidget {
  const UpdateTicketDialog({super.key, required this.ticket});

  final TicketModel ticket;

  static Future<TicketModel?> show(
    BuildContext context, {
    required TicketModel ticket,
  }) {
    return showDialog<TicketModel>(
      context: context,
      barrierDismissible: true,
      builder: (context) => UpdateTicketDialog(ticket: ticket),
    );
  }

  @override
  State<UpdateTicketDialog> createState() => _UpdateTicketDialogState();
}

class _UpdateTicketDialogState extends State<UpdateTicketDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _subjectController;
  late final TextEditingController _descriptionController;
  late TicketsPiority _selectedPriority;
  late TicketStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _subjectController = TextEditingController(text: widget.ticket.title);
    _descriptionController = TextEditingController(
      text: widget.ticket.description,
    );
    _selectedPriority = widget.ticket.priority;
    _selectedStatus = widget.ticket.status;
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      widget.ticket.copyWith(
        title: _subjectController.text.trim(),
        description: _descriptionController.text.trim(),
        priority: _selectedPriority,
        status: _selectedStatus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Dialog(
      backgroundColor: colors.surfaceContainerLowest,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Ticket',
                  style: AppTextStyles.bold24Secondary(context),
                ),
                const SizedBox(height: 20),
                Text('Subject', style: AppTextStyles.bold20Primary(context)),
                const SizedBox(height: 12),
                CustomizedTextField(
                  hint: 'Enter the ticket subject',
                  controller: _subjectController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: AppTextStyles.bold20Primary(context),
                ),
                const SizedBox(height: 12),
                CustomizedTextField(
                  hint: 'Enter the description',
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 20),
                Text('Priority', style: AppTextStyles.bold20Primary(context)),
                const SizedBox(height: 12),
                Row(
                  children: TicketsPiority.values.map((priority) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: PiortyChipCard(
                          ticketsPiority: priority,
                          isSelected: _selectedPriority == priority,
                          onTap: () {
                            setState(() => _selectedPriority = priority);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AppContainersStyle.newTicketsContainer(context),
                  child: TicketStatesWidget(
                    selectedStatus: _selectedStatus,
                    showContainer: false,
                    onStatusSelected: (status) {
                      setState(() => _selectedStatus = status);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _save,
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Save Changes',
                      style: AppTextStyles.semiBold18Primary(
                        context,
                      ).copyWith(color: colors.onPrimary),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
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
        ),
      ),
    );
  }
}
