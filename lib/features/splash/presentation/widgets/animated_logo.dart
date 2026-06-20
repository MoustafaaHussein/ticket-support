import 'package:flutter/material.dart';
import 'package:ticket_app/features/splash/presentation/widgets/ticket_icon_painter.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    required this.fade,
    required this.slide,
    required this.pulseScale,
  });

  final Animation<double> fade;
  final Animation<Offset> slide;
  final Animation<double> pulseScale;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ScaleTransition(
                scale: pulseScale,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(
                      color: Colors.grey.shade200.withOpacity(0.25),
                      width: 2,
                    ),
                  ),
                ),
              ),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.grey.shade200.withOpacity(0.35),
                    width: 1.5,
                  ),
                ),
                child: CustomPaint(
                  painter: TicketIconPainter(color: Colors.grey.shade200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
