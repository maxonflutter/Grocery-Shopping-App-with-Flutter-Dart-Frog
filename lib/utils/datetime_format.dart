import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toCustomDate() {
    return DateFormat('EEE, MMM d').format(this);
  }
}
