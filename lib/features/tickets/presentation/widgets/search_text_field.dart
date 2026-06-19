import 'package:flutter/material.dart';
import 'package:ticket_app/core/styles/containers_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: AppContainersStyle.searchTextFieldContainer(context),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by subject or description',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
