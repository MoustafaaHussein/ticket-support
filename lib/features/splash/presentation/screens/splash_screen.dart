import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/features/splash/presentation/widgets/animated_logo.dart';
import 'package:ticket_app/features/splash/presentation/widgets/animated_text.dart';
import 'package:ticket_app/features/splash/presentation/widgets/background.dart';

abstract final class _Colors {
  static const background = Color(0xFF006763);
  static const accent = Color(0xFF5FD9D2);
  static const soft = Color(0xFFA3CFCB);
}

abstract final class _Durations {
  static const logo = Duration(milliseconds: 700);
  static const text = Duration(milliseconds: 600);
  static const tagline = Duration(milliseconds: 500);
  static const pulse = Duration(milliseconds: 2400);
  static const staggerGap = Duration(milliseconds: 100);
  static const navigate = Duration(seconds: 5);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoCtrl;
  late final AnimationController _textCtrl;
  late final AnimationController _taglineCtrl;
  late final AnimationController _pulseCtrl;

  late final Animation<double> _logoFade;
  late final Animation<Offset> _logoSlide;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;
  late final Animation<double> _taglineFade;
  late final Animation<double> _pulseScale;

  @override
  void initState() {
    super.initState();
    _initControllers();
    _initAnimations();
    _runSequence();
    _scheduleNavigation();
  }

  void _initControllers() {
    _logoCtrl = _ctrl(_Durations.logo);
    _textCtrl = _ctrl(_Durations.text);
    _taglineCtrl = _ctrl(_Durations.tagline);
    _pulseCtrl = _ctrl(_Durations.pulse)..repeat(reverse: true);
  }

  AnimationController _ctrl(Duration duration) =>
      AnimationController(vsync: this, duration: duration);

  void _initAnimations() {
    _logoFade = _fade(_logoCtrl);
    _logoSlide = _slide(_logoCtrl, begin: const Offset(0, 0.3));
    _textFade = _fade(_textCtrl);
    _textSlide = _slide(_textCtrl, begin: const Offset(0, 0.2));
    _taglineFade = _fade(_taglineCtrl);
    _pulseScale = Tween<double>(
      begin: 0.85,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
  }

  Animation<double> _fade(AnimationController ctrl) =>
      CurvedAnimation(parent: ctrl, curve: Curves.easeOut);

  Animation<Offset> _slide(AnimationController ctrl, {required Offset begin}) =>
      Tween<Offset>(
        begin: begin,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeOut));

  Future<void> _runSequence() async {
    await _logoCtrl.forward();
    await Future.delayed(_Durations.staggerGap);
    await _textCtrl.forward();
    await Future.delayed(_Durations.staggerGap);
    await _taglineCtrl.forward();
  }

  void _scheduleNavigation() {
    Future.delayed(_Durations.navigate, () {
      if (!mounted) return;
      context.go(AppRouter.khomeViewRoute);
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    _taglineCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Colors.background,
      body: Stack(
        children: [
          BackgroundOrbs(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedLogo(
                  fade: _logoFade,
                  slide: _logoSlide,
                  pulseScale: _pulseScale,
                ),
                const SizedBox(height: 24),
                AnimatedText(
                  fade: _textFade,
                  slide: _textSlide,
                  text: 'Tixora',
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: _Colors.accent,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                FadeTransition(
                  opacity: _taglineFade,
                  child: const Text(
                    'SUPPORT · RESOLVED',
                    style: TextStyle(
                      fontSize: 12,
                      color: _Colors.soft,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
