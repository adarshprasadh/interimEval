import 'package:flutter/material.dart';
import 'package:calender_task/screens/griditem.dart';


class BuildCalendar extends StatelessWidget {
  const BuildCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 0.6,
          ),
          itemCount: 28,
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int count) {
            return GridItem(count: count);
          },
        ),
      ),
    );
  }
}
