import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_category_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';

class TicketCategoryFilterDropdown extends StatelessWidget {
  const TicketCategoryFilterDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final TicketCategory? selectedCategory;
  final ValueChanged<TicketCategory?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TicketCategory?>(
      key: ValueKey(selectedCategory),
      initialValue: selectedCategory,
      decoration: InputDecoration(
        labelText: 'Category',
        labelStyle: AppTextStyles.medium14Secondary(context),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      hint: const Text('All Categories'),
      items: [
        const DropdownMenuItem<TicketCategory?>(
          value: null,
          child: Text('All Categories'),
        ),
        ...ticketCategories.map(
          (category) => DropdownMenuItem<TicketCategory?>(
            value: category,
            child: Text(category.displayName),
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
