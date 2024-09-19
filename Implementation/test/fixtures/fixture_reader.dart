import 'dart:convert';
import 'dart:io';

import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

String fixtures(String fileName) =>
    File('test/fixtures/$fileName').readAsStringSync();

final testJson = fixtures('user.json');
final List<dynamic> testMaps = jsonDecode(testJson);

List<RemoteUserModel> getRemoteUserModels() {
  List<RemoteUserModel> models = [];
  for (var element in testMaps) {
    models.add(RemoteUserModel.fromMap(element));
  }
  return models;
}

List<HiveUserModel> getHiveUserModels() {
  List<HiveUserModel> hiveModels = [];
  for (RemoteUserModel item in getRemoteUserModels()) {
    hiveModels.add(HiveUserModel.fromEntity(item.toEntity()));
  }
  return hiveModels;
}
