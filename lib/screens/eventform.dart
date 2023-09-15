import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calender_task/bloc/events_bloc.dart';
import 'package:calender_task/bloc/events_event.dart';
import 'package:calender_task/constants/appconstants.dart';
import 'package:calender_task/model/calender_model.dart';

class EventForm extends StatelessWidget {
  final TextEditingController eventNameController;
  final TextEditingController eventTimeController;
  final GlobalKey<FormState> formKey;
  final int index;

  const EventForm({super.key, 
    required this.eventNameController,
    required this.eventTimeController,
    required this.formKey,
    required this.index,
  });

  TimeOfDay _convertToTimeOfDay(String timeString) {
    List<String> times = timeString.split(':');
    int hours = int.parse(times[0]);
    int minutes = int.parse(times[1].split(' ')[0]);
    return TimeOfDay(hour: hours, minute: minutes);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: eventNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppConstants.calendarNameEvent,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.calendarEnterName;
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return AppConstants.calendarValidateMsg;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: eventTimeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppConstants.calendarEnterTime,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.calendarTimeValidate;
                }
                return null;
              },
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time != null) {
                  eventTimeController.text = time.format(context);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(AppConstants.calendarSave),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<EventBloc>().add(SaveEvent(
                        eventList: CalendarModel(
                          index: index,
                          eventName: eventNameController.text,
                          eventTime: _convertToTimeOfDay(eventTimeController.text),
                        ),
                      ));

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(AppConstants.calendarEventAdded,)));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
