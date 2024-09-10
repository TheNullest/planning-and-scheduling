import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/base_failure.dart';
import 'package:zamaan/features/main_task/domain/entities/main_task_entity.dart';

abstract class MainTaskRepo {
  Future<Either<BaseFailure, List<MainTaskEntity>>> getAll();
}
