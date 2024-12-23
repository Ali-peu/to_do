import 'package:intl/intl.dart';

class DateTimeValidators {
  static String getDateTimeyMMMd(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final data = DateFormat.yMMMd().format(dateTime);
    return data;
  }
}
