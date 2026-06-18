import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_category_model.dart';

class CategoryPickerField extends StatelessWidget {
  final TicketCategoryModel? selectedCategory;
  final ValueChanged<TicketCategoryModel> onSelected;

  const CategoryPickerField({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  Future<void> _showPicker(BuildContext context) async {
    int selectedIndex = ticketCategories.indexWhere(
      (e) => e.id == selectedCategory?.id,
    );

    if (selectedIndex == -1) {
      selectedIndex = 0;
    }

    TicketCategoryModel tempSelected = ticketCategories[selectedIndex];

    await showCupertinoModalPopup(
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
                  child: const Text('Done'),
                  onPressed: () {
                    onSelected(tempSelected);
                    Navigator.pop(context);
                  },
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
                      .map((e) => Center(child: Text(e.name)))
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
                selectedCategory?.name ?? 'Select Category',
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
