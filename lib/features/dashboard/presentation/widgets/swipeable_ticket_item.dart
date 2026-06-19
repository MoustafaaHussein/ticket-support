import 'package:flutter/material.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/core/widgets/confirm_dialog.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/collapsed_tickets.dart';
import 'package:ticket_app/features/tickets/data/models/ticket_model.dart';

class SwipeableTicketItem extends StatefulWidget {
  const SwipeableTicketItem({
    super.key,
    required this.ticket,
    required this.onDelete,
  });

  final TicketModel ticket;
  final ValueChanged<int> onDelete;

  @override
  State<SwipeableTicketItem> createState() => _SwipeableTicketItemState();
}

class _SwipeableTicketItemState extends State<SwipeableTicketItem> {
  double _dragOffset = 0;

  Future<void> _openDeleteDialog() async {
    final confirmed = await DeleteTicketDialog.show(
      context,
      ticketId: widget.ticket.id.toString(),
    );

    if (confirmed && mounted) {
      widget.onDelete(widget.ticket.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final revealWidth = constraints.maxWidth * 0.1;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: constraints.maxHeight == double.infinity
                  ? null
                  : constraints.maxHeight,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    width: revealWidth,
                    child: Material(
                      color: colors.error,
                      child: InkWell(
                        onTap: _openDeleteDialog,
                        child: Center(
                          child: Icon(
                            Icons.delete_outline,
                            color: colors.onError,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _dragOffset = (_dragOffset - details.delta.dx).clamp(
                          0,
                          revealWidth,
                        );
                      });
                    },
                    onHorizontalDragEnd: (_) {
                      setState(() {
                        _dragOffset =
                            _dragOffset > revealWidth / 2 ? revealWidth : 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      transform: Matrix4.translationValues(-_dragOffset, 0, 0),
                      child: CollapsedTickets(
                        ticket: widget.ticket,
                        includeBottomMargin: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
