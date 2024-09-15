import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

class RemoteUserModel extends UserEntity {
  RemoteUserModel(
      {required super.id,
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
  RemoteUserModel.empty()
      : this(
            id: '1',
            userName: '_empty.userName',
            firstName: '_empty.firstName',
            lastName: '_empty.lastName',
            description: '_empty.description',
            emailAddress: '_empty.emailAddress',
            password: '_empty.password',
            avatarPath: '_empty.avatarPath',
            createdAt: DateTime.parse('2004-06-22T08:52:57.685Z'),
            birthDate: DateTime.parse('1966-07-06T07:56:35.764Z'));

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
          createdAt: DateTime.parse(map['createdAt'] as String),
          birthDate: DateTime.parse(map['birthDate'] as String) as DateTime?,
          description: map['description'] as String?,
          avatarPath: map['avatarPath'] as String?,
        );

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
        'createdAt':
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(createdAt),
        'birthDate':
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(birthDate!),
        'description': description,
        'avatarPath': avatarPath,
      };

  String toJson() => jsonEncode(toMap());
}
