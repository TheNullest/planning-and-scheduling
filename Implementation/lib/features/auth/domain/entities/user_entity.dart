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
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required super.createdAt,
    this.birthDate,
    required this.emailAddress,
    this.avatarPath,
  });

  // For the purpose of testing
  UserEntity.empty()
      : this(
            id: '1',
            userName: '_empty.userName',
            firstName: '_empty.firstName',
            lastName: '_empty.lastName',
            description: '_empty.description',
            emailAddress: '_empty.emailAddress',
            password: '_empty.password',
            avatarPath: '_empty.avatarPath',
            createdAt: DateTime.now());

  @override
  List<Object?> get props => [
        id,
        description,
        userName,
        password,
        firstName,
        lastName,
        birthDate,
        emailAddress,
        avatarPath
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  BaseEntityAbstraction toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
