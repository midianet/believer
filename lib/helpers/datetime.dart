import 'package:intl/intl.dart';

String getWeekDay(DateTime date, bool abreviate) {
    return DateFormat(abreviate ? DateFormat.ABBR_WEEKDAY: DateFormat.WEEKDAY).format(date);
}

String getMonth(DateTime date, bool abreviate) {
    return DateFormat(abreviate ? DateFormat.ABBR_MONTH: DateFormat.MONTH).format(date);
}