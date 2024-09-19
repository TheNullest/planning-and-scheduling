import 'dart:convert';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';

class RemoteUserModel extends HiveUserModel {
  RemoteUserModel(
      {super.id,
      required super.userName,
      required super.password,
      required super.firstName,
      required super.lastName,
      required super.createdAt,
      super.birthDate,
      super.description,
      super.avatarPath,
      required super.emailAddress});

  // For the purpose of testing
  RemoteUserModel.empty() : super.empty();

  factory RemoteUserModel.fromJSON(String source) =>
      RemoteUserModel.fromMap(jsonDecode(source) as JsonDataMap);

  RemoteUserModel.fromMap(JsonDataMap map)
      : this(
          id: map['id'] as String,
          password: map['password'] as String,
          userName: map['userName'] as String,
          firstName: map['firstName'] as String,
          lastName: map['lastName'] as String,
          emailAddress: map['emailAddress'] as String,
          createdAt: DateTime.parse(map['createdAt']),
          birthDate: DateTime.parse(map['birthDate']),
          description: map['description'] as String?,
          avatarPath: map['avatarPath'] as String?,
        );

  @override
  RemoteUserModel copyWith(
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
      RemoteUserModel(
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

  JsonDataMap toMap() => {
        'id': id,
        'userName': userName,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'createdAt': createdAt.toString(),
        'birthDate': birthDate.toString(),
        'description': description,
        'avatarPath': avatarPath,
      };

  String toJson() => jsonEncode(toMap());
}
