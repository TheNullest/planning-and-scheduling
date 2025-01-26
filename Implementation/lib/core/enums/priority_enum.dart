import 'package:zamaan/core/extensions/string_to_sentence_case_extension.dart';

enum Priority {
  critical,
  high,
  medium,
  low,
  optional;

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return 'بحرانی';
        case 1:
          return 'بالا';
        case 2:
          return 'میانی';
        case 3:
          return 'پایین';
        case 4:
          return 'دلخواه';
        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    } else {
      switch (index) {
        case 0:
          return Priority.critical.name.toSentenceCase();
        case 1:
          return Priority.high.name.toSentenceCase();
        case 2:
          return Priority.medium.name.toSentenceCase();
        case 3:
          return Priority.low.name.toSentenceCase();
        case 4:
          return Priority.optional.name.toSentenceCase();
        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    }
  }
}
