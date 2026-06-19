import 'package:flutter/material.dart';

enum TicketsPiority { low, medium, high }

extension TicketsPiorityExtension on TicketsPiority {
  Color get color => switch (this) {
    TicketsPiority.high => Colors.red,
    TicketsPiority.medium => Colors.deepOrangeAccent,
    TicketsPiority.low => Colors.green,
  };
  String get label => switch (this) {
    TicketsPiority.high => "High",
    TicketsPiority.medium => "Medium",
    TicketsPiority.low => "Low",
  };
}
