// ignore_for_file: no_default_cases

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/custom_auth_exception.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';
import 'package:zamaan/core/errors/exceptions/local_exception.dart';
import 'package:zamaan/core/errors/exceptions/remote_exception.dart';
import 'package:zamaan/core/errors/exceptions/unexpected_exception.dart';
import 'package:zamaan/core/utils/current_location.dart';
import 'package:zamaan/core/utils/typedef.dart';

/// Executes the given [action] and catches any exceptions that occur,
/// converting them into a [Failure] or a custom exception.
///
/// Parameters:
/// - [action]: The asynchronous or synchronous function to execute.
/// - [failureType]: An optional [FailureType] indicating the type of failure.
/// - [customMessage]: An optional custom message to include in the exception.
///
/// Returns:
/// A `ResultFuture` containing the result or a [Failure].
ResultFuture<T> tryCatchEither<T>({
  required ResultFuture<T> Function() action,
  FailureType? failureType,
  String? customMessage,
}) async {
  // Get the current location for logging or debugging purposes
  final location = getCurrentLocation();

  // Format the custom message if provided
  final formattedMessage =
      customMessage != null ? '\n ** $customMessage **' : '';

  try {
    // Execute the provided action and await its result
    final result = await action();
    return result;
  } on Failure catch (e) {
    return Left(e);
  } on supabase.AuthException catch (e) {
    // Handle specific supabase authentication exceptions
    final exception = CustomAuthException(
      errorLocation: location,
      code: e.code,
      statusCode: e.statusCode,
      message: '${e.message} $formattedMessage',
    );
    return Left(exception);
  } on supabase.PostgrestException catch (e) {
    // Handle specific supabase Postgrest exceptions
    final exception = RemoteException(
      errorLocation: location,
      code: e.code,
      message: formattedMessage.isNotEmpty
          ? '${e.message} $formattedMessage'
          : e.message,
    );
    return Left(exception);
  } on TimeoutException catch (e) {
    // Handle timeout exceptions
    final exceptionMessage = formattedMessage.isNotEmpty
        ? 'Timeout: $e $formattedMessage'
        : 'Timeout: $e';
    final exception = RemoteException(
      errorLocation: location,
      message: exceptionMessage,
    );
    return Left(exception);
  } on FormatException catch (e) {
    // Handle format exceptions
    final exceptionMessage = formattedMessage.isNotEmpty
        ? 'Format error: $e $formattedMessage'
        : 'Format error: $e';
    final exception = LocalException(
      message: exceptionMessage,
      errorLocation: location,
    );
    return Left(exception);
  } catch (e) {
    // Handle any other exceptions
    final exceptionMessage =
        formattedMessage.isNotEmpty ? '$e $formattedMessage' : e.toString();
    final exception =
        _mapFailureTypeToException(failureType, exceptionMessage, location);
    return Left(exception);
  }
}

/// Executes a given action and catches any exceptions that occur, throwing a
/// `LocalException` with an optional custom message and failure type.
///
/// The function takes a required action callback, which is executed within a
/// try-catch block. If an exception is thrown during the execution of the action,
/// it is caught and rethrown as a `LocalException` with additional context.
///
/// - Parameters:
///   - action: A callback function that returns a value of type `T`.
///   - failureType: An optional parameter to specify the type of failure.
///   - customMessage: An optional custom message to include in the exception.
///
/// - Returns: The result of the action callback if no exception is thrown.
///
/// - Throws: A `LocalException` with a message containing the original exception
///   message and an optional custom message.
T tryCatchSimple<T>({
  required T Function() action,
  FailureType? failureType,
  String? customMessage,
}) {
  try {
    // Execute the action callback and return its result
    return action();
  } catch (e) {
    // Construct the exception message with the optional custom message
    final exceptionMessage =
        (customMessage != null ? '\n ** $customMessage ** ' : ' ') +
            e.toString();

    // Throw a LocalException with the constructed message and current location
    throw LocalException(
      message: exceptionMessage,
      errorLocation: getCurrentLocation(),
    );
  }
}

/// Maps a [FailureType] to a corresponding [Failure].
///
/// This function takes a [FailureType], a message, and a location, and returns
/// an appropriate [Failure] based on the [FailureType].
///
/// - If the [failureType] is [FailureType.local], it returns a [LocalException].
/// - If the [failureType] is [FailureType.remote], it returns a [RemoteException].
/// - For any other [failureType], it returns an [UnexpectedException].
///
/// Parameters:
/// - [failureType]: The type of failure that occurred.
/// - [message]: A message describing the failure.
/// - [location]: The location where the failure occurred.
///
/// Returns:
/// A [Failure] corresponding to the given [failureType].
Failure _mapFailureTypeToException(
  FailureType? failureType,
  String message,
  String location,
) {
  switch (failureType) {
    case FailureType.local:
      // Return a LocalException for local failures
      return LocalException(
        message: message,
        errorLocation: location,
      );
    case FailureType.remote:
      // Return a RemoteException for remote failures
      return RemoteException(
        message: message,
        errorLocation: location,
      );
    default:
      // Return an UnexpectedException for any other failure types
      return UnexpectedException(
        message: message,
        errorLocation: location,
      );
  }
}
