import 'package:flutter/material.dart';
import 'package:calender_task/bloc/events_bloc.dart';
import 'package:calender_task/constants/appconstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calender_task/screens/addevent.dart';
import 'package:calender_task/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: AppConstants.calendar,
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(builder: (context) => const HomePage());
            } else if (settings.name == '/add') {
              final index = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (context) => AddEvent(index: index));
            }
            return null;
          }),
    );
  }
}
