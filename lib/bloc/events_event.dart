import 'package:calender_task/model/calender_model.dart';

abstract class Event {

}

class SaveEvent extends Event {
  final CalendarModel eventList;
  SaveEvent({required this.eventList});
}