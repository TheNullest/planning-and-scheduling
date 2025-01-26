import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/remote_exception.dart';

/// A class representing an authentication failure or error.
class CustomAuthException extends RemoteException {
  /// Creates an [CustomAuthException] with the given [message], [errorLocation], [code], and [statusCode].
  CustomAuthException({
    required super.message,
    super.errorLocation,
    super.code,
    super.statusCode,
  });

  @override
  FailureType get failureType => FailureType.authentication;
}
