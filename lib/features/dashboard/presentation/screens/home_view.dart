import 'package:flutter/material.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text('Support Tickets'),
      ),
      body: HomeViewBody(),
    );
  }
}
