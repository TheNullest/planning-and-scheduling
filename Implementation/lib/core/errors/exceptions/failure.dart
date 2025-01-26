import 'package:equatable/equatable.dart';
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/extensions/string_to_sentence_case_extension.dart';
import 'package:zamaan/core/utils/current_location.dart'; // Import the getCurrentLocation function

/// An abstract class representing a failure or error.
///
/// This class extends [Equatable] to allow for value comparison and implements
/// [Exception] to be used as an exception type.
abstract class Failure extends Equatable implements Exception {
  /// Creates a [Failure] with the given [message] and [errorLocation].
  Failure({
    required this.message,
    String? errorLocation,
  }) : errorLocation = errorLocation ?? getCurrentLocation();

  /// A message describing the failure.
  final String message;

  /// The location where the failure occurred.
  final String errorLocation;

  FailureType get failureType;

  @override
  List<Object?> get props => [message, errorLocation];

  /// Provides a string representation of the [Failure].
  @override
  String toString() =>
      ' Exception Type : ${failureType.toString().toSentenceCase()}\n - Error Message : $message\n - Error Location : $errorLocation';
}
