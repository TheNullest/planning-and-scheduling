class DateTimeHelper {
  DateTimeHelper() {
    _second = DateTime.now().second;
    _minute = DateTime.now().minute;
    _hour = DateTime.now().hour;
    _day = DateTime.now().day;
    _month = DateTime.now().month;
    _year = DateTime.now().year;
  }

  DateTimeHelper.customDateTime(DateTime dateTime) {
    _second = dateTime.second;
    _minute = dateTime.minute;
    _hour = dateTime.hour;
    _day = dateTime.day;
    _month = dateTime.month;
    _year = dateTime.year;
  }

  /// Change value of all the fields by DateTime
  DateTime? changeDateTime({required DateTime dateTime}) {
    _second = dateTime.second;
    _minute = dateTime.minute;
    _hour = dateTime.hour;
    _day = dateTime.day;
    _month = dateTime.month;
    _year = dateTime.year;

    return dateTime;
  }

  /// Get the selected DateTime
  DateTime get dateTime =>
      DateTime(_year, _month, _day, _hour, _minute, _second);

  late int _second;
  int get second => _second;
  set second(int value) {
    if (value < 60 || value >= 0) {
      _second = value;
    } else {
      throw ArgumentError('Invalid second value: $value');
    }
  }

  late int _minute;
  int get minute => _minute;
  set minute(int value) {
    if (value < 60 || value >= 0) {
      _minute = value;
    } else {
      throw ArgumentError('Invalid minute value: $value');
    }
  }

  late int _hour;
  int get hour => _hour;
  set hour(int value) {
    if (value < 25 || value >= 0) {
      _hour = value;
    } else {
      throw ArgumentError('Invalid hour value: $value');
    }
  }

  late int _day;
  int get day => _day;
  set day(int value) {
    if (value < 31 || value > 0) {
      _day = value;
    } else {
      throw ArgumentError('Invalid day value: $value');
    }
  }

  late int _month;
  int get month => _month;
  set month(int value) {
    if (value < 12 || value > 0) {
      _month = value;
    } else {
      throw ArgumentError('Invalid month value: $value');
    }
  }

  late int _year;
  int get year => _year;
  set year(int value) {
    if (value < 1500 || value > 1300) {
      _year = value;
    } else {
      throw ArgumentError('Invalid year value: $value');
    }
  }
}
