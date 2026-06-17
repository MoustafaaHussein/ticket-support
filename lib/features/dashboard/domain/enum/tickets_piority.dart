import 'package:flutter/material.dart';

enum TicketsPiority { low, medium, high }

extension TicketsPiorityExtension on TicketsPiority {
  Color get color => switch (this) {
    TicketsPiority.low => Colors.green,
    TicketsPiority.medium => Colors.yellow,
    TicketsPiority.high => const Color.fromARGB(255, 236, 86, 86),
  };
  String get name => switch (this) {
    TicketsPiority.low => "Low",
    TicketsPiority.medium => "Medium",
    TicketsPiority.high => "High",
  };
}
