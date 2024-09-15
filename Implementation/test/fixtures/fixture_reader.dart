import 'dart:convert';
import 'dart:io';

import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

String fixtures(String fileName) =>
    File('test/fixtures/$fileName').readAsStringSync();

final testJson = fixtures('user.json');
final List<dynamic> testMaps = jsonDecode(testJson);
final List<RemoteUserModel> userModels = _getModels();

List<RemoteUserModel> _getModels() {
  List<RemoteUserModel> models = [];
  for (var element in testMaps) {
    models.add(RemoteUserModel.fromMap(element));
  }
  return models;
}
