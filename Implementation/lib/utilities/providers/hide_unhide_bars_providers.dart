import 'package:flutter/material.dart';

class HideUnhideBarsProvider extends ChangeNotifier {
  late bool _barsHide = true;
  bool get barsDisplay => _barsHide;
  set barsDisplay(bool hide) {
    _barsHide = hide;
    notifyListeners();
  }
}
