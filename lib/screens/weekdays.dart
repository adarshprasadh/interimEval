// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:calender_task/constants/appconstants.dart';

class WeekDays extends StatelessWidget {


  final List<String> _WeekDays = [
    AppConstants.calendarSun,
    AppConstants.calendarMon,
    AppConstants.calendarTue,
    AppConstants.calendarWed,
    AppConstants.calendarThurs,
    AppConstants.calendarFri,
    AppConstants.calendarSat
  ];

  WeekDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        7,
        (index) {
          return Expanded(
            child: Text(
              _WeekDays[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
