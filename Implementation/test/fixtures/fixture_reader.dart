import 'dart:convert';
import 'dart:io';

import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

String fixtures(String fileName) =>
    File('test/fixtures/$fileName').readAsStringSync();

final testJson = fixtures('user.json');
final List<dynamic> testMaps = jsonDecode(testJson) as List<dynamic>;

List<RemoteUserModel> getRemoteUserModels() {
  final models = <RemoteUserModel>[];
  for (final element in testMaps) {
    models.add(
      RemoteUserModel.fromSupabaseUserJson(element as Map<String, dynamic>),
    );
  }
  return models;
}

List<LocalUserModel> getHiveUserModels() {
  final hiveModels = <LocalUserModel>[];
  for (final item in getRemoteUserModels()) {
    hiveModels.add(LocalUserModel.fromEntity(item.toEntity()));
  }
  return hiveModels;
}
