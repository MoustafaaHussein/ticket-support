import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    required this.fade,
    required this.slide,
    required this.text,
    required this.style,
  });

  final Animation<double> fade;
  final Animation<Offset> slide;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: Text(text, style: style),
      ),
    );
  }
}
