import 'package:flutter/material.dart';
import 'package:calender_task/constants/appconstants.dart';


class AppBarbulid extends StatelessWidget {
  const AppBarbulid({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(AppConstants.calendar),
      );
  }
}
