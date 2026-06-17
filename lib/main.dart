import 'package:flutter/material.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/core/theme/app_theme.dart';

void main() {
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
