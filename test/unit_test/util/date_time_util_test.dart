import 'package:league_app/src/util/date_time_util.dart';
import 'package:test/test.dart';

void main() {
  group('DateTimeUtil', () {
    test('.getDateString returns a correctly formatted date string', () {
      final DateTime testDate = DateTime(2000, 01, 01);
      final DateTimeUtil dateTimeUtil = DateTimeUtil();

      final String formattedDateString = dateTimeUtil.getDateString(testDate);
      final String expectedFormattedString = '1, January 2000';

      expect(formattedDateString, expectedFormattedString);
    });
  });
}
