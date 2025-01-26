import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveServices<HiveModel extends BaseEntityAbstraction> {
  static Future<void> init() async {
    late final Directory appDocumentsDir;
    if (Platform.isWindows) {
      appDocumentsDir = Directory(r'E:\Flutter.Dart\HiveFiles\Zamaan');
    } else if (Platform.isAndroid) {
      appDocumentsDir = await getApplicationDocumentsDirectory();
    }

    if (appDocumentsDir.existsSync()) {
      await appDocumentsDir.create(recursive: true);
    }

    await Hive.initFlutter(appDocumentsDir.path);
    final adapters = <HiveBaseTypeAdapter>[
      LocalUserModelAdapter(),
      GoalLocalModelAdapter(),
      MainTaskLocalModelAdapter(),
      MeasurementUnitLocalModelAdapter(),
      // TaskSchedulerLocalModelAdapter(),
      SubTaskLocalModelAdapter(),
      TagLocalModelAdapter(),
      TimeIntervalLocalModelAdapter(),
    ];

    for (final adapter in adapters) {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        Hive.registerAdapter(adapter);
      }
    }
  }

  ResultFuture<T> operator<T>({
    Future<T> Function(Box<HiveModel> box)? job,
    String? boxName,
  }) async {
    return tryCatchEither<T>(
      action: () async {
        if (!Hive.isBoxOpen(boxName!)) {
          await Hive.openBox<HiveModel>(boxName);
        }
        final box = Hive.box<HiveModel>(boxName);
        final done = await job!(box);
        if (box.isOpen) {
          await box.close();
        }
        return Right(done);
      },
      failureType: FailureType.local,
    );
  }
}
