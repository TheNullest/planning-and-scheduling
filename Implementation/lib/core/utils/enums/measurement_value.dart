import 'package:zamaan/core/utils/extensions/string_to_sentence_case_extension.dart';

enum MeasurementValue {
  minimum,
  average,
  maximum,
  ;

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return "کمینه";
        case 1:
          return "میانگین";
        case 2:
          return "بیشینه";
        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    } else {
      switch (index) {
        case 0:
          return MeasurementValue.minimum.name.toSentenceCase();
        case 1:
          return MeasurementValue.average.name.toSentenceCase();
        case 2:
          return MeasurementValue.maximum.name.toSentenceCase();
        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    }
  }
}
