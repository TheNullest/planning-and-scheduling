import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';

abstract class RemoteAuthDataSource {
  Session? get currentUserSession;
  ResultFuture<RemoteUserModel> getCurrentUser();
  ResultFuture<RemoteUserModel> signUp(RemoteUserModel userModel);
  ResultFuture<RemoteUserModel> signIn(UserSignInParams params);
  ResultFuture<UserResponse> updateUser(RemoteUserModel entity);
  ResultFuture<bool> deleteUserAccount();
  ResultFuture<bool> signOut();
}
