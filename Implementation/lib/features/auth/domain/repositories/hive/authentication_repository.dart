import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationRepository<HiveModel extends UserEntity>
    extends BaseRepositoryAsbtraction<UserEntity, HiveModel> {
  AuthenticationRepository(
      {required super.dataSource, required super.hiveModelHelper});
}
