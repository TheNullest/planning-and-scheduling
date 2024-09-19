import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';

class HiveInitializer<HiveModel extends BaseEntityAbstraction> {
  static Future<void> init() async {
    final Directory appDocumentsDir =
        Directory('E:\\Flutter.Dart\\HiveFiles\\Zamaan');

    if (!await appDocumentsDir.exists()) {
      await appDocumentsDir.create(recursive: true);
    }
    await Hive.initFlutter(appDocumentsDir.path);
    final List<HiveBaseTypeAdapter> adapters = [
      HiveUserModelAdapter(),
    ];

    for (HiveBaseTypeAdapter adapter in adapters) {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        adapter.registerAdapter();
      }
    }
  }

  ResultFuture<T> operator<T>(
      {Future<T> Function(Box<HiveModel> box)? job, String? boxName}) async {
    return tryCatch<T>(() async {
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<HiveModel>(boxName);
      }
      Box<HiveModel> box = Hive.box<HiveModel>(boxName);
      var done = await job!(box);
      if (box.isOpen) {
        await box.close();
      }
      return Right(done);
    });
  }
}
