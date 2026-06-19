import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';
import 'package:ticket_app/core/widgets/cancel_button.dart';
import 'package:ticket_app/core/widgets/custom_text_field.dart';
import 'package:ticket_app/core/widgets/primary_button.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_category_model.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/piorty_card.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/ticket_categories_list.dart';

class CreateTicketViewBody extends StatefulWidget {
  const CreateTicketViewBody({super.key});

  @override
  State<CreateTicketViewBody> createState() => _CreateTicketViewBodyState();
}

class _CreateTicketViewBodyState extends State<CreateTicketViewBody> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TicketsPiority? selectedPriority;
  TicketCategoryModel? selectedCategory;

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CreateTicketForm(
            subjectController: subjectController,
            descriptionController: descriptionController,
            selectedPriority: selectedPriority,
            onPriorityChanged: (priority) {
              setState(() {
                selectedPriority = priority;
              });
            },
            selectedCategory: selectedCategory,
            onCategoryChanged: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CreateTicketForm extends StatelessWidget {
  CreateTicketForm({
    super.key,
    required this.subjectController,
    required this.descriptionController,
    required this.selectedPriority,
    required this.onPriorityChanged,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final TextEditingController subjectController;
  final TextEditingController descriptionController;

  final TicketsPiority? selectedPriority;
  final ValueChanged<TicketsPiority> onPriorityChanged;

  final TicketCategoryModel? selectedCategory;
  final ValueChanged<TicketCategoryModel> onCategoryChanged;
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
            CategoryPickerField(
              selectedCategory: selectedCategory,
              onSelected: (category) {
                onCategoryChanged(category);
              },
            ),
            SizedBox(height: 20),
            PrimaryButton(
              title: 'Create Ticket',
              icon: Icons.send,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Create ticket
                }
              },
            ),
            SizedBox(height: 20),
            CancelButton(
              title: 'Cancel',
              icon: Icons.close,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kallTicketsViewRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
