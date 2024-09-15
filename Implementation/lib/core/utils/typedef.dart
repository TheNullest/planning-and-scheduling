import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/failure.dart';

// Result..
typedef Result<T> = Either<Failure, T>;
typedef ResultFuture<T> = Future<Result<T>>;
typedef ResultFutureVoid = ResultFuture<void>;
// ..Result

typedef JsonDataMap = Map<String, dynamic>;
