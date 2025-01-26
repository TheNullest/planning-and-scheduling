import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';

class UserEntity extends BaseEntityAbstraction {
  UserEntity({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.userId,
    super.description, // as user bio in here
    this.birthDate,
    this.avatarPath,
  });

// For the purpose of testing
  UserEntity.empty()
      : this(
          userName: '_empty.userName',
          firstName: '_empty.firstName',
          lastName: '_empty.lastName',
          description: '_empty.description',
          emailAddress: '_empty.emailAddress',
          password: '_empty.password',
          avatarPath: '_empty.avatarPath',
          birthDate: DateTime(1989, 12, 23, 16, 53, 37, 532, 444),
        );

  @HiveField(4)
  final String userName;

  @HiveField(5)
  final String password;

  @HiveField(6)
  final String firstName;

  @HiveField(7)
  final String lastName;

  @HiveField(8)
  final String emailAddress;

  @HiveField(9)
  final DateTime? birthDate;

  @HiveField(10)
  final String? avatarPath;

  @override
  UserEntity copyWith({
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
      UserEntity(
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
        updatedAt: updatedAt,
        emailAddress: emailAddress,
      );

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
        createdAt,
        updatedAt,
      ];
}
