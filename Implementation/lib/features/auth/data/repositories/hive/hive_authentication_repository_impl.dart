import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/data_sources/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

//TODO #9 Implement the test HiveAuthenticationRepositoryImpl
class HiveAuthenticationRepositoryImpl extends AuthenticationRepository {
  final HiveAuthenticationDataSourceImpl _dataSource;

  HiveAuthenticationRepositoryImpl(HiveAuthenticationDataSourceImpl dataSource)
      : _dataSource = dataSource;

  @override
  ResultFutureVoid createEntity({required UserEntity newEntity}) async {
    return tryCatch<void>(
      () async => await _dataSource.createEntity(
          newEntity: HiveUserModel.fromEntity(newEntity)),
    );
  }

  @override
  ResultFuture<List<UserEntity>> getEntities() async {
    final result = await _dataSource.getEntities();
    return result.map((either) =>
        either.map<UserEntity>((model) => model.toEntity()).toList());
  }

  @override
  ResultFuture<UserEntity> getEntity({required String id}) async {
    final Result<HiveUserModel> result = await _dataSource.getEntity(id: id);
    return result.map((model) => model.toEntity());
  }

  @override
  ResultFutureVoid updateEntity({required UserEntity entity}) async =>
      await _dataSource.updateEntity(entity: HiveUserModel.fromEntity(entity));

  @override
  ResultFutureVoid deleteEntity({required String id}) async =>
      await _dataSource.deleteEntity(id: id);

  @override
  ResultFutureVoid deleteAllSelected(List<String> keys) async {
    return await _dataSource.deleteAllSelected(keys);
  }
}
