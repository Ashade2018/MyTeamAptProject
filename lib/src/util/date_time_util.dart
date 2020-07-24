import 'package:intl/intl.dart';

class DateTimeUtil {
  String getDateString(DateTime date) {
    return DateFormat('d, MMMM yyy').format(date);
  }
}
