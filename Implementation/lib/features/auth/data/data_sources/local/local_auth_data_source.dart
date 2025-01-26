import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

abstract class LocalAuthDataSource {
  ResultFuture<LocalUserModel> getCurrentUser();
  ResultFutureVoid storeCurrentUser(LocalUserModel user);
  ResultFutureVoid signOut();
}
