import 'package:calender_task/bloc/events_event.dart';
import 'package:calender_task/bloc/events_state.dart';
import 'package:calender_task/model/calender_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EventBloc extends Bloc<Event, EventState> {

  EventBloc() : super(const EventAdded(eventList: [])) {

    on<SaveEvent>((event, emit) {
      _eventList.add(event.eventList);
      emit(EventAdded(eventList: _eventList));
    });
    
  }

  final List<CalendarModel> _eventList = [];
  List<CalendarModel> get items => _eventList;
}
