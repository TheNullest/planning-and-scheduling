import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/models/hive/hive_base_type_adapter_asbtraction.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 0)
class HiveUserModel extends UserEntity {
  HiveUserModel({
    required super.id,
    super.description,
    required super.userName,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.createdAt,
    required super.emailAddress,
    super.birthDate,
    super.avatarPath,
  });

  factory HiveUserModel.fromEntity(UserEntity entity) => HiveUserModel(
      id: entity.id,
      userName: entity.userName,
      password: entity.password,
      firstName: entity.firstName,
      lastName: entity.lastName,
      createdAt: entity.createdAt,
      emailAddress: entity.emailAddress);

  // For the purpose of testing
  HiveUserModel.empty()
      : this(
            id: '1',
            userName: '_empty.userName',
            firstName: '_empty.firstName',
            lastName: '_empty.lastName',
            description: '_empty.description',
            emailAddress: '_empty.emailAddress',
            password: '_empty.password',
            avatarPath: '_empty.profileImagePath',
            createdAt: DateTime.now());

  @override
  List<Object?> get props => [
        id,
        userName,
        password,
        firstName,
        lastName,
        birthDate,
        emailAddress,
        description,
        avatarPath,
        createdAt
      ];

  @override
  UserEntity toEntity() => UserEntity(
      id: id,
      userName: userName,
      password: password,
      firstName: firstName,
      lastName: lastName,
      createdAt: createdAt,
      emailAddress: emailAddress);

  @override
  HiveUserModel fromEntity(BaseEntityAbstraction entity) =>
      HiveUserModel.fromEntity(entity as UserEntity);

  HiveUserModel copyWith(
          {String? id,
          String? userName,
          String? password,
          String? firstName,
          String? lastName,
          DateTime? birthDate,
          DateTime? createdAt,
          String? description,
          String? avatarPath,
          String? emailAddress}) =>
      HiveUserModel(
          id: id ?? this.id,
          userName: userName ?? this.userName,
          password: password ?? this.password,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          birthDate: birthDate ?? this.birthDate,
          createdAt: createdAt ?? this.createdAt,
          description: description ?? this.description,
          avatarPath: avatarPath ?? this.avatarPath,
          emailAddress: emailAddress ?? this.emailAddress);
}
