import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/utils/typedef.dart';

ResultFuture<T> tryCatch<T>(Future<T> Function() action) async {
  try {
    return Right(await action());
  } on HiveFailure {
    rethrow;
  } catch (e) {
    return Left(HiveFailure(e.toString()));
  }
}
