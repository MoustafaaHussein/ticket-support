import 'package:flutter/material.dart';

class BackgroundOrbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: -80, right: -80, child: _Orb(size: 340, opacity: 0.08)),
        Positioned(
          bottom: -50,
          left: -50,
          child: _Orb(size: 220, opacity: 0.06),
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200.withOpacity(opacity),
      ),
    );
  }
}
