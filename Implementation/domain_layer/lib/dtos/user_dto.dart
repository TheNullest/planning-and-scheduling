import 'package:data_layer/models/user_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class UserDTO extends BaseDTOAbstraction<UserModel> {
  final String userName;

  final String password;

  final String firstName;

  final String lastName;

  final DateTime birthDate;

  final String emailAddress;

  final String? profileImagePath;

  UserDTO({
    required super.id,
    super.description,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    this.profileImagePath,
  });

  factory UserDTO.fromModel({
    required UserModel model,
  }) =>
      UserDTO(
          id: model.id,
          description: model.description,
          userName: model.userName,
          password: model.password,
          firstName: model.firstName,
          lastName: model.lastName,
          birthDate: model.birthDate,
          emailAddress: model.emailAddress,
          profileImagePath: model.profileImagePath);

  @override
  UserModel toModel() => UserModel(
      id: id,
      description: description,
      userName: userName,
      password: password,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      emailAddress: emailAddress,
      profileImagePath: profileImagePath);
}
