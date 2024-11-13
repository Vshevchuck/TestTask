import 'package:flutter/foundation.dart';

import '../../../../../utils/extensions/date_time_ext.dart';

class TimePeriodUtil {
  static const TimePeriodUtil _instance = TimePeriodUtil._(
    monthsInYear: 12,
    maxDaysAmount: 31,
    maxMonthsAmount: 70,
  );
  factory TimePeriodUtil() => _instance;

  @visibleForTesting
  final int monthsInYear;

  @visibleForTesting
  final int maxDaysAmount;

  @visibleForTesting
  final int maxMonthsAmount;

  const TimePeriodUtil._({
    required this.monthsInYear,
    required this.maxDaysAmount,
    required this.maxMonthsAmount,
  });

  T getTimePeriodByDays<T>(
    int daysTogether, {
    required T Function(num days) forDays,
    required T Function(num months) forMonths,
    required T Function(num years) forYears,
  }) {
    if (daysTogether <= maxDaysAmount) return forDays(daysTogether);
    final months = getMonths(daysTogether);
    if (months <= maxMonthsAmount) return forMonths(months);
    final years = getYears(months);
    return forYears(years);
  }

  @visibleForTesting
  int getMonths(int daysTogether) {
    DateTime cursorTime = DateTime.now();

    int months = 0;

    while (daysTogether > cursorTime.getDaysInMonth) {
      months++;
      daysTogether -= cursorTime.getDaysInMonth;
      cursorTime = cursorTime.subtract(
        Duration(days: cursorTime.getDaysInMonth),
      );
    }

    return months;
  }

  @visibleForTesting
  num getYears(num months) {
    final years = months ~/ monthsInYear;
    months -= years * monthsInYear;
    if (months > 10) {
      months /= 100;
    } else {
      months /= 10;
    }
    return years + months;
  }
}
