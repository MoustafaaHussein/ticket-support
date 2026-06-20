import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/features/dashboard/domain/enum/tickets_piority.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_status.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/create_text_form.dart';

class CreateTicketViewBody extends StatefulWidget {
  const CreateTicketViewBody({super.key, this.isSubmitting = false});

  final bool isSubmitting;

  @override
  State<CreateTicketViewBody> createState() => _CreateTicketViewBodyState();
}

class _CreateTicketViewBodyState extends State<CreateTicketViewBody> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TicketsPiority? selectedPriority;
  TicketCategory? selectedCategory;

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _submitTicket(BuildContext context) {
    if (selectedPriority == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a priority')));
      return;
    }

    if (selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a category')));
      return;
    }

    context.read<TicketCubit>().createTicket(
      TicketModel(
        id: 0,
        title: subjectController.text.trim(),
        description: descriptionController.text.trim(),
        priority: selectedPriority!,
        status: TicketStatus.open,
        category: selectedCategory!,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
              isSubmitting: widget.isSubmitting,
              onSubmit: () => _submitTicket(context),
            ),
          ],
        ),
      ),
    );
  }
}
