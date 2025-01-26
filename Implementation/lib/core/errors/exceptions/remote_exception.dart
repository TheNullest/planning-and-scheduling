import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';

/// A class representing a remote failure or error.
class RemoteException extends Failure {
  /// Creates a [RemoteException] with the given [message], [errorLocation], [code], and [statusCode].
  RemoteException({
    required super.message,
    super.errorLocation,
    this.code,
    this.statusCode,
  });

  /// An optional code representing the error.
  final String? code;

  /// An optional status code representing the error.
  final String? statusCode;

  @override
  FailureType get failureType => FailureType.remote;

  /// Returns a list of properties to be used for value comparison.
  @override
  List<Object?> get props => super.props..addAll([code, statusCode]);

  /// Provides a string representation of the [RemoteException].
  @override
  String toString() =>
      '${super.toString()}\n - Code: $code\n - Status Code: $statusCode';
}
