import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

part 'local_user_model.g.dart';

@HiveType(typeId: 0)
class LocalUserModel extends UserEntity {
  LocalUserModel({
    required super.userName,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.emailAddress,
    super.id,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.birthDate,
    super.avatarPath,
  });

  // For the purpose of testing
  LocalUserModel.empty() : super.empty();

  factory LocalUserModel.fromEntity(UserEntity entity) => LocalUserModel(
        id: entity.id,
        userName: entity.userName,
        password: entity.password,
        firstName: entity.firstName,
        lastName: entity.lastName,
        description: entity.description,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        birthDate: entity.birthDate,
        avatarPath: entity.avatarPath,
        emailAddress: entity.emailAddress,
      );
  factory LocalUserModel.fromRemote(RemoteUserModel entity) => LocalUserModel(
        id: entity.id,
        userName: entity.userName,
        password: entity.password,
        firstName: entity.firstName,
        lastName: entity.lastName,
        description: entity.description,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        birthDate: entity.birthDate,
        avatarPath: entity.avatarPath,
        emailAddress: entity.emailAddress,
      );

  @override
  LocalUserModel copyWith({
    String? id,
    int? order,
    String? userName,
    String? password,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    String? avatarPath,
    String? emailAddress,
  }) =>
      LocalUserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        avatarPath: avatarPath ?? this.avatarPath,
        emailAddress: emailAddress ?? this.emailAddress,
      );
}
