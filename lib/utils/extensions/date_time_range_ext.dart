import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeExt on DateTimeRange {
  static const dateMonthYearFormat = 'MMM yyyy';
  static const dateDayMonthFormat = 'd MMM';
  static const dateFullFormat = 'd MMM yyyy';

  String get weekRangeLabel {
    if (start.month == end.month) {
      return '${start.day}-${end.day}, ${DateFormat(dateMonthYearFormat).format(end)}';
    }
    if (start.month != end.month && start.year == end.year) {
      return '${DateFormat(dateDayMonthFormat).format(start)}-'
          '${DateFormat(dateDayMonthFormat).format(end)}, ${end.year}';
    }
    return '${DateFormat(dateFullFormat).format(start)}-'
        '${DateFormat(dateFullFormat).format(end)}';
  }
}
