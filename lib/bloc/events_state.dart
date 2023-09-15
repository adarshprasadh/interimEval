// ignore_for_file: overridden_fields

import 'package:calender_task/model/calender_model.dart';


abstract class EventState {
  final List<CalendarModel> eventList;
  const EventState({required this.eventList});

  List<Object> get props => [];
}

class EventAdded extends EventState {
  @override

  final List<CalendarModel> eventList;

  const EventAdded({required this.eventList}) : super(eventList: eventList);

  @override
  List<Object> get props => [eventList];
}