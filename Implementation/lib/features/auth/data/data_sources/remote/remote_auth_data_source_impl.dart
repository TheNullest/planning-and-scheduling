// ignore_for_file: void_checks

import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zamaan/core/constants/app_texts.dart';
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/remote_exception.dart';
import 'package:zamaan/core/network/connection_checker.dart';
import 'package:zamaan/core/secrets/app_secrets.dart';
import 'package:zamaan/core/utils/current_location.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/data_sources/remote/remote_auth_data_source.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  RemoteAuthDataSourceImpl({
    required ConnectionChecker connectionChecker,
    required SupabaseClient supabaseClient,
  })  : _connectionChecker = connectionChecker,
        _supabaseClient = supabaseClient;

  final ConnectionChecker _connectionChecker;
  final SupabaseClient _supabaseClient;

  GoTrueClient get _auth => _supabaseClient.auth;

  @override
  Session? get currentUserSession => _auth.currentSession;

  @override
  ResultFuture<RemoteUserModel> getCurrentUser() async =>
      tryCatchEither<RemoteUserModel>(
        action: () async {
          if (currentUserSession != null) {
            final userData = await _supabaseClient
                .from('profiles')
                .select()
                .eq('id', currentUserSession!.user.id)
                .single();
            return Right(
              RemoteUserModel.fromJson(userData)
                  .copyWith(emailAddress: currentUserSession!.user.email),
            );
          }

          throw RemoteException(
            message: AppTexts.errors.userNotSignedIn,
            statusCode: '401',
          );
        },
        failureType: FailureType.remote,
      );

  @override
  ResultFuture<RemoteUserModel> signIn(UserSignInParams params) async =>
      _getUser(
        () async => _auth.signInWithPassword(
          password: params.password,
          email: params.email,
        ),
      );

  @override
  ResultFuture<RemoteUserModel> signUp(RemoteUserModel userModel) async =>
      _getUser(
        () async => _auth.signUp(
          password: userModel.password,
          email: userModel.emailAddress,
          data: userModel.toSupabaseDataMap(),
        ),
      );

  @override
  ResultFuture<bool> signOut() async => tryCatchEither(
        action: () async {
          await _auth.signOut();
          return const Right(true);
        },
        failureType: FailureType.remote,
      );

  @override
  ResultFuture<UserResponse> updateUser(RemoteUserModel entity) async =>
      tryCatchEither<UserResponse>(
        action: () async => Right(
          await _auth.updateUser(
            UserAttributes(
              data: entity.toSupabaseDataMap(),
              email: entity.emailAddress,
              password: entity.password,
            ),
          ),
        ),
        failureType: FailureType.remote,
      );

  @override
  ResultFuture<bool> deleteUserAccount() => tryCatchEither<bool>(
        action: () async {
          //Check if the user is authenticated
          if (_auth.currentUser == null) {
            throw Exception(
              AppTexts.errors.cannotDeleteUnauthenticatedUser,
            );
          }

          final response = await http.post(
            Uri.parse(
              '${AppSecrets.supabaseUrl}/rest/v1/rpc/${AppSecrets.deleteUserFunction}',
            ),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${_auth.currentSession?.accessToken}',
            },
            body: jsonEncode({}),
          );

          return response.statusCode == 200
              ? const Right(true)
              : throw RemoteException(
                  message: 'Failed to delete user account: ${response.body}',
                  statusCode: response.statusCode.toString(),
                  errorLocation: getCurrentLocation(isTryCatch: false),
                );
        },
        failureType: FailureType.remote,
      );

  ResultFuture<RemoteUserModel> _getUser(
    Future<AuthResponse> Function() fn,
  ) async =>
      tryCatchEither<RemoteUserModel>(
        action: () async {
          if (!await _connectionChecker.isConnected) {
            throw Exception(AppTexts.errors.noInternetConnection);
          }
          final respnse = await fn();
          return Right(
            RemoteUserModel.fromSupabaseUserJson(respnse.user!.toJson()),
          );
        },
        failureType: FailureType.remote,
      );
}
