import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';

/// A class representing an unexpected failure or error.
class UnexpectedException extends Failure {
  /// Creates an [UnexpectedException] with the given [message] and [errorLocation].
  UnexpectedException({
    required super.message,
    super.errorLocation,
  });

  @override
  FailureType get failureType => FailureType.unexpected;
}
