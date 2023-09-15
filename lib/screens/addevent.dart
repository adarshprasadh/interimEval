import 'package:flutter/material.dart';
import 'package:calender_task/constants/appconstants.dart';
import 'package:calender_task/screens/eventform.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key, required this.index});

  final int index;
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventTimeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(AppConstants.calendarAddEvent),
    ), 
      body: Center(
        child: EventForm(
          eventNameController: _eventNameController,
          eventTimeController: _eventTimeController,
          formKey: _formKey,
          index: index,
        ),
      ),
    );
  }
}
