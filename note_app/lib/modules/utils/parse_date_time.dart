import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

/// abstract class for parse string object to DateTime object
abstract class ParseDateTime {
  /// will return
  /// example "Aug 13, 2021"
  static String parseDateTime(String date) {
    initializeDateFormatting();
    var dateTime = DateTime.parse(date);
    return DateFormat.yMMMd().format(dateTime).toString();
  }
}
