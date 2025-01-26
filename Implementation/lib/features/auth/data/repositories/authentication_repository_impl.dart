import 'package:dartz/dartz.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/errors/exceptions/remote_exception.dart';
import 'package:zamaan/core/network/connection_checker.dart';
import 'package:zamaan/core/utils/fold_either.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:zamaan/features/auth/data/data_sources/remote/remote_auth_data_source.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';
import 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required RemoteAuthDataSource remoteDataSource,
    required LocalAuthDataSource localDataSource,
    required ConnectionChecker connectionChecker,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _connectionChecker = connectionChecker;

  final RemoteAuthDataSource _remoteDataSource;
  final LocalAuthDataSource _localDataSource;
  final ConnectionChecker _connectionChecker;

  @override
  ResultFuture<UserEntity> getCurrentUser() async => tryCatchEither<UserEntity>(
        action: () async => _executeBasedOnConnection<UserEntity>(
          onConnectedAction: () async => _remoteDataSource.getCurrentUser(),
          onNotConnectedAction: () async => _localDataSource.getCurrentUser(),
        ),
      );

  @override
  ResultFuture<UserEntity> signIn(UserSignInParams params) async =>
      tryCatchEither(
        action: () async => _executeBasedOnConnection<UserEntity>(
          onConnectedAction: () async {
            final result = await _remoteDataSource.signIn(params);
            final userEntity = result;
            await _localDataSource.storeCurrentUser(
              LocalUserModel.fromEntity(
                userEntity.fold(
                  (left) => throw left,
                  (right) => right,
                ),
              ),
            );

            return userEntity;
          },
          onNotConnectedAction: () => _throwNoConnectionException('signIn'),
        ),
      );

  @override
  ResultFutureVoid signOut() async => tryCatchEither(
        action: () async => _executeBasedOnConnection<void>(
          onConnectedAction: () async {
            await _remoteDataSource.signOut();
            await _localDataSource.signOut();
            return const Right(null);
          },
          onNotConnectedAction: () async => _localDataSource.signOut(),
        ),
      );

  @override
  ResultFuture<UserEntity> signUp(UserEntity user) async => tryCatchEither(
        action: () async => _executeBasedOnConnection<UserEntity>(
          onConnectedAction: () async {
            final result = await _remoteDataSource
                .signUp(RemoteUserModel.fromEntity(user));
            final userEntity = result
                .fold(
                  (left) => throw left,
                  (right) => right,
                )
                .toEntity();
            await _localDataSource.storeCurrentUser(
              LocalUserModel.fromRemote(
                foldEither<RemoteUserModel>(result),
              ),
            );
            return Right(userEntity);
          },
          onNotConnectedAction: () => _throwNoConnectionException('signUp'),
        ),
      );

  @override
  ResultFuture<bool> deleteUserAccount(UserSignInParams params) {
    // TODO: implement deleteUserAccount
    throw UnimplementedError();
  }

  ResultFuture<T> _executeBasedOnConnection<T>({
    required ResultFuture<T> Function() onConnectedAction,
    required ResultFuture<T> Function() onNotConnectedAction,
  }) async {
    // TODO: improve this method for displaying an appropriate message when not connected to the internet and no exception is thrown
    final isConnected = await _connectionChecker.isConnected;
    if (isConnected) {
      return onConnectedAction();
    }
    return onNotConnectedAction();
  }

  Never _throwNoConnectionException(String location) => throw RemoteException(
        message: 'No internet connection!',
      );
}
