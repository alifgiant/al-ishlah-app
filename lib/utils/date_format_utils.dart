import 'package:date_format/date_format.dart';

extension DateFormatUtils on DateTime {
  // Monday, 23 Dec 2019
  String standardFormat({bool withHour = false}) {
    final format = withHour
        ? [DD, ', ', dd, ' ', M, ' ', yyyy, ', ', HH, ':', nn]
        : [DD, ', ', dd, ' ', M, ' ', yyyy];
    return formatDate(this, format);
  }

  // Monday, 23 Dec 2019
  String formatNoDay({bool withHour = false}) {
    final format = withHour
        ? [dd, ' ', M, ' ', yyyy, ', ', HH, ':', nn]
        : [dd, ' ', M, ' ', yyyy];
    return formatDate(this, format);
  }

  bool isBetween(DateTime before, DateTime after) {
    return this.isAfter(before) && this.isBefore(after);
  }
}
