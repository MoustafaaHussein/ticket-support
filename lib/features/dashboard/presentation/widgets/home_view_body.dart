import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome Back Mostafa',
          style: AppTextStyles.bold20Primary(context),
        ),
        SizedBox(height: 7),
        Text(
          'Here are the tickets that you have opened',
          style: AppTextStyles.medium14Secondary(context),
        ),
      ],
    );
  }
}
