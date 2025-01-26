// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

class RemoteUserModel extends LocalUserModel {
  RemoteUserModel({
    required super.userName,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.createdAt,
    required super.emailAddress,
    super.id,
    super.updatedAt,
    super.birthDate,
    super.description,
    super.avatarPath,
  });

  // For the purpose of testing
  RemoteUserModel.empty() : super.empty();

  factory RemoteUserModel.fromEntity(UserEntity entity) => RemoteUserModel(
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

  factory RemoteUserModel.fromJson(DataMap map) {
    return tryCatchSimple<RemoteUserModel>(
      action: () => RemoteUserModel(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'] as String)
            : null,
        description: map['description'] as String? ?? '',
        userName: map['user_name'] as String,
        firstName: map['first_name'] as String? ?? '',
        lastName: map['last_name'] as String? ?? '',
        password: '',
        birthDate: DateTime.parse(map['birth_date'] as String),
        avatarPath: map['avatar_path'] as String? ?? '',
        emailAddress: map['email'] as String? ?? '',
      ),
    );
  }

  factory RemoteUserModel.fromSupabaseUserJson(DataMap map) {
    return RemoteUserModel(
      id: map['id'] as String,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      description: map['user_metadata']['description']! as String? ?? '',
      userName: map['user_metadata']['user_name'] as String,
      firstName: map['user_metadata']['first_name'] as String? ?? '',
      lastName: map['user_metadata']['last_name'] as String? ?? '',
      password: map['password'] as String? ?? '',
      birthDate: DateTime.parse(map['user_metadata']['birth_date'] as String),
      avatarPath: map['user_metadata']['avatar_path'] as String? ?? '',
      emailAddress: map['email'] as String,
    );
  }

  @override
  RemoteUserModel copyWith({
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
      RemoteUserModel(
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

  DataMap toMap() => {
        'id': id,
        'user_name': userName,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'email_address': emailAddress,
        'created_at': createdAt.toString(),
        'birth_date': birthDate.toString(),
        'updated_at': birthDate.toString(),
        'description': description,
        'avatar_path': avatarPath,
      };

  DataMap toSupabaseDataMap() {
    return {
      'created_at': createdAt.toIso8601String(),
      'description': description,
      'user_name': userName,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate!.toIso8601String(),
      'avatar_path': avatarPath,
    };
  }

  String toJson() => jsonEncode(toMap());
}
