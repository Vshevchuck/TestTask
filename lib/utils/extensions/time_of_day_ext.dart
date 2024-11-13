import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay {
  static String formmatedTime(TimeOfDay timeOfDay, BuildContext context) {
    return '${timeOfDay.hour}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }
}
