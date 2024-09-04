import 'package:intl/intl.dart';

extension DateTimeTostring on String {
  String customTostring(DateTime dateTime) {
    return 'fff';
  }
}

class DateTimeToString {
  bool? year = false;
  bool? month = false;
  bool? week = false;
  bool? day = false;
  bool? hour = false;
  bool? minute = false;
  bool? second = false;
  DateTimeToString({
    this.year,
    this.month,
    this.week,
    this.day,
    this.hour,
    this.minute,
    this.second,
  });

  String toDate({DateTime? dateTime}) =>
      DateFormat('yyyy/MM/dd').format(dateTime!);

  String toTimeWithSecond({DateTime? dateTime}) =>
      DateFormat('HH:MM:ss').format(dateTime!);

  String toTimeWithoutSecond({DateTime? dateTime}) =>
      DateFormat('HH:MM').format(dateTime!);

  String durationToDate({Duration? duration}) =>
      '${duration!.inDays} ${durationToTimeWithSecond(duration: duration)}';

  String durationToTimeWithSecond({Duration? duration}) {
    final int second = duration!.inSeconds.remainder(60);
    return ' ${durationToTimeWithoutSecond(duration: duration)}:${second > 9 ? "" : 0}$second';
  }

  String dayDurationToTimeWithSecond({Duration? duration}) {
    final int second = duration!.inSeconds.remainder(60);
    return ' ${dayDurationToTimeWithoutSecond(duration: duration)}:${second > 9 ? "" : 0}$second';
  }

  String dayDurationToTimeWithoutSecond({Duration? duration}) {
    final int day = duration!.inDays.remainder(4000);
    final int hour = duration.inHours.remainder(24);
    final int minute = duration.inMinutes.remainder(60);
    return ' ${day > 9 ? "" : 0}$day:${hour > 9 ? "" : 0}$hour:${minute > 9 ? "" : 0}$minute';
  }

  String durationToTimeWithoutSecond({Duration? duration}) {
    final int hour = duration!.inHours.remainder(1000000);
    final int minute = duration.inMinutes.remainder(60);
    return ' ${hour > 9 ? "" : 0}$hour:${minute > 9 ? "" : 0}$minute';
  }

  String _toString(int outPutType, DateTime dateTime) {
    switch (outPutType) {
      case 1:
        {
          return DateFormat('yyyy/MM/dd').format(dateTime);
        }
      case 2:
        {
          return DateFormat('HH:MM:ss').format(dateTime);
        }
      case 3:
        {
          return DateFormat('HH:MM').format(dateTime);
        }
      default:
        return '';
    }
  }
}
