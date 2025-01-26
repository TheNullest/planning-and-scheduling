import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';

abstract class AuthenticationRepository {
  ResultFuture<UserEntity> signUp(UserEntity user);
  ResultFuture<UserEntity> signIn(UserSignInParams params);
  ResultFuture<UserEntity> getCurrentUser();
  ResultFuture<bool> deleteUserAccount(UserSignInParams params);
  ResultFutureVoid signOut();
}
