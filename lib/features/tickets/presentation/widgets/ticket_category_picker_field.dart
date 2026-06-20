import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_category_model.dart';
import 'package:ticket_app/features/tickets/domain/enums/ticket_category.dart';

class TicketCategoryPickerField extends StatelessWidget {
  const TicketCategoryPickerField({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  final TicketCategory? selectedCategory;
  final ValueChanged<TicketCategory> onSelected;

  Future<void> _showPicker(BuildContext context) async {
    var selectedIndex = ticketCategories.indexOf(
      selectedCategory ?? ticketCategories.first,
    );
    if (selectedIndex < 0) selectedIndex = 0;

    var tempSelected = ticketCategories[selectedIndex];

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  onPressed: () {
                    onSelected(tempSelected);
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedIndex,
                  ),
                  onSelectedItemChanged: (index) {
                    tempSelected = ticketCategories[index];
                  },
                  children: ticketCategories
                      .map(
                        (category) => Center(child: Text(category.displayName)),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedCategory?.displayName ?? 'Select Category',
                style: TextStyle(
                  color: selectedCategory == null ? Colors.grey : Colors.black,
                ),
              ),
            ),
            const Icon(CupertinoIcons.chevron_down, size: 18),
          ],
        ),
      ),
    );
  }
}
