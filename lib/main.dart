import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/core/router/app_router.dart';
import 'package:ticket_app/core/theme/app_theme.dart';
import 'package:ticket_app/core/utils/service_locator.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketCubit>.value(
      value: sl<TicketCubit>(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
