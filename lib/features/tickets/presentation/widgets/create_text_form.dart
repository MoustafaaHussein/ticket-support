
import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/core/widgets/custom_text_field.dart';
import 'package:ticket_app/core/widgets/primary_button.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/piorty_card.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_category_picker_field.dart';

class CreateTicketForm extends StatelessWidget {
  CreateTicketForm({
    super.key,
    required this.subjectController,
    required this.descriptionController,
    required this.selectedPriority,
    required this.onPriorityChanged,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.onSubmit,
    this.isSubmitting = false,
  });

  final TextEditingController subjectController;
  final TextEditingController descriptionController;

  final TicketsPiority? selectedPriority;
  final ValueChanged<TicketsPiority> onPriorityChanged;

  final TicketCategory? selectedCategory;
  final ValueChanged<TicketCategory> onCategoryChanged;
  final VoidCallback onSubmit;
  final bool isSubmitting;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppContainersStyle.newTicketsContainer(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Subject
            Row(
              children: [
                Text(
                  'Ticket Subject',
                  style: AppTextStyles.bold20Primary(context),
                ),
                const SizedBox(width: 10),
                Text(
                  '*',
                  style: AppTextStyles.bold20Primary(
                    context,
                  ).copyWith(color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 12),

            CustomizedTextField(
              hint: 'Enter the ticket Subject',
              controller: subjectController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),

            const SizedBox(height: 20),

            /// Description
            Row(
              children: [
                Text(
                  'Ticket Description',
                  style: AppTextStyles.bold20Primary(context),
                ),
                const SizedBox(width: 10),
                Text(
                  '*',
                  style: AppTextStyles.bold20Primary(
                    context,
                  ).copyWith(color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 12),

            CustomizedTextField(
              hint: 'Enter the description',
              controller: descriptionController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),

            const SizedBox(height: 20),

            Text('Priority', style: AppTextStyles.bold20Primary(context)),

            const SizedBox(height: 20),

            Row(
              children: TicketsPiority.values.map((priority) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: PiortyChipCard(
                      ticketsPiority: priority,
                      isSelected: selectedPriority == priority,
                      onTap: () {
                        onPriorityChanged(priority);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Categories', style: AppTextStyles.bold20Primary(context)),
            SizedBox(height: 20),
            TicketCategoryPickerField(
              selectedCategory: selectedCategory,
              onSelected: onCategoryChanged,
            ),
            SizedBox(height: 20),
            PrimaryButton(
              title: isSubmitting ? 'Creating...' : 'Create Ticket',
              icon: isSubmitting ? null : Icons.send,
              onPressed: isSubmitting
                  ? () {}
                  : () {
                      if (_formKey.currentState!.validate()) {
                        onSubmit();
                      }
                    },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
