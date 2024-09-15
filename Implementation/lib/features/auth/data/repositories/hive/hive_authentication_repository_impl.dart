import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

//TODO #9 Implement the test HiveAuthenticationRepositoryImpl
class HiveAuthenticationRepositoryImpl
    extends AuthenticationRepository<HiveUserModel> {
  HiveAuthenticationRepositoryImpl(
      {required super.dataSource, required super.hiveModelHelper});
}


// class HiveAuthenticationRepositoryImpl extends AuthenticationRepository {
//   final HiveAuthenticationDataSourceAbstraction _dataSource;

//   HiveAuthenticationRepositoryImpl(this._dataSource);

//   @override
//   ResultFutureVoid createEntity({required UserEntity newEntity}) async =>
//       await _dataSource.createEntity(
//           newEntity: HiveUserModel.fromEntity(newEntity));

//   @override
//   ResultFutureVoid deleteEntity({required String id}) async =>
//       _dataSource.deleteEntity(id: id);

//   @override
//   ResultFuture<List<UserEntity>> getEntities() async {
//     final result = await _dataSource.getEntities();
//     return result
//         .map((either) => either.map((model) => model.toEntity()).toList());
//   }

//   @override
//   ResultFuture<UserEntity> getEntity({required String id}) async =>
//       await _dataSource.getEntity(id: id);

//   @override
//   ResultFutureVoid updateEntity({required UserEntity entity}) async =>
//       _dataSource.updateEntity(entity: HiveUserModel.fromEntity(entity));
// }
