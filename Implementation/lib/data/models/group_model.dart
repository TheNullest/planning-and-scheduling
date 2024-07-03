import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';

part 'group_model.g.dart';

/// Groups such as : sport, reading, working, fun ,...
@HiveType(typeId: 2)
class GroupModel extends HiveObject {
  @HiveField(0)
  final String id;

  /// Default and predefined groups don't have creatorId
  @HiveField(1)
  final UserModel creator;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final Color color;

  @HiveField(5)
  final IconData icon;

  GroupModel.create({
    required this.color,
    required this.icon,
    this.description,
  })  : id = const Uuid().v4(),
        creator = UserModel.create(
            userName: 'userName',
            password: 'password',
            firstName: 'firstName',
            lastName: 'lastName',
            birthDate: DateTime.now(),
            emailAddress: 'emailAddress',
            profileImagePath: 'profileImagePath');

  GroupModel({
    required this.id,
    required this.creator,
    required this.description,
    required this.color,
    required this.icon,
  });
}
