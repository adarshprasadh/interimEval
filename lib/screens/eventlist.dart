import 'package:flutter/material.dart';
import 'package:calender_task/model/calender_model.dart';

class EventList extends StatelessWidget {
  final List<CalendarModel> eventList;

  const EventList({required this.eventList,super.key });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: eventList.isNotEmpty
          ? ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      maxLines: 3,
                      eventList[index].eventName.length > 4
                          ? '${eventList[index].eventName.substring(0,5)}.'
                          : eventList[index].eventName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }
}
