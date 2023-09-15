import 'package:flutter/material.dart';

class CalendarModel {
  CalendarModel(
      {
        required this.index,
         required this.eventName, 
         required this.eventTime
      });

  final int index;
  final String eventName;
  final TimeOfDay eventTime;
}
