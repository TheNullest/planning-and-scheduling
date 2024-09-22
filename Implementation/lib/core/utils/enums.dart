enum Priority {
  critical(1),
  high(2),
  medium(3),
  low(4),
  optional(5);

// customize index
  const Priority(index);

  static Priority fromIndex(int index) {
    switch (index) {
      case 0:
        return Priority.critical;
      case 1:
        return Priority.high;
      case 2:
        return Priority.medium;
      case 3:
        return Priority.low;
      case 4:
      default:
        return Priority.optional;
    }
  }
}

/// Status == 0 => notStarted\
/// Status == 1 => inProgress\
/// Status == 2 => completed
enum Status { notStarted, inProgress, completed }

enum RepetitionInterval {
  minutely,
  hourly,
  daily,
  weekly,
  monthly,
  yearly;

  static RepetitionInterval fromIndex(int index) {
    switch (index) {
      case 0:
        return RepetitionInterval.minutely;
      case 1:
        return RepetitionInterval.hourly;
      case 2:
        return RepetitionInterval.daily;
      case 3:
        return RepetitionInterval.weekly;
      case 4:
        return RepetitionInterval.monthly;
      case 5:
        return RepetitionInterval.yearly;
      default:
        throw Exception(
            'The RepetitionInterval index is not allowed and defined ');
    }
  }
}

enum WeekDays {
  saturday(1),
  sunday(2),
  monday(3),
  tuesday(4),
  wednsday(5),
  thursday(6),
  friday(7);

// customize index
  const WeekDays(index);

  static WeekDays fromIndex(int index) {
    switch (index) {
      case 1:
        return WeekDays.saturday;
      case 2:
        return WeekDays.sunday;
      case 3:
        return WeekDays.monday;
      case 4:
        return WeekDays.tuesday;
      case 5:
        return WeekDays.wednsday;
      case 6:
        return WeekDays.thursday;
      case 7:
        return WeekDays.friday;
      default:
        throw Exception('The WeekDays index is not allowed and defined ');
    }
  }
}

enum ButtonStates {
  exited,
  hoverd,
  tapped,
  tapDown,
  tapUp,
  longPressed,
  longPressStart,
  longPressEnd,
  activated,
  disabled,
  dragged,
  dropped,
}

enum TaskTileSizes {
  big,
  small,
}
