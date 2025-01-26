import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';

// Result..
typedef Result<T> = Either<Failure, T>;
typedef ResultFuture<T> = Future<Result<T>>;
typedef ResultFutureVoid = ResultFuture<void>;
typedef FutureVoid = Future<void>;
// ..Result

typedef DataMap = Map<String, dynamic>;
