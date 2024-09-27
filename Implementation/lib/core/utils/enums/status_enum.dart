import 'package:zamaan/core/utils/extensions/string_to_sentence_case_extension.dart';

/// Status == 0 => notStarted\
/// Status == 1 => inProgress\
/// Status == 2 => completed
enum Status {
  notStarted,
  inProgress,
  completed;

  static String toStringCustome(int index, {bool inPersian = false}) {
    if (inPersian) {
      switch (index) {
        case 0:
          return "آغاز نشده";
        case 1:
          return "در حال انجام";
        case 2:
          return "پایان یافته";
        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    } else {
      switch (index) {
        case 0:
          return Status.notStarted.name.toSentenceCase();
        case 1:
          return Status.inProgress.name.toSentenceCase();
        case 2:
          return Status.completed.name.toSentenceCase();

        default:
          throw Exception('The Priority index is not allowed and defined');
      }
    }
  }
}
