import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class UserDTO extends BaseEntityAbstraction {
  final String userName;

  final String password;

  final String firstName;

  final String lastName;

  final DateTime birthDate;

  final String emailAddress;

  final String? profileImagePath;

  UserDTO({
    super.id,
    super.description,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    this.profileImagePath,
  });
}
