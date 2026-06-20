import 'package:flutter/material.dart';

class TicketIconPainter extends CustomPainter {
  const TicketIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final fill = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;
    final cy = size.height / 2;

    _drawDocument(canvas, stroke, cx, cy);
    _drawBadge(canvas, stroke, fill, cx, cy);
  }

  void _drawDocument(Canvas canvas, Paint stroke, double cx, double cy) {
    final left = cx - 18;
    final top = cy - 22;
    const w = 28.0;
    const h = 34.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, w, h),
        const Radius.circular(5),
      ),
      stroke,
    );

    final lx = left + 6;
    final rx = left + w - 6;
    canvas.drawLine(Offset(lx, cy - 10), Offset(rx, cy - 10), stroke);
    canvas.drawLine(Offset(lx, cy - 4), Offset(rx, cy - 4), stroke);
    canvas.drawLine(Offset(lx, cy + 2), Offset(lx + 8, cy + 2), stroke);
  }

  void _drawBadge(
    Canvas canvas,
    Paint stroke,
    Paint fill,
    double cx,
    double cy,
  ) {
    final bx = cx + 12;
    final by = cy + 14;
    const r = 9.0;

    canvas.drawCircle(Offset(bx, by), r, fill);
    canvas.drawCircle(Offset(bx, by), r, stroke);

    canvas.drawLine(Offset(bx, by - 4), Offset(bx, by - 1), stroke);
    canvas.drawCircle(
      Offset(bx, by + 2.5),
      1,
      stroke..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(TicketIconPainter old) => old.color != color;
}
