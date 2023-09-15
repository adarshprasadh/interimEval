import 'package:flutter/material.dart';
import 'package:calender_task/screens/eventlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calender_task/bloc/events_bloc.dart';
import 'package:calender_task/bloc/events_state.dart';
import 'package:calender_task/model/calender_model.dart';

class GridItem extends StatelessWidget {
  final int count;

  const GridItem({required this.count,super.key });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/add', arguments: count);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  (count + 1).toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  BlocBuilder<EventBloc, EventState>(
                    builder: (BuildContext context, state) {
                      final List<CalendarModel> eventList = [];
                      for (var event in state.eventList) {
                        if (event.index == count) {
                          eventList.add(event);
                        }
                      }
                      return EventList(eventList: eventList);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
