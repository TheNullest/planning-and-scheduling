import 'package:zamaan/core/extensions/string_to_sentence_case_extension.dart';

/// Enum representing different types of repetition for a task.
enum RepetitionType {
  /// Repeats every specified time unit.
  every,

  /// Repeats per a specified interval and time unit.
  per,

  /// Repeats at regular intervals of the specified time unit.
  interval,

  /// Repeats on specific dateTimes.
  specificDateTimes;

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return 'هر';
        case 1:
          return 'به ازای';
        case 2:
          return 'بازه زمانی';
        case 3:
          return 'زمان های مشخص';
        default:
          throw Exception(
            'The RepetitionType index is not allowed and defined ',
          );
      }
    } else {
      switch (index) {
        case 0:
          return RepetitionType.every.name.toSentenceCase();
        case 1:
          return RepetitionType.per.name.toSentenceCase();
        case 2:
          return 'Specific Time Interval';
        case 3:
          return 'Specific DateTimes';
        default:
          throw Exception(
            'The RepetitionType index is not allowed and defined ',
          );
      }
    }
  }
}
