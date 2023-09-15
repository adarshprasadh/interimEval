import 'package:flutter/material.dart';
import 'package:calender_task/screens/calendar.dart';
import 'package:calender_task/screens/weekdays.dart';
import 'package:calender_task/constants/appconstants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.calendar),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              AppConstants.calendarHeading,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          WeekDays(),
          const BuildCalendar(),
        ],
      ),
    );
  }
}
