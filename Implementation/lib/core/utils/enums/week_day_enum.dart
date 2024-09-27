import 'package:zamaan/core/utils/extensions/string_to_sentence_case_extension.dart';

/// The week starts from `Saturday`, and the index number starts from `0`
enum WeekDay {
  /// Index 0
  saturday('شنبه'),

  /// Index 1
  sunday('یکشنبه'),

  /// Index 2
  monday('دوشنبه'),

  /// Index 3
  tuesday('سه‌شنبه'),

  /// Index 4
  wednesday('چهارشنبه'),

  /// Index 5
  thursday('پنج‌شنبه'),

  /// Index 6
  friday('جمعه');

  final String _inPersian;

  const WeekDay(this._inPersian);

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return WeekDay.saturday._inPersian;
        case 1:
          return WeekDay.sunday._inPersian;
        case 2:
          return WeekDay.monday._inPersian;
        case 3:
          return WeekDay.tuesday._inPersian;
        case 4:
          return WeekDay.wednesday._inPersian;
        case 5:
          return WeekDay.thursday._inPersian;
        case 6:
          return WeekDay.friday._inPersian;
        default:
          throw Exception('The WeekDays index is not allowed and defined');
      }
    } else {
      switch (index) {
        case 0:
          return WeekDay.saturday.name.toSentenceCase();
        case 1:
          return WeekDay.sunday.name.toSentenceCase();
        case 2:
          return WeekDay.monday.name.toSentenceCase();
        case 3:
          return WeekDay.tuesday.name.toSentenceCase();
        case 4:
          return WeekDay.wednesday.name.toSentenceCase();
        case 5:
          return WeekDay.thursday.name.toSentenceCase();
        case 6:
          return WeekDay.friday.name.toSentenceCase();
        default:
          throw Exception('The WeekDays index is not allowed and defined');
      }
    }
  }
}
