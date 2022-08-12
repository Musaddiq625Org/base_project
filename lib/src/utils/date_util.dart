import 'package:base_project/src/constants/date_constants.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static int getCurrentDay() {
    return DateTime.now().day;
  }

  static String getDate(String time) {
    final dateFormat = DateFormat('MMMM dd, yyyy').format(
      DateTime.parse(time),
    );
    return dateFormat;
  }

  static String getWeekDay(String time) {
    final dateFormat = DateFormat('EEEE').format(
      DateTime.parse(time),
    );
    return dateFormat;
  }

  static String getTime(String time) {
    final dateFormat = DateFormat('hh:MM aa').format(
      DateTime.parse(time),
    );
    return dateFormat;
  }

  static String getTime2(String time) {
    final dateFormat =
        DateFormat.jm().format(DateFormat('hh:mm:ss').parse(time));
    return dateFormat;
  }

  static String getDateAndTime(String dateTime) {
    return '${getDate(dateTime)} ${getTime(dateTime)}';
  }

  static DateTime getCurrentDate() {
    return DateTime.now();
  }

  static String formatDate(String format, DateTime date) {
    final formattedDate = DateFormat(format).format(date);
    return formattedDate;
  }

  static String formatCurrentDate(String format) {
    final now = DateTime.now();
    final formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  static String formatCurrentDateWithAddition(
    String format,
    int additionValue,
  ) {
    final now = DateTime.now().add(Duration(days: additionValue));
    final formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  static String formatStringDate(String strDate, String format) {
    final formattedDate = DateTime.parse(strDate);
    return formatDate(format, formattedDate);
  }

  // Get time difference from current time
  static Duration getTimeDifferenceFromCurrent(DateTime dateTime) {
    final dateTimeNow = DateTime.now();
    final differenceDuration = dateTimeNow.difference(dateTime);
    return differenceDuration;
  }

  static String getDateDuration(Duration duration) {
    var accurateDuration = '';
    if (duration.inDays > 0) {
      accurateDuration = accurateDuration +
          duration.inDays.toString() +
          (duration.inDays > 1 ? ' Days ' : ' Day');
    } else if (duration.inDays == 0 && duration.inHours > 0) {
      accurateDuration = '$accurateDuration${duration.inHours} Hours ';
    } else if (duration.inDays == 0 && duration.inHours == 0) {
      accurateDuration = '$accurateDuration${duration.inMinutes} Minutes';
    }
    return accurateDuration;
  }

  static DateTime convertStringDateToDateTime(String date) {
    return DateTime.parse(date);
  }

  static String convertTimeToAmPm(String timeSlot) {
    String? _timeSlot;
    if (timeSlot.length == 5) {
      _timeSlot = '$timeSlot:00';
    }
    try {
      if (_timeSlot != null) {
        return DateFormat.jm().format(
          DateFormat(DateConstants.HOUR_FORMAT_OTHER).parse(_timeSlot),
        );
      } else {
        return DateFormat.jm().format(
          DateFormat(DateConstants.HOUR_FORMAT_OTHER).parse(timeSlot),
        );
      }
    } catch (_) {
      return '';
    }
  }

  static String convertAmPmToTwentyFour(String timeSlot) {
    return DateFormat('HH:mm')
        .format(DateTime.parse('${StringConstants.sampleDate} $timeSlot'));
  }
}
