import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/features/auth/data/data_sources/local/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/local/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class AuthenticationRepositoryImpl extends BaseCRUDOperations<
    UserEntity,
    HiveUserModel,
    HiveAuthenticationDataSourceImpl> implements AuthenticationRepository {
  AuthenticationRepositoryImpl(super.dataSource);

  @override
  HiveUserModel fromEntity(UserEntity entity) =>
      HiveUserModel.fromEntity(entity);

  @override
  UserEntity toEntity(HiveUserModel model) => model.toEntity();
}
