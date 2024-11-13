import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  static const dateFormat = 'MM.dd.yyyy';
  static const dateFormatWithSlashes = 'MM/dd/yyyy';
  static const timeFormat = 'hh:mm a';
  static const dateFullFormat = 'MMM do, yyyy';
  static const dateFullFormatWithTime = 'MMMM do, yyyy - hh:mma';
  static const dateFullMonthFormat = 'MMMM do, yyyy';
  static const dateMonthYearFormat = 'MMMM yyyy';
  static const dateFormatWeekdayAbbreviated = 'EEE';
  static const wooDateFormat = 'MMM dd yyyy';
  static const birthdayDateFormat = 'yyyy-MM-dd';
  static const wooTimeFormat = 'hh:mma';
  static const shortWooTimeFormat = 'hh:mma';

  static int toMillisecondsSinceEpoch(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  /// Example: 2023-02-07 02:00:00.000Z
  static String toUTC(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String().replaceAll('T', ' ');
  }

  static String? toUtcOrNull(DateTime? dateTime) {
    if (dateTime == null) return null;
    return toUTC(dateTime);
  }

  static DateTime nowWithoutTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime nowAddHalfHour() {
    return DateTime.now().add(const Duration(minutes: 30));
  }

  String get formattedDate => DateFormat(dateFormat).format(this);
  String get formattedDateWithSlashes {
    return DateFormat(dateFormatWithSlashes).format(this);
  }

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateFull =>
      Jiffy.parseFromDateTime(this).format(pattern: dateFullFormat);
  String get formattedDateFullWithTime {
    return Jiffy.parseFromDateTime(this)
        .format(pattern: dateFullFormatWithTime);
  }

  String get formattedDateFullMonth =>
      Jiffy.parseFromDateTime(this).format(pattern: dateFullMonthFormat);
  String get formattedMonthYear => DateFormat(dateMonthYearFormat).format(this);
  String get formattedWooDate => DateFormat(wooDateFormat).format(this);
  String get formattedWooTime => DateFormat(wooTimeFormat).format(this);
  String get formattedBirthday => DateFormat(birthdayDateFormat).format(this);

  /// e.g. 8:00p
  String get formattedTimeWithLowerCaseMarker {
    final time = DateFormat(shortWooTimeFormat).format(this);

    return time.substring(0, time.length - 1).toLowerCase();
  }

  String get formattedWeekDay {
    return DateFormat(dateFormatWeekdayAbbreviated).format(this);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  DateTime replaceTime(DateTime time) {
    return DateTime(
      year,
      month,
      day,
      time.hour,
      time.minute,
    );
  }

  DateTime dayWithoutTime() {
    return DateTime(year, month, day);
  }

  int get getDaysInMonth {
    final daysInMonth = [
      31, // January
      28, // February (assuming non-leap year)
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];

    if (month == 2 && _isLeapYear(year)) {
      return 29;
    }

    return daysInMonth[month - 1];
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}
