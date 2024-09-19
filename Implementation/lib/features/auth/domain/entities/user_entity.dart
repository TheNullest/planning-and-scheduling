import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class UserEntity extends BaseEntityAbstraction {
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

  UserEntity({
    super.id,
    super.description,
    super.createdAt,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.birthDate,
    required this.emailAddress,
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
            birthDate: DateTime(1989, 12, 23, 16, 53, 37, 532, 444));

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
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    throw UnimplementedError();
  }

  @override
  BaseEntityAbstraction toEntity() {
    throw UnimplementedError();
  }

  UserEntity copyWith(
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
      UserEntity(
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
