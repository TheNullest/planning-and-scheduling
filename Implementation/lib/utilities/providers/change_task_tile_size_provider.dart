import 'package:flutter/material.dart';
import 'package:zamaan/utilities/enums.dart';

class ChangeTaskTileSizeProvider with ChangeNotifier {
  late TaskTileSizes _tileSize = TaskTileSizes.big;
  TaskTileSizes get tileSize => _tileSize;
  set tileSize(TaskTileSizes selectedTileSize) {
    _tileSize = selectedTileSize;
    notifyListeners();
  }
}
