import 'package:zamaan/core/utils/extensions/string_to_sentence_case_extension.dart';

enum TimeUnit {
  minute('دقیقه'),
  hour('روز'),
  day('ساعت'),
  week('هفته'),
  month('ماه'),
  year('سال');

  final String _inPersian;

  const TimeUnit(this._inPersian);

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return TimeUnit.minute._inPersian;
        case 1:
          return TimeUnit.hour._inPersian;
        case 2:
          return TimeUnit.day._inPersian;
        case 3:
          return TimeUnit.week._inPersian;
        case 4:
          return TimeUnit.month._inPersian;
        case 5:
          return TimeUnit.year._inPersian;
        default:
          throw Exception('The TimeUnit index is not allowed and defined ');
      }
    } else {
      switch (index) {
        case 0:
          return TimeUnit.minute.name.toSentenceCase();
        case 1:
          return TimeUnit.hour.name.toSentenceCase();
        case 2:
          return TimeUnit.day.name.toSentenceCase();
        case 3:
          return TimeUnit.week.name.toSentenceCase();
        case 4:
          return TimeUnit.month.name.toSentenceCase();
        case 5:
          return TimeUnit.year.name.toSentenceCase();
        default:
          throw Exception('The TimeUnit index is not allowed and defined ');
      }
    }
  }
}
