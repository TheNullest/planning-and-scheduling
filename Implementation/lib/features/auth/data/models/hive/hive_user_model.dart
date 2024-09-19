import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 0)
class HiveUserModel extends UserEntity {
  HiveUserModel({
    super.id,
    super.description,
    super.createdAt,
    required super.userName,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.emailAddress,
    super.birthDate,
    super.avatarPath,
  });

  // For the purpose of testing
  HiveUserModel.empty() : super.empty();

  factory HiveUserModel.fromEntity(UserEntity entity) => HiveUserModel(
      id: entity.id,
      userName: entity.userName,
      password: entity.password,
      firstName: entity.firstName,
      lastName: entity.lastName,
      description: entity.description,
      createdAt: entity.createdAt,
      birthDate: entity.birthDate,
      avatarPath: entity.avatarPath,
      emailAddress: entity.emailAddress);

  @override
  UserEntity toEntity() => UserEntity(
      id: id,
      userName: userName,
      description: description,
      avatarPath: avatarPath,
      birthDate: birthDate,
      password: password,
      firstName: firstName,
      lastName: lastName,
      createdAt: createdAt,
      emailAddress: emailAddress);

  @override
  HiveUserModel fromEntity(BaseEntityAbstraction entity) =>
      HiveUserModel.fromEntity(entity as UserEntity);
}
