import 'package:flutter/material.dart';
import 'package:ticket_app/features/dashboard/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Support Tickets')),
      body: HomeViewBody(),
    );
  }
}
