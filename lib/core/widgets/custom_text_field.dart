import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    super.key,

    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
  });

  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
