import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';

/// A class representing a local failure or error.
class LocalException extends Failure {
  /// Creates a [LocalException] with the given [message] and [errorLocation].
  LocalException({
    required super.message,
    super.errorLocation,
  });

  @override
  FailureType get failureType => FailureType.local;
}
